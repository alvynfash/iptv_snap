import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:get/route_manager.dart';
import 'package:iptv_snap/models/m3uGenericEntryExt.dart';

class PlayerScreen extends StatefulWidget {
  PlayerScreen({Key key}) : super(key: key);

  @override
  _PlayerScreenState createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  OverlayState state;
  OverlayEntry entry;
  bool isLoading;
  VlcPlayerController videoViewController;

  @override
  void initState() {
    isLoading = true;

    videoViewController = VlcPlayerController(
      onInit: () async {
        print('init video .....');
        await Future.delayed(Duration(milliseconds: 700)).then((value) {
          videoViewController?.play();
          setState(() {
            isLoading = false;
          });
        });
      },
    );

    videoViewController.addListener(
      () {
        switch (videoViewController.playingState) {
          case PlayingState.BUFFERING:
            print('buffering video.....');
            break;
          case PlayingState.PLAYING:
            print('playing video.....');
            break;
          case PlayingState.STOPPED:
            print('stopped video.....');
            break;
        }
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('rebuild');
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              child: Positioned(
                left: 0,
                right: 0,
                top: 0,
                bottom: 0,
                child: RotatedBox(
                  quarterTurns: 3,
                  child: VlcPlayer(
                    aspectRatio: 16 / 9,
                    url: (Get.arguments as M3uGenericEntryExt).link,
                    controller: videoViewController,
                  ),
                ),
              ),
            ),
            Opacity(
              opacity: isLoading ? 1 : 0,
              child: RotatedBox(
                quarterTurns: 1,
                child: SpinKitWave(
                  size: 35,
                  color: Colors.red,
                ),
              ),
            ),
            GestureDetector(
              onTap: () => _showOverlay(
                uiContext: context,
                onTimeout: () => _closeOverlay(),
              ),
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showOverlay({
    @required BuildContext uiContext,
    @required Function onTimeout,
  }) async {
    if (state != null || entry != null) return;

    state = Overlay.of(uiContext);
    entry = OverlayEntry(
      builder: (context) => Positioned(
        top: 0,
        bottom: 0,
        right: 0,
        left: 0,
        child: SafeArea(
          child: RotatedBox(
            quarterTurns: 3,
            child: Opacity(
              opacity: .75,
              child: Material(
                color: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.close,
                              size: 30,
                              color: Colors.white.withOpacity(.6),
                            ),
                            onPressed: () {
                              _closeOverlay();
                              _goBack();
                            },
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.arrow_drop_down_circle,
                              size: 40,
                              color: Colors.white.withOpacity(.6),
                            ),
                            onPressed: () => _closeOverlay(),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FlatButton(
                            onPressed: () {
                              _closeOverlay();
                              _goBack();
                              Get.defaultDialog(
                                  title: 'Sent',
                                  middleText:
                                      'Thanks for notifying us. \nOur team would get right on it.');
                            },
                            color: Colors.red.withOpacity(.75),
                            textColor: Colors.white,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.thumb_down,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );

    state.insert(entry);
  }

  void _closeOverlay() {
    if (state == null || entry == null) return;

    entry?.remove();

    entry = null;
    state = null;
  }

  void _goBack() {
    Get.back();
  }
}

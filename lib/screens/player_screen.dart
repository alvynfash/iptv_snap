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
  OverlayState _state;
  OverlayEntry _entry;
  bool _isLoading;
  VlcPlayerController _videoViewController;
  // bool isOverlayOpen = false;

  @override
  void initState() {
    _isLoading = true;

    _videoViewController = VlcPlayerController(
      onInit: () async {
        print('init video .....');
        await Future.delayed(Duration(milliseconds: 700)).then((value) {
          _videoViewController?.play();
          setState(() {
            _isLoading = false;
          });
        });
      },
    );

    _videoViewController.addListener(
      () {
        switch (_videoViewController.playingState) {
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
        // if (_videoViewController.playingState != PlayingState.BUFFERING) {
        //   // if (_isLoading) {
        //   //   setState(() {
        //   //     _isLoading = false;
        //   //   });
        //   // }
        //   print('buffering .....');
        // }
        // else {
        //   if (!_isLoading) {
        //     setState(() {
        //       _isLoading = true;
        //     });
        //   }
        // }
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
        // bottom: false,
        // left: false,
        // right: false,
        child: Stack(
          children: [
            // Container(
            //   child: Align(
            //     alignment: Alignment.center,
            //     child: RotatedBox(
            //       quarterTurns: 3,
            //       child: VlcPlayer(
            //         aspectRatio: 2,
            //         url:
            //             //  Get.arguments.toString(),
            //             // 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
            //             'http://pro.waldi2017.com:8789/live/110020965298006/61218131/21533.m3u8',
            //         controller: _videoViewController,
            //       ),
            //     ),
            //   ),
            // ),
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
                    controller: _videoViewController,
                  ),
                ),
              ),
            ),
            Opacity(
              opacity: _isLoading ? 1 : 0,
              child: RotatedBox(
                quarterTurns: 1,
                child: SpinKitWave(
                  size: 35,
                  color: Colors.red,
                ),
              ),
            ),
            GestureDetector(
              onTap: () => _showOverlay(context),
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showOverlay(BuildContext context) async {
    if (_state != null || _entry != null) return;

    _state = Overlay.of(context);
    _entry = OverlayEntry(
      builder: (context) => Positioned(
        top: 0,
        bottom: 0,
        right: 0,
        left: 0,
        // left: MediaQuery.of(context).size.width - 120,
        child: SafeArea(
          child: RotatedBox(
            quarterTurns: 3,
            child: Opacity(
              opacity: .7,
              child: Material(
                color: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
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
                      // IconButton(
                      //   icon: Icon(
                      //     Icons.favorite,
                      //     size: 30,
                      //     color: Colors.white.withOpacity(.6),
                      //   ),
                      //   onPressed: () => {},
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );

    _state.insert(_entry);
    // isOverlayOpen = true;

    await Future.delayed(Duration(seconds: 3));
    _closeOverlay();
  }

  void _closeOverlay() {
    if (_state == null || _entry == null) return;

    _entry?.remove();

    _entry = null;
    _state = null;

    // isOverlayOpen = false;
  }

  void _goBack() {
    Get.back();
  }
}

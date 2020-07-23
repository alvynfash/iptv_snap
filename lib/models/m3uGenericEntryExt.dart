import 'package:m3u/m3u.dart';

class M3uGenericEntryExt {
  M3uGenericEntry entry;

  String get title => entry.title;
  String get link => entry.link;

  ///Derived data from the attributes metadata
  bool get hasLogo =>
      entry.attributes.containsKey('tvg-logo') &&
      entry.attributes['tvg-logo'].isNotEmpty;
  String get logo => !hasLogo ? null : entry.attributes['tvg-logo'];

  bool get hasGroupTitle => entry.attributes.containsKey('group-title');
  String get groupTitle =>
      !hasGroupTitle ? null : entry.attributes['group-title'];

  M3uGenericEntryExt(this.entry);
}

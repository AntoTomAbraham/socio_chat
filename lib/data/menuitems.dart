import 'package:chat_app_/models/menu_item.dart';
import 'package:flutter/material.dart';

class menuitems {
  static const List<menuItem> items = [
    itemSearch,
    itemReport,
    itemUnmute,
    itemLeave,
  ];
  static const itemSearch = menuItem(iconn: Icons.search, item: "Search");
  static const itemReport = menuItem(iconn: Icons.report, item: "Report");
  static const itemUnmute =
      menuItem(iconn: Icons.mic_external_off, item: "Unmute");
  static const itemLeave = menuItem(iconn: Icons.exit_to_app, item: "Leave");
}

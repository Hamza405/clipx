import 'package:flutter/material.dart';
import 'package:pocketmovies/Components/entry_field.dart';
import 'package:pocketmovies/Theme/colors.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  TextEditingController downloadsController = TextEditingController();
  TextEditingController qualityController = TextEditingController();
  TextEditingController languageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    downloadsController.text = 'WiFi only';
    qualityController.text = 'HD (High Definition) 720p';
    languageController.text = 'English (USA)';
  }

  @override
  void dispose() {
    downloadsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text('Settings'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            buildEntryField(
              context: context,
              controller: qualityController,
              label: 'Preferred App Language',
              upperPadding: 120.0,
              items: [
                PopupMenuItem(
                  child: Text('HD (High Definition) 720p'),
                  value: 'HD (High Definition) 720p',
                ),
                PopupMenuItem(
                  child: Text('Full HD 1080p'),
                  value: 'Full HD 1080p',
                ),
              ],
            ),
            buildEntryField(
              context: context,
              controller: languageController,
              label: 'Preferred App Language',
              upperPadding: 180.0,
              items: [
                PopupMenuItem(
                  child: Text('English (USA)'),
                  value: 'English (USA)',
                ),
                PopupMenuItem(
                  child: Text('Hindi'),
                  value: 'Hindi',
                ),
              ],
            ),
            buildEntryField(
              context: context,
              controller: downloadsController,
              label: 'Downloads',
              upperPadding: 240.0,
              items: [
                PopupMenuItem(
                  child: Text('WiFi Only'),
                  value: 'WiFi Only',
                ),
                PopupMenuItem(
                  child: Text('Mobile Data and WiFi'),
                  value: 'Mobile Data and WiFi',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  EntryField buildEntryField({
    required BuildContext context,
    TextEditingController? controller,
    String? label,
    required List<PopupMenuItem> items,
    double? upperPadding,
  }) {
    return EntryField(
      controller: controller,
      label: label,
      readOnly: true,
      suffixIcon: Icon(
        Icons.keyboard_arrow_down,
        color: mainColor,
      ),
      onTap: () async {
        var result = await showMenu(
          color: textBackgroundColor,
          context: context,
          position: RelativeRect.fromLTRB(100.0, upperPadding!, 30.0, 0.0),
          items: items,
        );
        if (result == null) result = controller!.text;
        controller!.text = result.toString();
      },
    );
  }
}

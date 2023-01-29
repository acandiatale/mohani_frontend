import 'package:flutter/material.dart';
import 'package:mohani/widgets/calendar_widget.dart';
import 'package:mohani/widgets/language_setting_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late SharedPreferences prefs;
  String language = "ko-KR";

  Future getSettings() async {
    prefs = await SharedPreferences.getInstance();
    final lang = prefs.getString("lang");
    //   lang == null ? language = "ko-KR" : language = lang;
    if (lang != null) {
      setState(() {
        language = lang;
      });
    } else {
      setState(() {
        language = "ko-KR";
        prefs.setString("lang", language);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getSettings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: const Color.fromARGB(255, 255, 199, 232),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
        title: const Text(
          "MOHANI",
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        actions: [
          IconButton(
              onPressed: () => showDialog(
                    context: context,
                    builder: (context) {
                      return const LanguageSettingWidget();
                    },
                  ),
              icon: const Icon(Icons.settings)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: CalendarWidget(
          language: language,
        ),
      ),
    );
  }
}

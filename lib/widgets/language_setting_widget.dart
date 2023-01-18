import 'package:flutter/material.dart';

class LanguageSettingWidget extends StatelessWidget {
  const LanguageSettingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      alignment: Alignment.topCenter,
      title: const Text(
        "Language",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 15,
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(55, 0, 0, 0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Icon(
                      Icons.circle_outlined,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "한국어",
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.circle_outlined,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "English",
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

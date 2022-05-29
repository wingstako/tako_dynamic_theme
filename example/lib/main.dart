import 'package:example/theme.dart';
import 'package:flutter/material.dart';
import 'package:tako_dynamic_theme/tako_dynamic_theme.dart';

void main() {
  runApp(TakoDynamicThemeWidget(
    themeMap: {
      "light": ThemeData.light(),
      "dark": ThemeData.dark(),
      "night": ThemeConfig.nightTheme
    }, 
    fallbackTheme: ThemeData.light(), 
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: TakoDynamicTheme.of(context).themeData,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Tako Dynamic Theme"),
          leading: BackButton(onPressed: () {}),
          actions: const [],
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 0,
          unselectedFontSize: 0,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.theater_comedy_sharp), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: "")
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Flex(
                direction: Axis.horizontal,
                children: [
                  Expanded(
                      flex: 3,
                      child: OutlinedButton(
                        style: ThemeData.light().outlinedButtonTheme.style,
                        onPressed: () => TakoDynamicTheme.of(context)
                            .changeTheme(themeKey: "light"),
                        child: const Text("Light"),
                      )),
                  const Spacer(),
                  Expanded(
                      flex: 3,
                      child: OutlinedButton(
                        style: ThemeData.light().outlinedButtonTheme.style,
                        onPressed: () => TakoDynamicTheme.of(context)
                            .changeTheme(themeKey: "dark"),
                        child: const Text("Dark"),
                      )),
                  const Spacer(),
                  Expanded(
                      flex: 3,
                      child: OutlinedButton(
                        style: ThemeData.light().outlinedButtonTheme.style,
                        onPressed: () => TakoDynamicTheme.of(context)
                            .changeTheme(themeKey: "night"),
                        child: const Text("Night"),
                      ))
                ],
              ),
              Flex(
                direction: Axis.horizontal,
                children: [
                  Expanded(
                    flex: 5,
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text("Elevated")),
                  ),
                  const Spacer(),
                  Expanded(
                      flex: 5,
                      child: OutlinedButton(
                        onPressed: () {},
                        child: const Text("Outline"),
                      )),
                  const Spacer(),
                  Expanded(
                      flex: 5,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text("Text"),
                      )),
                ],
              ),
              Flex(direction: Axis.horizontal, children: const [
                Expanded(
                    child: Chip(
                  label: Text("Chip"),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.amber,
                  ),
                )),
                Expanded(
                    child: Chip(
                  label: Text("Chip"),
                  avatar: Icon(Icons.zoom_out_rounded),
                )),
                Expanded(child: Chip(label: Text("Chip"))),
                Expanded(child: Chip(label: Text("Chip"))),
              ]),
              Flex(
                direction: Axis.horizontal,
                children: [
                  Expanded(child: Switch(value: true, onChanged: (value) {})),
                  Expanded(child: Switch(value: false, onChanged: (value) {})),
                  Expanded(
                      child: Radio(
                          value: 1, groupValue: 1, onChanged: (value) {})),
                  Expanded(
                      child: Radio(
                          value: 0, groupValue: 1, onChanged: (value) {})),
                  Expanded(child: Checkbox(value: true, onChanged: (value) {})),
                  Expanded(
                      child: Checkbox(value: false, onChanged: (value) {})),
                ],
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: "Hint text"),
              ),
              const SizedBox(
                height: 15,
              ),
              Slider(value: 0, onChanged: (value) {}),
              Slider(value: 0.5, onChanged: (value) {}),
              Slider(value: 1, onChanged: (value) {}),
              const CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}

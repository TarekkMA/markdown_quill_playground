import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MarkdownViewer(),
    );
  }
}

class MarkdownViewer extends StatefulWidget {
  const MarkdownViewer({super.key});

  @override
  State<MarkdownViewer> createState() => _MarkdownViewerState();
}

class _MarkdownViewerState extends State<MarkdownViewer> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Markdown Live Editor"),
        backgroundColor: Colors.blueGrey,
      ),
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Expanded(
                  child: Card(
                elevation: 8,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.blueGrey,
                      width: double.infinity,
                      child: const Text("Markdown"),
                    ),
                    Expanded(
                      child: TextField(
                        maxLines: null,
                        expands: true,
                        controller: controller,
                        onChanged: (s) {
                          setState(() {});
                        },
                      ),
                    ),
                  ],
                ),
              )),
              const SizedBox(width: 12),
              Expanded(
                child: Card(
                  elevation: 8,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        color: Colors.blueGrey,
                        width: double.infinity,
                        child: const Text("Flutter Widgets"),
                      ),
                      Expanded(child: Markdown(data: controller.text)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

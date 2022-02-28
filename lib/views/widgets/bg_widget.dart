import 'package:flutter/material.dart';

class BgWidget extends StatelessWidget {
  final String? appBarTitle;
  final Widget? bodyWidget;
  final Widget? floatingActionButton;
  final Function()? logOut;
  const BgWidget(
      {this.appBarTitle,
      this.floatingActionButton,
      required this.bodyWidget,
      this.logOut,
      Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle ?? ''),
        centerTitle: false,
        actions: [
          IconButton(onPressed: logOut, icon: const Icon(Icons.logout))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: bodyWidget,
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}

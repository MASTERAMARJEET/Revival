import 'package:flutter/material.dart';

import './base_drawer.dart';

class CustomScaffold extends StatelessWidget {
  final Widget? body;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  CustomScaffold({
    this.body,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Center(
          child: Image.asset(
            'assets/images/logo.png',
            scale: 2,
            fit: BoxFit.contain,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.cyan[100],
      ),
      endDrawer: CustomDrawer(),
      body: body,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
    );
  }
}

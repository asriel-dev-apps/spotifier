import 'package:flutter/material.dart';

class DevelopPage extends StatefulWidget {
  const DevelopPage({
    super.key,
  });

  @override
  State<DevelopPage> createState() => _DevelopPageState();
}

class _DevelopPageState extends State<DevelopPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("develop"),
      ),
    );
  }
}

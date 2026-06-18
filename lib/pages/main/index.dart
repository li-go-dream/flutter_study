import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int num = 0;
  void addNum() {
    setState(() {
      ++num;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // primary: false,
      appBar: AppBar(backgroundColor: Colors.white, toolbarHeight: 0),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Text('这是$num'),
            TextButton(onPressed: addNum, child: const Icon(Icons.add)),
            TextButton(
              onPressed: () {
                context.push('/login');
              },
              child: const Text('去登录'),
            ),
          ],
        ),
      ),
    );
  }
}

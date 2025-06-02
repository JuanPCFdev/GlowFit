import 'package:flutter/material.dart';
import 'package:glow_fit_app/features/gym/presentation/widgets/home/app_bar_home.dart';
import 'package:glow_fit_app/features/gym/presentation/widgets/home/bottom_navigation_bar_home.dart';
import 'package:glow_fit_app/features/gym/presentation/widgets/home/progress.dart';
import 'package:glow_fit_app/features/gym/presentation/widgets/home/week.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;

  @override
  void initState() {
    super.initState();
  }

  void onTapped(int index) {
    setState(() {
      this.index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarHome(),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(children: [week(), progress()]),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarHome(
        index: index,
        onTapped: onTapped,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'dart:math';

import 'package:marv_clinic/pages/allocation_pages.dart';
import 'package:marv_clinic/pages/stock_page.dart';
import 'package:marv_clinic/pages/store_page.dart';

class NavigationDrawerWidget extends StatefulWidget {
  const NavigationDrawerWidget({Key? key}) : super(key: key);

  @override
  State<NavigationDrawerWidget> createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  double value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: const Color.fromARGB(255, 125, 162, 222),
          ),
          SafeArea(
            child: Container(
              width: 200.0,
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const AllocationPage()));
                          },
                          leading: const Icon(Icons.home, color: Colors.white),
                          title: const Text("Home",
                              style: TextStyle(color: Colors.white)),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const AllocationPage()));
                          },
                          leading: const Icon(Icons.home, color: Colors.white),
                          title: const Text("Alocações",
                              style: TextStyle(color: Colors.white)),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const StorePage()));
                          },
                          leading: const Icon(Icons.home, color: Colors.white),
                          title: const Text("Loja",
                              style: TextStyle(color: Colors.white)),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const StockPage()));
                          },
                          leading: const Icon(Icons.home, color: Colors.white),
                          title: const Text("Estoque",
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          TweenAnimationBuilder(
            curve: Curves.easeIn,
            tween: Tween<double>(begin: 0, end: value),
            duration: const Duration(milliseconds: 500),
            builder: (_, double val, __) {
              return Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..setEntry(0, 3, 200 * val)
                  ..rotateY((pi / 6) * val),
                child: Scaffold(
                  backgroundColor: const Color(0xFF6d8dbf),
                  appBar: AppBar(
                    backgroundColor: const Color(0xFF1f2835),
                    centerTitle: true,
                    title: const Text(
                      "Marv Clinic",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40), // Increase font size
                    ),
                    leading: IconButton(
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: 40, // Increase icon size
                      ),
                      onPressed: () {
                        setState(() {
                          value = value == 0 ? 1 : 0;
                        });
                      },
                    ),
                  ),
                  body: const Center(child: Text("")),
                ),
              );
            },
          ),
          GestureDetector(
            onHorizontalDragUpdate: (e) {
              if (e.delta.dx > 0) {
                setState(() {
                  value = 1;
                });
              } else {
                setState(() {
                  value = 0;
                });
              }
            },
          ),
        ],
      ),
    );
  }
}

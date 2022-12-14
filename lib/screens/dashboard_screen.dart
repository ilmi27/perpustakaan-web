import 'dart:io';

import 'package:flutter/material.dart';
import 'package:web_dashboard_app_tut/screens/DataAnggota.dart';
import 'package:web_dashboard_app_tut/screens/DataBuku.dart';
import 'package:web_dashboard_app_tut/screens/home.dart';
import 'package:web_dashboard_app_tut/screens/profile.dart';
import 'package:web_dashboard_app_tut/screens/peminjaman.dart';
import 'package:web_dashboard_app_tut/screens/pengembalian.dart';
import 'package:web_dashboard_app_tut/widget/gambar.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  //setting the expansion function for the navigation rail
  bool isExpanded = true;
  int index = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: NavigationRail(
                leading: Container(
                  child: Container(
                    margin: EdgeInsets.only(top: 5, bottom: 2),
                    child: Wrap(direction: Axis.vertical, children: [
                      Wrap(
                        spacing: 5.0,
                        runSpacing: 3.0,
                        direction: Axis.horizontal,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage: AssetImage(gambar.logo),
                          ),
                          Wrap(
                            direction: Axis.vertical,
                            children: [
                              Text(
                                'Perpustakaan Wilayah',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Sulawesi Selatan',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                        width: 200,
                        child: Divider(color: Colors.white),
                      ),
                    ]),
                  ),
                ),
                extended: isExpanded,
                backgroundColor: Colors.blue.shade700,
                unselectedIconTheme:
                    IconThemeData(color: Colors.white, opacity: 1),
                unselectedLabelTextStyle: TextStyle(
                  color: Colors.white,
                ),
                selectedIconTheme: IconThemeData(color: Colors.blue.shade300),
                onDestinationSelected: (value) {
                  setState(() {
                    index = value;
                  });
                },
                destinations: [
                  NavigationRailDestination(
                    icon: Icon(Icons.home),
                    label: Text("Home"),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.book),
                    label: Text("Data Buku"),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.library_books),
                    label: Text("Peminjaman"),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.person),
                    label: Text("Profile"),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.library_books),
                    label: Text("Pengembalian"),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.group),
                    label: Text("Data Anggota"),
                  ),
                ],
                selectedIndex: index),
          ),
          index == 0
              ? home()
              : index == 1
                  ? databuku()
                  : index == 2
                      ? peminjaman()
                      : index == 3
                          ? Profile()
                          : index == 4
                              ? pengembalian()
                              : dataanggota()
        ],
      ),
    );
  }
}

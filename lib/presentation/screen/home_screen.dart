import 'package:flutter/material.dart';
import 'package:tasksecond/presentation/utils/color_constants.dart';
import 'package:tasksecond/presentation/widgets/banner_carousel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, String>> modules = [
    {"title": "My Bookings", "route": "/vehiclesList"},
    {"title": "Services", "route": "/services"},
    {"title": "Upgrade Vehicles", "route": "/upgradeVehicles"},
    {"title": "Refer a Friend", "route": "/referFriend"},
    {"title": "My Orders", "route": "/myOrders"},
    {"title": "My Orders", "route": "/myOrders"},
    {"title": "My Orders", "route": "/myOrders"},
    {"title": "My Orders", "route": "/myOrders"},
    {"title": "Refer a Friend", "route": "/referFriend"},
    {"title": "My Orders", "route": "/myOrders"},
  ];

  void _navigateToModule(String route) {
    Navigator.pushNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: AppBar(
        backgroundColor: CustomColors.primaryColor,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 10),
          child: Image.asset('assets/images/vehicle1.jpg'),
        ),
        title: Text(
          'My App',
          style: TextStyle(color: CustomColors.white),
        ),
        actions: [
          PopupMenuButton<String>(
            icon: Icon(Icons.more_vert, color: CustomColors.white),
            onSelected: (value) {
              if (value == 'profile') {
                print("CLICKED OPTION >>> PROFILE");
              } else if (value == 'logout') {
                print("CLICKED OPTION >>> LOGOUT");
                Navigator.pushNamed(context, '/login');
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem<String>(
                  value: 'profile',
                  child: Text('My Profile'),
                ),
                const PopupMenuItem<String>(
                  value: 'logout',
                  child: Text('Log out'),
                ),
              ];
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("Hello, user !"),
            Text("Manikanta siva"),
            const BannerCarousel(),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: modules.length,
                itemBuilder: (context, index) {
                  final module = modules[index];
                  return GestureDetector(
                    onTap: () => _navigateToModule(module['route']!),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 16.0),
                        title: Text(
                          module['title']!,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios,
                            color: CustomColors.black),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

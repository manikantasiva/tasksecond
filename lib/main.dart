
import 'package:flutter/material.dart';
import 'package:tasksecond/presentation/screen/home_screen.dart';
import 'package:tasksecond/presentation/screen/my_bookings_screen.dart';
import 'package:tasksecond/presentation/screen/my_orders_screen.dart';
import 'package:tasksecond/presentation/screen/my_services_screen.dart';
import 'package:tasksecond/presentation/screen/refer_frend_screen.dart';
import 'package:tasksecond/presentation/screen/sign_in_screen.dart';
import 'package:tasksecond/presentation/screen/sign_up_screen.dart';
import 'package:tasksecond/presentation/screen/upgrade_vehicle_screen.dart';
import 'package:tasksecond/presentation/screen/vehicles_list_screen.dart';
import 'package:tasksecond/presentation/utils/color_constants.dart';
import 'package:tasksecond/presentation/utils/strings_constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
      routes: {
        '/login': (context) => const SignInScreen(),
        '/register': (context) => const SignUpScreen(),
         '/myBookings': (context) => const MyBookingsScreen(),
         '/vehiclesList' : (cntext) => const VehiclesListScreen(),
        '/services': (context) => const MyServices(),
        '/upgradeVehicles': (context) => const UpgradeVehicleScreen(),
        '/referFriend': (context) => const ReferFriendScreen(),
        '/myOrders': (context) => const MyOrdersScreen(),
        '/home' : (conext) => const HomeScreen(),
      },
    );
  }
}



class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, '/login');
    });

    return Scaffold(
      backgroundColor: CustomColors.greyEightyEight, 
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white, 
                shape: BoxShape.circle, 
                border: Border.all(color: CustomColors.secondPrimaryColor, width: 3), 
                
              ),
              padding: const EdgeInsets.all(16), // Space inside the circle
              child: Icon(
                Icons.app_registration,
                size: 100,
                color: CustomColors.secondPrimaryColor, // Icon color
              ),
            ),
            const SizedBox(height: 20),
            Text("Welcome to ,",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: CustomColors.black,
                fontFamily: StringsConstants.fontFamilySfText,
              ),
            ),
            Text(
              "Booking App",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                color: CustomColors.black,
                fontFamily: StringsConstants.fontFamilySfProText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


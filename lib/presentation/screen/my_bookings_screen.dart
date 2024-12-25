// import 'package:flutter/material.dart';
// import 'package:tasksecond/presentation/utils/color_constants.dart';
// import 'package:tasksecond/presentation/utils/strings_constants.dart';
// import 'package:tasksecond/presentation/widgets/custom_button.dart';

// class MyBookingsScreen extends StatefulWidget {
//   const MyBookingsScreen({super.key});

//   @override
//   State<MyBookingsScreen> createState() => _MyBookingsScreenState();
// }

// class _MyBookingsScreenState extends State<MyBookingsScreen> {
//   final TextEditingController _firstNameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _mobileController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: CustomColors.white,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Center(
//                   child: Image.asset(
//                     'assets/images/car.png',
//                     width: 200,
//                     height: 200,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 const Text(
//                   "Hi, User Book your desired vehicles Here!!!",
//                   style: TextStyle(fontSize: 16),
//                 ),
//                 const SizedBox(height: 20),
//                  Text(
//                   "Vehicle Details ",
//                   style: TextStyle(
//                       fontSize: 16,
//                       color: CustomColors.primaryColor,
//                       fontFamily: StringsConstants.fontFamily,
//                       fontWeight: FontWeight.w700),
//                 ),
//                 Divider(),

//                 Text(
//                   "User Details ",
//                   style: TextStyle(
//                       fontSize: 16,
//                       color: CustomColors.primaryColor,
//                       fontFamily: StringsConstants.fontFamily,
//                       fontWeight: FontWeight.w700),
//                 ),
//                 Divider(),
//                 TextField(
//                   controller: _firstNameController,
//                   decoration: InputDecoration(
//                     labelText: 'Full Name',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8.0),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 TextField(
//                   controller: _emailController,
//                   decoration: InputDecoration(
//                     labelText: 'Email',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8.0),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 TextField(
//                   controller: _mobileController,
//                   decoration: InputDecoration(
//                     labelText: 'Mobile Number',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8.0),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Center(
//                   child: CustomButton(
//                     text: "Submit",
//                     onPressed: () {
//                       // ScaffoldMessenger.of(context).showSnackBar(
//                       //   const SnackBar(content: Text('Vehicle Registration Successful!')),
//                       // );
//                     },
//                     backgroundColor: CustomColors.primaryColor,
//                     textColor: CustomColors.white,
//                     borderColor: CustomColors.primaryColor,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

class MyBookingsScreen extends StatefulWidget {
  const MyBookingsScreen({super.key});

  @override
  State<MyBookingsScreen> createState() => _MyBookingsScreenState();
}

class _MyBookingsScreenState extends State<MyBookingsScreen> {
  final List<Map<String, dynamic>> vehicles = [
    {
      "vhcl_id": 1,
      "vhcl_name": "Mahendra Mini",
      "vhcl_size": "Small",
      "vhcl_des": "Super car with excellent mileage.",
      "vhcl_color_availability": "Y",
      "vhcl_colors": [
        {"color": "Red", "price": 12000},
        {"color": "Green", "price": 12500},
        {"color": "Yellow", "price": 13000}
      ],
      "price": 0
    },
    {
      "vhcl_id": 2,
      "vhcl_name": "Tata Nano",
      "vhcl_size": "Small",
      "vhcl_des": "Affordable small car for urban commuting.",
      "vhcl_color_availability": "N",
      "vhcl_colors": [],
      "price": 10000
    },
    {
      "vhcl_id": 3,
      "vhcl_name": "Suzuki Swift",
      "vhcl_size": "Medium",
      "vhcl_des": "A stylish and reliable hatchback.",
      "vhcl_color_availability": "Y",
      "vhcl_colors": [
        {"color": "Blue", "price": 15000},
        {"color": "Black", "price": 15500},
        {"color": "White", "price": 14500}
      ],
      "price": 0
    }
  ];

  int? selectedVehicleId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vehicle List'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: vehicles.length,
        itemBuilder: (context, index) {
          final vehicle = vehicles[index];
          final isSelected = selectedVehicleId == vehicle["vhcl_id"];
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedVehicleId = vehicle["vhcl_id"];
              });
            },
            child: Card(
              color: isSelected ? Colors.grey[300] : Colors.white,
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/car.png',
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            vehicle["vhcl_name"],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            vehicle["vhcl_des"].length > 20
                                ? "${vehicle["vhcl_des"].substring(0, 20)}..."
                                : vehicle["vhcl_des"],
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Price: ${vehicle["price"] > 0 ? vehicle["price"].toString() : 'Varies by color'}",
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

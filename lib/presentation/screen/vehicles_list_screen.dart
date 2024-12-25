import 'package:flutter/material.dart';
import 'package:tasksecond/presentation/utils/color_constants.dart';

class VehiclesListScreen extends StatefulWidget {
  const VehiclesListScreen({super.key});

  @override
  State<VehiclesListScreen> createState() => _VehiclesListScreenState();
}

class _VehiclesListScreenState extends State<VehiclesListScreen> {
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
        title: Text('Vehicle List', style: TextStyle(color: CustomColors.white),),
        backgroundColor: CustomColors.primaryColor,
        iconTheme: const IconThemeData(
            color: Colors.white), 
      ),
      body: SafeArea(
        child: ListView.builder(
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
      ),
    );
  }
}

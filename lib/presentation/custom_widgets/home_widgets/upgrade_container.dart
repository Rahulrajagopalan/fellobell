import 'package:fello_bell_project/core/theme/app_color_scheme.dart';
import 'package:flutter/material.dart';

class UpgradeContainer extends StatelessWidget {
  const UpgradeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 300,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'UPGRADE TO PREMIUM',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Subscribe now to get work orders',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    child: Text('GO PREMIUM NOW',style: TextStyle(fontSize: 12),),
                  ),
                ],
              ),
            ),
          ),
          Positioned(top: 30,left: 250, child: CircleAvatar(backgroundColor: AppColorScheme.backgroundblue, radius: 60,)),
          Positioned(bottom: -60,left: 200, child: CircleAvatar(backgroundColor: AppColorScheme.backgroundblue, radius: 40,)),
        ],
      ),
    );
  }
}

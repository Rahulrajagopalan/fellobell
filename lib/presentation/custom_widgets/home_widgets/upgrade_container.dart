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
      padding: EdgeInsets.all(8),
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
    );
  }
}

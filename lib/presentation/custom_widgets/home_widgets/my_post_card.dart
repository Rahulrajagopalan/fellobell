import 'package:fello_bell_project/core/theme/app_color_scheme.dart';
import 'package:flutter/material.dart';

class MyPostCard extends StatelessWidget {
  const MyPostCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 130,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: AppColorScheme.backgroundblue,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage:
                    AssetImage('assets/images/profile_picture.png'),
              ),
              SizedBox(width: 20),
              Text('James', style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          Text('Plumbing', style: TextStyle(fontWeight: FontWeight.bold)),
          Row(
            children: [
              Text('Ernakulam', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
              Spacer(),
              Text('FB1021', style: TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';

class PostListCard extends StatelessWidget {
  const PostListCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      height: 120,
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 5.0),
        child: ListTile(
          leading: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(image: AssetImage("assets/images/images.jpg"))
            ),
          ),
          title: Text('John Doe', style: TextStyle(color: Color(0xFF676D75)),),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Plumbing/Wiring', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),),
              Row(
                children: [
                  Icon(Icons.location_on_outlined),
                  Text('Ernakulam'),
                ],
              ),
              Text('12/10/2024 - 14/10/2024', style: TextStyle(fontSize: 10)),
            ],
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('FB1021'),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.groups_2_rounded, size: 20),
                  SizedBox(width: 5,),
                  Text("4", style: TextStyle(fontSize: 12),)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:fello_bell_project/domain/models/my_post_model.dart';
import 'package:flutter/material.dart';

class PostListCard extends StatelessWidget {
  MyPostModel myPostModel;
  PostListCard({super.key, required this.myPostModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      height: 125,
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
              image: DecorationImage(image: NetworkImage(myPostModel.userImage))
            ),
          ),
          title: Text('John Doe', style: TextStyle(color: Color(0xFF676D75)),),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(myPostModel.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),),
              Row(
                children: [
                  Icon(Icons.location_on_outlined),
                  Text(myPostModel.landmark),
                ],
              ),
              Text('${myPostModel.jobStartDate} - ${myPostModel.jobEndDate}', style: TextStyle(fontSize: 10)),
            ],
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(myPostModel.jobId),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.groups_2_rounded, size: 20),
                  SizedBox(width: 5,),
                  Text(myPostModel.acceptedRequestCount.toString(), style: TextStyle(fontSize: 12),)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

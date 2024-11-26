import 'package:fello_bell_project/core/theme/app_color_scheme.dart';
import 'package:fello_bell_project/domain/models/post_model.dart';
import 'package:flutter/material.dart';

class MyPostCard extends StatelessWidget {
  PostModel postModel;
  MyPostCard({super.key, required this.postModel});

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
                backgroundImage: NetworkImage(postModel.userImage),
              ),
              SizedBox(width: 20),
              Text(postModel.createdUserName,
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          Text(postModel.name, style: TextStyle(fontWeight: FontWeight.bold)),
          Row(
            children: [
              Text(postModel.landmark.split(",").first,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
              Spacer(),
              Text(postModel.jobId,
                  style: TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}

class PostSeeAll extends StatelessWidget {
  PostModel postModel;
  PostSeeAll({super.key, required this.postModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 150,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: AppColorScheme.backgroundwhite,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Text(postModel.jobId),
              Spacer(),
              postModel.isApproved
                  ? Text("Active", style: TextStyle(color: Colors.green))
                  : Text("Upcoming", style: TextStyle(color: Colors.blue)),
            ],
          ),
          Text(postModel.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          Row(
            children: [
              Icon(Icons.location_on_outlined),
              SizedBox(
                width: 10,
              ),
              Text(postModel.landmark.split(",").first,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
            ],
          ),
          Text('${postModel.jobStartDate} - ${postModel.jobEndDate}',
              style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}

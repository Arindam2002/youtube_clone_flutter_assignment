import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_shorts_clone/components/ShortComponent.dart';
import 'package:youtube_shorts_clone/models/postModel.dart';
import 'package:youtube_shorts_clone/providers/apiProvider.dart';
import 'package:youtube_shorts_clone/shorts_screen.dart';

class ShortScreenPushed extends StatefulWidget {
  const ShortScreenPushed({
    super.key,
    required this.thisPost,
  });

  final Post thisPost;

  @override
  State<ShortScreenPushed> createState() => _ShortScreenPushedState();
}

class _ShortScreenPushedState extends State<ShortScreenPushed> {
  // List<Widget> buildPostList( BuildContext context ) {
  //   Consumer<Api>(
  //     builder: (context, apiProvider, child) {
  //       return ListView.builder(
  //         itemCount: 10,
  //         itemBuilder: (context, index) {
  //           if (index == apiProvider.currentPostList.length - 1) {
  //             apiProvider.loadNextPage();
  //           }
  //           final post = apiProvider.currentPostList[index];
  //           return ListTile(
  //             title: Text(post.submission.title),
  //             subtitle: Text(post.creator.name),
  //             leading: CircleAvatar(
  //               backgroundImage: NetworkImage(post.creator.pic),
  //             ),
  //           );
  //         },
  //       );
  //     }
  //   );
  // }

  // void initState() {
  //   super.initState();
  //   context.read<Api>().loadNextPage();
  //   print(context.read<Api>().currentPostList);
  // }

  // @override
  // void dispose() {
  //   _pageController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<Api>(
      builder: (context, apiProvider, child) {
        return SafeArea(
          child: Scaffold(
            body: GestureDetector(
              onVerticalDragEnd: (details) {
                if (details.primaryVelocity !< 0) {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ShortsScreen()));
                }
              },
              child: ShortComponent(
                post: widget.thisPost,
              ),
            ),
          ),
        );
      },
    );
  }
}

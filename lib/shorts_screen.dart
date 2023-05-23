import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_shorts_clone/components/ShortComponent.dart';
import 'package:youtube_shorts_clone/providers/apiProvider.dart';

class ShortsScreen extends StatefulWidget {
  const ShortsScreen({super.key,});

  @override
  State<ShortsScreen> createState() => _ShortsScreenState();
}

class _ShortsScreenState extends State<ShortsScreen> {

  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Consumer<Api>(
      builder: (context, apiProvider, child) {
        return SafeArea(
          child: Scaffold(
            body: FutureBuilder(
              future: apiProvider.fetchVideos(), // Fetch the initial data
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return PageView.builder(
                    controller: _pageController,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      if (index == apiProvider.currentPostList.length - 1) {
                        apiProvider.fetchVideos();
                      }
                      final post = apiProvider.currentPostList[index];
                      return ShortComponent(post: post);
                    },
                  );
                }
              },
            ),
          ),
        );
      },
    );
  }
}
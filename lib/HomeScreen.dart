import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_shorts_clone/providers/apiProvider.dart';
import 'package:youtube_shorts_clone/shortScreenPushed.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() async {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      print('at end');
      await Future.delayed(Duration(seconds: 2));
      Api().fetchVideos();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'YouTube Shorts',
            style: TextStyle(color: Colors.black),
          ),
          titleSpacing: 0,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/logo/shorts.png',
            ),
          ),
        ),
        body: Consumer<Api>(builder: (context, apiProvider, child) {
          return FutureBuilder(
              future: apiProvider.fetchVideos(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: GridView.builder(
                      controller: _scrollController,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Number of columns in the grid
                        crossAxisSpacing: 12, // Spacing between columns
                        mainAxisSpacing: 12, // Spacing between rows
                      ),
                      itemCount: apiProvider.currentPostList.length,
                      itemBuilder: (context, index) {
                        print('$index, ${apiProvider.currentPostList.length}');
                        if (index == apiProvider.currentPostList.length - 1) {
                          // apiProvider.fetchVideos();
                        }
                        final post = apiProvider.currentPostList[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ShortScreenPushed(thisPost: post)));
                          },
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.grey[200],
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          post.submission.thumbnail,
                                        ),
                                        fit: BoxFit.cover)),
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(post.submission.title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                }
              });
        }),
      ),
    );
  }
}

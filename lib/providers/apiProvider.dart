import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:youtube_shorts_clone/models/postModel.dart';

class Api with ChangeNotifier {
  List<Post> _currentPostList = [];
  int _currentPage = 0;
  int _currentPost = 0;

  List<Post> get currentPostList => _currentPostList;
  int get currentPage => _currentPage;
  int get currentPost => _currentPost;


  Future<List<Post>> fetchVideos() async {
    _currentPage++;
    final url = 'https://internship-service.onrender.com/videos?page=$_currentPage';

    final response = await http.get(Uri.parse(url));

    List<Post> posts = [];
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      // Assuming the API response contains a 'videos' key with the list of videos
      final data = responseData['data'];
      final postsList = data['posts'];

      for (var post in postsList) {
        _currentPostList.add(Post.fromJson(post));
        // posts.add(Post.fromJson(post));
      }
    } else {
      throw Exception('Failed to fetch videos');
    }
    return posts;
  }

  // void loadNextPage() {
  //   print('Calling loadNextPage');
  //   _currentPage++;
  //   fetchVideos(_currentPage);
  // }
  //
  // void loadPrevPage() {
  //   if (_currentPage > 1) {
  //     _currentPage--;
  //     fetchVideos(_currentPage);
  //   }
  //   else {
  //    if (kDebugMode) {
  //      print('Error: Cannot go to prev page because current page value is 1');
  //    }
  //   }
  // }
  // Future<void> fetchAllVideos() async {
  //   int page = 0;
  //   List<dynamic> allVideos = [];
  //
  //   while (true) {
  //     try {
  //       final videos = await fetchVideos(page);
  //       if (videos.isEmpty) {
  //         break; // Break the loop if there are no more videos
  //       }
  //       allVideos.addAll(videos);
  //       page++;
  //     } catch (e) {
  //       print('Error fetching videos: $e');
  //       break; // Break the loop if an error occurs
  //     }
  //   }
  //
  //   // At this point, 'allVideos' contains all the videos fetched from the API
  //   // You can now process and use the videos as needed
  // }
}
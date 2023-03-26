import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class VideoListScreen extends StatefulWidget {
  @override
  _VideoListScreenState createState() => _VideoListScreenState();
}

class _VideoListScreenState extends State<VideoListScreen> {
  List<Map<String, dynamic>> _videoData = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _getVideoDataFromFirestore();
    _isLoading = true;
  }

  Future<void> _getVideoDataFromFirestore() async {
    CollectionReference videosRef =
        FirebaseFirestore.instance.collection('videos');
    QuerySnapshot videosSnapshot = await videosRef.get();
    List<Map<String, dynamic>> videoData = List<Map<String, dynamic>>.from(
      videosSnapshot.docs
          .map((doc) => {
                'title':
                    (doc.data() as Map<String, dynamic>)['title'] as String?,
                'url': (doc.data() as Map<String, dynamic>)['url'] as String?,
              })
          .toList(),
    );
    List<Map<String, dynamic>> videoDataWithStreamUrls =
        await _getStreamUrlsForVideos(videoData);
    setState(() {
      _videoData = videoDataWithStreamUrls;
    });
  }

  Future<List<Map<String, dynamic>>> _getStreamUrlsForVideos(
      List<Map<String, dynamic>> videoData) async {
    var yt = YoutubeExplode();
    List<Map<String, dynamic>> videoDataWithStreamUrls = [];
    for (int i = 0; i < videoData.length; i++) {
      String url = videoData[i]['url'] ?? '';
      if (url.contains('youtube.com') || url.contains('youtu.be')) {
        try {
          var video = await yt.videos.get(url);
          var streamManifest =
              await yt.videos.streamsClient.getManifest(video.id);
          var streamInfo = streamManifest.muxed.bestQuality;
          var streamUrl = streamInfo.url.toString();
          var img = video.thumbnails.mediumResUrl;
          videoDataWithStreamUrls.add({
            'title': videoData[i]['title'],
            'url': url,
            'streamUrl': streamUrl,
            'image': img,
          });
          _isLoading = false;
        } catch (e) {
          print('Error getting stream URL for video at index $i: $e');
          videoDataWithStreamUrls.add({
            'title': videoData[i]['title'],
            'url': url,
          });
        }
      } else {
        videoDataWithStreamUrls.add({
          'title': videoData[i]['title'],
          'url': url,
        });
      }
    }
    yt.close();
    return videoDataWithStreamUrls;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xff1062C2),
        title: Text(
          "Videos",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
          ),
        ),
        centerTitle: true,
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: _videoData.length,
                itemBuilder: (context, index) {
                  if (_videoData.length != null) {
                    final videoTitle = _videoData[index]['title'];
                    final videoUrl = _videoData[index]['url'];
                    final streamUrl = _videoData[index]['streamUrl'];
                    final thumbnail = _videoData[index]['image'];

                    return Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            videoTitle ?? '',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          GestureDetector(
                            onTap: () async {
                              final videoPlayerController =
                                  VideoPlayerController.network(streamUrl!);
                              await videoPlayerController.initialize();
                              final chewieController = ChewieController(
                                videoPlayerController: videoPlayerController,
                                showControlsOnInitialize: true,
                                autoInitialize: false,
                                looping: false,
                                aspectRatio:
                                    videoPlayerController.value.aspectRatio,
                                autoPlay: false,
                                showControls: true,
                                showOptions: true,
                              );
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => SafeArea(
                                    child: Scaffold(
                                      backgroundColor: Colors.transparent,
                                      body: _isLoading
                                          ? Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            )
                                          : Center(
                                              child: Chewie(
                                                controller: chewieController,
                                              ),
                                            ),
                                    ),
                                  ),
                                ),
                              );
                              videoPlayerController.dispose();
                              chewieController.dispose();
                            },
                            child: AspectRatio(
                              aspectRatio: 16 / 9,
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(thumbnail),
                                      fit: BoxFit.cover),
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: VideoPlayer(
                                  VideoPlayerController.network(streamUrl!),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    CircularProgressIndicator();
                  }
                },
              ),
            ),
    );
  }
}

import 'package:cooking_book/widget/navbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class YoutubePlay extends StatelessWidget {
  final String data;
  const YoutubePlay({required this.data,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    YoutubePlayerController youtubePlayerController  = YoutubePlayerController(
      initialVideoId: data,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        startAt: 20,
      )

    );
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 30,
              ),
            ),
          ),
          const SizedBox(height: 200,),
          Center(
            child: YoutubePlayer(
              controller: youtubePlayerController,
              //showVideoProgressIndicator: true,
            ),
          ),
        ],
      ),
      bottomNavigationBar: const NavBar(),
    );
  }
}

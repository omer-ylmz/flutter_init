import 'package:flutter/material.dart';

class ImageOrnekleri extends StatelessWidget {
  const ImageOrnekleri({super.key});

  final String _resim =
      "https://www.pixground.com/wp-content/uploads/2023/04/Clouds-Meet-The-Sea-AI-Generated-4K-Wallpaper.jpg";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Container(
                    child: Image.asset(
                      "assets/images/baby-groot-wallpaper-abb64c4d83d10fb995b40be93ddc3c90.jpg",
                    ),
                  ),
                ),
                Expanded(child: Container(child: Image.network(_resim))),
                Expanded(
                  child: Container(
                    child: CircleAvatar(
                      child: Text(
                        "O",
                      ),
                      backgroundColor: Colors.amberAccent,
                      backgroundImage: NetworkImage(_resim),
                    ),
                  ),
                ),
              ],
            ),
          ),
          FadeInImage.assetNetwork(
              placeholder: "assets/images/loading.gif", image: _resim),
        ],
      ),
    );
  }
}

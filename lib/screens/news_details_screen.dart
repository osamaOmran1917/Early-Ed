import 'package:cached_network_image/cached_network_image.dart';
import 'package:early_ed/model/news_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class NewsDetailsScreen extends StatelessWidget {
  const NewsDetailsScreen({super.key, required this.news});
  final NewsModel news;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.edit),
        iconSize: 40,
      ),
      appBar: AppBar(
        toolbarHeight: 100,
        // leading: IconButton(
        //   icon: const Icon(
        //     Icons.home,
        //     size: 35,
        //   ),
        //   onPressed: () {
        //     Navigator.push(
        //         context,
        //         MaterialPageRoute(
        //           builder: (context) => const HomeScreen(),
        //         ));
        //   },
        // ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        title: Column(
          children: [
            Image.asset(
              "assets/images/EARLYED.png",
              width: 150,
              height: 100,
              fit: BoxFit.fill,
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
        actions: const [
          Icon(Icons.more_vert_rounded, size: 33, color: Colors.black)
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(color: Colors.white10),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              alignment: Alignment.center,
              child: const Text(
                "NEWS",
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.black,
                ),
              ),
            ),
            ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: CachedNetworkImage(
                    fit: BoxFit.contain,
                    height: 250.h,
                    width: 300.w,
                    imageUrl: news.imageUrl ??
                        'https://s.france24.com/media/display/e6279b3c-db08-11ee-b7f5-005056bf30b7/w:1024/p:16x9/news_en_1920x1080.jpg',
                    // errorWidget: (context, url, error) => const CustomImage(imagePath: AppAssets.errorImage),
                    // placeholder: (context, url) => const CustomImage(imagePath: AppAssets.placeholder),
                    progressIndicatorBuilder: (context, url, progress) => SizedBox(
                        width: 228.w,
                        child: const Center(child: CircularProgressIndicator())))),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black26)
              ),
              height: 200,
              width: 350,
              child:
              Text(
                news.details ?? '',
                style: const TextStyle(fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}

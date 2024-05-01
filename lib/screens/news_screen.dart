import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:early_ed/database/my_database.dart';
import 'package:early_ed/database/user_data_provider.dart';
import 'package:early_ed/model/news_model.dart';
import 'package:early_ed/screens/add_news.dart';
import 'package:early_ed/widgets/news_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  final bool isAdmin = true;

  @override
  Widget build(BuildContext context) {
    var userDataProvider = Provider.of<UserDataProvider>(context);
    return Scaffold(
        appBar: AppBar(
            toolbarHeight: 100,
            // leading: IconButton(
            //   icon: const Icon(Icons.home, size: 35,),
            //   onPressed: () {
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(builder: (context) => const HomeScreen(),));
            //   },
            // ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25)),
            ),
            title: Column(children: [
              Image.asset("assets/images/EARLYED.png",
                  width: 150, height: 100, fit: BoxFit.fill)
            ]),
            centerTitle: true,
            backgroundColor: Colors.lightBlue,
            actions: const [
              Icon(Icons.more_vert_rounded, size: 33, color: Colors.black)
            ]),
        body: Container(
            decoration: const BoxDecoration(color: Colors.white10),
            child: Column(children: [
              Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  alignment: Alignment.center,
                  child: const Text("NEWS",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 30,
                          color: Colors.black))),
              Expanded(
                  child: StreamBuilder<QuerySnapshot<NewsModel>>(
                stream: MyDataBase.listenForNewsRealTimeUpdates(),
                builder: (buildContext, snapshot) {
                  /*if (snapshot.hasError) {
                    return const Text('Error Loading Data, Please Try Again Later');
                  } else if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                        child: SizedBox(
                            width: 40,
                            height: 40,
                            child: CircularProgressIndicator()));
                  }*/
                  var data = snapshot.data?.docs.map((e) => e.data()).toList();
                  return ListView.builder(
                    itemBuilder: (buildContext, index) {
                      return NewsWidget(news: data[index]);
                    },
                    itemCount: data!.length,
                  );
                },
              ))
            ])),
        floatingActionButton: IconButton(
            //only if Admin
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AddNews()));
            },
            icon: const Icon(Icons.add_circle),
            iconSize: 40));
  }
}

late List<NewsModel> all;

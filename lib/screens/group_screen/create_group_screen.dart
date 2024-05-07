import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CreateGroupScreen extends StatefulWidget {
  const CreateGroupScreen({super.key});

  @override
  State<CreateGroupScreen> createState() => _CreateGroupScreenState();
}

class _CreateGroupScreenState extends State<CreateGroupScreen> {
  bool isLoading = true;
  var groupList = [];
  List<QueryDocumentSnapshot<Map<String, dynamic>>> users = [];
  @override
  void initState() {
    FirebaseFirestore.instance.collection("userslist").get().then((value) {
      setState(() {
        users = value.docs
            .where((element) =>
                element.id != FirebaseAuth.instance.currentUser!.uid)
            .toList();
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Users"),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: users.length,
              itemBuilder: (ctxx, index) {
                return ListTile(
                  trailing: Icon(
                      groupList.contains(users[index].data()['userId'])
                          ? Icons.check_box
                          : Icons.check_box_outline_blank_rounded),
                  title: Text(users[index].data()['userName'] ?? ""),
                  leading: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(const CircleBorder()),
                        padding: MaterialStateProperty.all(EdgeInsets.zero)),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                                contentPadding: EdgeInsets.zero,
                                shape: const RoundedRectangleBorder(),
                                content: SizedBox(
                                  height: 300,
                                  width: 300,
                                  child: Image.network(
                                      users[index]['userImageUrl']),
                                ),
                              ));
                    },
                    child: CircleAvatar(
                      radius: 26,
                      backgroundImage:
                          NetworkImage(users[index]['userImageUrl']),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      if (groupList.contains(users[index].data()['userId'])) {
                        groupList.remove(users[index].data()['userId']);
                      } else {
                        groupList.add(users[index].data()['userId']);
                      }
                    });
                    //   Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (ctx) => FriendScreen(
                    //       userName: users[index]['userName'],
                    //       imageUrl: users[index]['userImageUrl'],
                    //       userId: users[index]['userId'],
                    //       seen: 0,
                    //       isFromProduct: true,
                    //     ),
                    //   ),
                    // );
                  },
                );
              },
            ),
      floatingActionButton: ElevatedButton(
          onPressed: groupList.isEmpty
              ? null
              : () {
                  var addedGroupList = users
                      .where((user) => groupList
                          .any((element) => user.data()['userId'] == element))
                      .toList();
                  FirebaseFirestore.instance
                      .collection(FirebaseAuth.instance.currentUser!.uid)
                      .doc('chatfield')
                      .collection('chats')
                      .doc('ASDASDAASasdasdwerwegerASDA1A')
                      .set(
                    {
                      'userid': 'ASDAASasdasdwerwegerASDA1A',
                      'isGroup': true,
                      'group_members': groupList,
                      'username': "Friends group",
                      'image_url':
                          'https://firebasestorage.googleapis.com/v0/b/onlychat-e39c6.appspot.com/o/images.jpeg?alt=media&token=0e22ae5c-e37f-4f80-87f7-9877af3de88c',
                      'messagelength': "0",
                      'seen': "0",
                      'lastmessage': 'you create the group',
                      'lastmessagedate': Timestamp.now(),
                    },
                  );
                  for (var element in addedGroupList) {
                    FirebaseFirestore.instance
                        .collection(element.data()['userId'])
                        .doc('chatfield')
                        .collection('chats')
                        .doc('ASDASDAASasdasdwerwegerASDA1A')
                        .set(
                      {
                        'userid': 'ASDAASasdasdwerwegerASDA1',
                        'isGroup': true,
                        'group_members': groupList,
                        'username': "Friends group",
                        'image_url':
                            'https://firebasestorage.googleapis.com/v0/b/onlychat-e39c6.appspot.com/o/images.jpeg?alt=media&token=0e22ae5c-e37f-4f80-87f7-9877af3de88c',
                        'messagelength': "0",
                        'seen': "0",
                        'lastmessage': 'admin added you',
                        'lastmessagedate': Timestamp.now(),
                      },
                    );
                  }
                },
          child: const Text("Create")),
    );
  }
}

Future<void> addContact(String contactId) async {
  await FirebaseFirestore.instance
      .collection('userslist')
      .doc(contactId)
      .get()
      .then((document) {
    FirebaseFirestore.instance
        .collection(FirebaseAuth.instance.currentUser!.uid)
        .doc('chatfield')
        .collection('chats')
        .doc(contactId)
        .set(
      {
        'userid': document.data()!['userId'],
        'username': document.data()!['userName'],
        'image_url': document.data()!['userImageUrl'],
        'messagelength': "0",
        'seen': "0",
        'lastmessage': '',
        'lastmessagedate': Timestamp.now(),
      },
    );
    FirebaseFirestore.instance
        .collection(contactId)
        .doc('chatfield')
        .collection('chats')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set(
      {
        'userid': FirebaseAuth.instance.currentUser!.uid,
        'username': FirebaseAuth.instance.currentUser!.displayName,
        'image_url': FirebaseAuth.instance.currentUser!.photoURL,
        'messagelength': "0",
        'seen': "0",
        'lastmessage': '',
        'lastmessagedate': Timestamp.now(),
      },
    );
  });
}

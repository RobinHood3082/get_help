import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_help/models/counseling_post.dart';

class CounselingRepository {
  final user = FirebaseAuth.instance.currentUser;

  var db = FirebaseFirestore.instance;

  Future<void> addCounselingPost(CounselingPost post) async {
    await db.collection("posts").add(post.toJson()).then(
        (DocumentReference doc) =>
            print('DocumentSnapshot added with ID: ${doc.id}'));
    // print(response.toString());
  }

  Future<List<CounselingPost>> getAllCounselingPosts() async {
    List<CounselingPost> posts = [];
    await db.collection("posts").get().then((event) {
      for (var doc in event.docs) {
        posts.add(CounselingPost.fromJson(doc.data()));
      }
      // querySn÷apshot.docs.forEach((doc) {
      // });
    });
    return posts;
  }
}

import 'package:get_help/core/utils/notifier_state.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_help/data/repository/counseling_repository.dart';
import 'package:get_help/models/counseling_post.dart';

class StudentCounselingProvider extends ChangeNotifier {
  NotifierState _notifierState = NotifierState.initial;
  NotifierState get notifierState => _notifierState;

  bool _checkedAnonymous = false;
  bool get checkedAnonymous => _checkedAnonymous;

  void checkAnonymous() {
    print('checked');
    _checkedAnonymous = !_checkedAnonymous;
    notifyListeners();
  }

  final user = FirebaseAuth.instance.currentUser;

  final counselingRepository = CounselingRepository();

  Future<void> addPost(String title, String description) async {
    try {
      _setState(NotifierState.loading);
      final displayName = user?.displayName;
      final String studentName =
          displayName?.substring(0, displayName.length - 8) ?? '';
      final String studentID = user?.email!.substring(1, 8) ?? '';
      final String image = user?.photoURL ??
          'https://upload.wikimedia.org/wikipedia/commons/8/89/Portrait_Placeholder.png';

      final CounselingPost post = CounselingPost(
        title: title,
        description: description,
        isAnonymous: _checkedAnonymous,
        studentName: studentName,
        studentID: studentID,
        image: image,
      );
      debugPrint(post.toString());
      await counselingRepository.addCounselingPost(post);
      _setState(NotifierState.loaded);
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  void _setState(NotifierState notifierState) {
    _notifierState = notifierState;
    notifyListeners();
  }
}

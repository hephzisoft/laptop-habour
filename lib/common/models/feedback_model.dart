import 'package:firebase_auth/firebase_auth.dart';

class Feedback {
  final User? user;
  final String? description;
  final String? title;

  Feedback({
    this.user,
    this.description,
    this.title,
  });
}

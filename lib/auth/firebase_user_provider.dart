import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class BookAppFirebaseUser {
  BookAppFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

BookAppFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<BookAppFirebaseUser> bookAppFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<BookAppFirebaseUser>(
      (user) {
        currentUser = BookAppFirebaseUser(user);
        return currentUser!;
      },
    );

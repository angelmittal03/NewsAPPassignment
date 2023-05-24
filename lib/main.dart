import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newapp/PresentationLayer/Screens/LoginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';

//firebase initialisation
class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? get currentUser => _firebaseAuth.currentUser;
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password
  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password
  }) async {
    await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<void> sendResetPasswordEmail({
    required String email}) async {
    await _firebaseAuth.sendResetPasswordEmail(email: email);
  }
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
String authErrorRegister ='';
String authErrorlogin ='';

//MainApp Context
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const NewsAppMain())
}

class NewsAppMain extends StatelessWidget {
  const NewsAppMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppBloc(),
      child: MaterialApp(
        title: 'Giffy News',
        theme: ThemeData(
          primaryColorDark: Colors.white,

        ),
        home: const LoginPage(),
      ),
    );
  }
}





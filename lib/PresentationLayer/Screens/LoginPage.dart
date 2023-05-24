import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newapp/Bloc/app_bloc.dart';
import 'package:newapp/PresentationLayer/Screens/HomePage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String _username = '';
  String _password = '';

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        if (state is AppStateLoggedIn){
          return HomePage();
        }
        if (state is AppStateLoggedOut){
          return Scaffold(
              body: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(40, 140, 40, 0),
                        // MediaQuery.of(context).size.height*0.2
                        child: Column(
                          children: [

                            Image.asset('lib/PresentationLayer/Assets/Newspapericon.png',
                              width: 150,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(height: 30.0),
                            Text('GIFFY NEWS !',
                                style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold)),
                            SizedBox(height: 30.0),
                            TextField(
                              controller: emailController,
                              onSubmitted: (_username){
                                context.read<AppBloc>().emit(AppStateLoggedOut(isLoading: false, successful: false));
                              },
                              decoration: InputDecoration(
                                labelText: 'Enter Username',
                                border: OutlineInputBorder(),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  _username = value;
                                });
                              },
                            ),
                            SizedBox(height: 16.0),
                            TextField(
                              controller: passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: 'Enter Password',
                                border: OutlineInputBorder(),
                              ),
                              onChanged: (password) {
                                setState(() {
                                  _password = password;
                                });
                              },
                            ),
                            SizedBox(height: 20.0),
                            ElevatedButton(
                                onPressed: (){


                                }, child: Text('Login')) ,
                            SizedBox(height: 20.0),
                            ElevatedButton(
                                onPressed: (){

                                }, child: Text('Create an account')) ,

                          ],

                        ),
                      )
                  )
              )
          );
        }
       }
       );
  }
}


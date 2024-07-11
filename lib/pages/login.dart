import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:untitled2/services/user.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  bool _obscure = true;
  IconData _obscureIcon = Icons.visibility_off;

  Widget buttonContent = Text('Log in');

  Widget loadingDisplay = CircularProgressIndicator();

  Future<bool> login(User user)async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:8080/api/v1/Auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'usernameOrEmail': user.email,
        'password': user.password
      }),
    );
    if(response.statusCode == 200){
      return true;
    }
    return false;

    //print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.cyan[100],
        body: SafeArea(
        child: Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage('assets/Cone.jpg'),
    fit: BoxFit.cover
    ),
    ),

        child: Padding(
          padding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 0),
          child: Column(
            children: <Widget>[
            Text(
            'Login your account',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              letterSpacing: 2.0,
              fontSize: 24.5,
            ),
          ),
            SizedBox(height: 30.0,),
          Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextFormField(
                  maxLength: 40,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.mail),
                    label: Text('Email'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)
                    ),
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Please provide a email';
                    }
                    if(value.length < 2){
                      return 'Email should be atleast 10 letters long';
                    }
                    return null;
                  },
                  onSaved: (value){
                    email = value!;
                  },
                ),

                SizedBox(height: 20.0,),
                TextFormField(
                  maxLength: 40,
                  obscureText: _obscure,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_rounded),
                    suffixIcon: IconButton(
                      icon:  Icon(_obscureIcon),
                      onPressed: (){
                        setState(() {
                          _obscure = !_obscure;
                          if(_obscure){
                            _obscureIcon = Icons.visibility_off;
                          }else{
                            _obscureIcon = Icons.visibility;
                          }
                        });
                      }
                    ),
                    label: Text('Password'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)
                    ),
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Please provide a password';
                    }
                    if(value.length < 8){
                      return 'Password should be atleast 8 characters long';
                    }
                    if(value.length >20){
                      return 'Please must be 20 characters long only';
                    }
                    return null;
                  },
                  onSaved: (value){
                    password = value!;
                  },
                ),
                SizedBox(height: 25.0,),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      User user = User(
                        username: '',
                        email: email,
                        password: password,
                      );
                      /*if(login(user)){
                        Navigator.pushReplacementNamed(context, '/dashboard');
                      }
                    }*/
                      setState(() {
                        buttonContent = FutureBuilder(
                            future: login(user),
                            builder: (context, snapshots) {
                              if (snapshots.connectionState ==
                                  ConnectionState.waiting) {
                                return loadingDisplay;
                              }
                              if (snapshots.hasData) {

                              }
                              return Text('Log in');
                            }

                        );
                      });
                      Navigator.pushReplacementNamed(context, '/');
                    }
                  },
                  child: buttonContent,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[300],
                      foregroundColor: Colors.black
                  ),
                ),
                SizedBox(height: 25.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'or',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25.0,),
                ElevatedButton(
                    onPressed: (){},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.g_mobiledata),
                        Text('Login with Google'),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white70,
                      foregroundColor: Colors.red
                    ),
                ),
                SizedBox(height: 5.0,),
                ElevatedButton(
                    onPressed: (){},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.facebook),
                        Text('Login with Facebook'),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[700],
                      foregroundColor: Colors.black
                    ),
                ),
                SizedBox(height: 40.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Dont have an account?',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 5.0,),
                    InkWell(
                      child: Text(
                        'Sign Up',
                         style: TextStyle(
                          color: Colors.blue[800],
                          fontWeight: FontWeight.bold,
                      ),
                      ),
                      onTap: ()=> Navigator.pushReplacementNamed(context,'/signup'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ],
        ),
      ),
    ),
    ),
    );
  }

}

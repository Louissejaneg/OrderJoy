import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled2/services/user.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final formKey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String password = '';
  bool _obscure = true;
  IconData _obscureIcon = Icons.visibility_off;

createAccount(User user) async{
  final response = await http.post(
    Uri.parse('http://10.0.2.2:8080/api/v1/Auth/register/user'),
    headers : <String, String>{
      'Content-Type' : 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'username' : user.username,
      'email' : user.email,
      'password' : user.password,
    }),
  );
  print(response.body);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Signup',
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
                        prefixIcon: Icon(Icons.person),
                        label: Text('Name'),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                      ),
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'Please provide a name';
                        }
                        if(value.length < 2){
                          return 'Name should be atleast 3 letters long';
                        }
                        return null;
                      },
                      onSaved: (value){
                        name = value!;
                      },
                    ),
                    SizedBox(height: 20.0,),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      maxLength: 40,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.mail),
                        label: Text('Email'),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)
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
                      obscureText: _obscure,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_rounded),
                        suffixIcon: IconButton(
                          icon: Icon(_obscureIcon),
                          onPressed: (){
                            setState(() {
                              _obscure = !_obscure;
                              if(_obscure){
                                _obscureIcon = Icons.visibility_off;
                              }else{
                                _obscureIcon = Icons.visibility;
                              }
                            });
                          },
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
                    onPressed: (){
                      if(formKey.currentState!.validate()){
                        formKey.currentState!.save();
                        User user = User(
                          username: name,
                          email: email,
                          password: password
                        );
                        createAccount(user);
                      }
                    },
                    child: Text('Create Account'),
                  style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
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
                          Text('Continue with Google'),
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
                          Text('Continue with Facebook'),
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
                          'Already have an account?',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 5.0,),
                        InkWell(
                          child: Text(
                            'Log In',
                            style: TextStyle(
                              color: Colors.blue[800],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: ()=> Navigator.pushReplacementNamed(context,'/login'),
                        ),
                      ],
                    ),
            ],
          ),
        ),
    ]
      ),
    ),
      ),
    ),
    );
  }
}

import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  String username = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[100],
      body: SafeArea(
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
                    label: Text('Username'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)
                    ),
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Please provide a username';
                    }
                    if(value.length < 2){
                      return 'username should be atleast 3 letters long';
                    }
                    return null;
                  },
                  onSaved: (value){
                    username = value!;
                  },
                ),

                SizedBox(height: 20.0,),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
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
                      return 'Name should be atleast 8 characters long';
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
                      print(username);
                      print(password);
                    }
                  },
                  child: Text('Log In'),
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
                      'or Login with',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50.0,),
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
                      backgroundColor: Colors.red[900],
                      foregroundColor: Colors.black
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
                      backgroundColor: Colors.blue[900],
                      foregroundColor: Colors.black
                    ),
                ),
                SizedBox(height: 40.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Dont hava an account?',
                      style: TextStyle(
                        color: Colors.grey[600],
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
    );
  }

}

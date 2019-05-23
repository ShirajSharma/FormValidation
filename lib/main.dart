import 'package:flutter/material.dart';

void main()=> runApp(myApp());

class myApp extends StatelessWidget{  
  Widget build(BuildContext context){  
    return new MaterialApp(
      home:ShirajApp(),
      title:'My Simple Flutter App',  
      theme:new ThemeData(   
        primarySwatch:Colors.indigo,
      ), 
    );
  }
}

class ShirajApp extends StatefulWidget{   
  _ShirajAppState createState() => _ShirajAppState();
}

class _ShirajAppState extends State<ShirajApp>{
  String _email,_username,_password;
  bool loggedIn = false;  
  final formkey = GlobalKey<FormState>();
  final mainkey = GlobalKey<ScaffoldState>();
  Widget build(BuildContext context){  
    return Scaffold( 
      key:mainkey,  
      appBar:new AppBar(  
        title:new Text('Form Login and Logout Application'),
      ),
      body:new Padding(  
        padding:const EdgeInsets.all(10.32),
        child:loggedIn==false? new Form(
          key:formkey,
          child:new Column(   
          children:<Widget>[   
            TextFormField(
              autocorrect:false,
              decoration:new InputDecoration(   
                labelText:'Enter your email'
              ),
              validator:(str)=> 
              !str.contains('@')? "Enter a valid email" :null,
              onSaved:(str)=> 
              _email=str,
            ),
            TextFormField(
              autocorrect:false,
              decoration:new InputDecoration(   
                labelText:'Enter your username',
                hintText:'Name of your dog',
              ),
              validator:(str)=> 
              str.length<=5? "Enter a valid username" :null,
              onSaved:(str)=> 
              _username=str,
            ),
            TextFormField(
              autocorrect:false,
              decoration:new InputDecoration(   
                labelText:'Enter your password',
                hintText:'It is 7 character in length',
              ),
              validator:(str)=> 
              str.length<=6? "Enter a valid password" :null,
              onSaved:(str)=> 
              _password=str,
              obscureText:true,
            ),
            RaisedButton(  
              child:new Text('Sign In'),
              onPressed:onPressed,
            ),
          ],
        ),
      )
      :Center(  
       child:new Column(   
         children:<Widget>[  
           Text('Welcome $_username'),
           RaisedButton(  
             child:new Text('Log Out'),
             onPressed:(){  
               setState((){  
                 loggedIn = false;
               });
               }
             )
             ]
             )
            )),
    );
  }
  void onPressed(){  
    var form = formkey.currentState;
    if(form.validate()){  
      form.save();
      setState((){  
        loggedIn = true;
      });
  var snackbar=  SnackBar( 
    content:new Text(  
  "Email:_email,Username:_username,Password:_password"
  ),
  duration:new Duration(milliseconds:5000),
  );
  mainkey.currentState.showSnackBar(snackbar);
}
}
}
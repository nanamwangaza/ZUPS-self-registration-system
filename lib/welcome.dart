import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:zups/create_account.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1d3557),
              Colors.white,
              Color(0xFF1d3557)
            ]
          )
        ),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              
              Text("Zanzibar Universal Pension Registration",style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18
              ),
              ),
              SizedBox(
                height: 50,
              ),
              CircleAvatar(
                  radius: 100,
                  backgroundColor: Colors.white,
                  child: ClipOval(
                    child: Image.asset(
                      'assets/logo.jpg',
                      width: 150.0,
                      height: 150.0,
                      fit: BoxFit.cover,
                    ),
                  )
                  ),

              SizedBox(
                height: 30,
              ),


              Text(
                "Welcome!",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Color(0xFF1d3557)),
              ),

              SizedBox(height: 150,),

               Container(
                 width: 300,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 10,
                            offset: Offset(0, 3),
                          ),
                        ],),
                 child: TextButton(
                            onPressed: (){
                               Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CreateAccount()),
                                );
                            },
                            child: Text(
                              "CONTINUE",
                              style: TextStyle(color: Color(0xFF1d3557)),
                            )
                            ),
               ),
            ],
          ),
        ),
      ),
    );
  }
}

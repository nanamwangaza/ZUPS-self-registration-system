import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:zups/create_account.dart';

class Karibu extends StatefulWidget {
  const Karibu({Key? key}) : super(key: key);

  @override
  State<Karibu> createState() => _KaribuState();
}

class _KaribuState extends State<Karibu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/zanzibar.jpg'),
                fit: BoxFit.cover
              )
            ),
          ),
            

            Container(
              color: Colors.lightBlue.withOpacity(0.4),
            ),

            Container(
              child: Column(
                children: [

                  Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: Text(
                      "Karibu!",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30
                    ),),
                  ),
                         Padding(
                           padding: const EdgeInsets.only(top:0),
                           child: Image.asset("assets/logo2.png",
                           width: 200,
                           height: 200,),
                         ),
                  
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          'Zanzibar Universal Pension Scheme',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold
                        ),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text('Honoring our elders is respecting our past, securing our present and',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 40
                      ),),
                    ),
                  ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('shaping our future...',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 12
                      ),),
                    ],
                  ),

                  SizedBox(
                    height: 50,
                  ),

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
                              "ENDELEA",
                              style: TextStyle(color: Colors.lightBlue),
                            )
                            ),
               ),
                ],

                
              ),
            )

        ],
      )
    );
  }
}
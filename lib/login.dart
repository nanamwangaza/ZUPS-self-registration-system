
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:zups/create_account.dart';
import 'package:zups/maelezo_binafsi.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // bool _checkedValue = false;

  final _formKey = GlobalKey<FormState>();
  String? _email;
  String? _password;

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Make API request to authenticate user
      final response = await http.post(
        Uri.parse('http://localhost:8000/api/login'),
        body: {
          'email': _email,
          'password': _password,
        },
      );

      if (response.statusCode == 200) {
        // User is authenticated, save their token or other credentials
        // and navigate to the next screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Registration()),
        );
      } else {
        // Display an error message to the user
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Login Failed'),
              content: Text('Incorrect email or password'),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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

            
Padding(
  padding: const EdgeInsets.only(top: 50,bottom: 10,left: 20,right: 20),
  child:   Container(
  
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      color: Colors.white,
    ),
  
        child:ListView(
        children: [
          Center(
            child: SafeArea(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Image.asset("assets/logo2.png",
                            
                      width: 200,
                            
                      height: 200,),
        


                    Text(
                      "INGIA",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.lightBlue,
                      ),
                    ),

                    // Column with text and text field
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Barua pepe",
                            style: TextStyle(color: Colors.lightBlue),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 10,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: SizedBox(
                              height: 60,
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Tafadhali ingiza barua pepe';
                                  }
                                  if (!RegExp(r'\S+@\S+\.\S+')
                                      .hasMatch(value)) {
                                    return 'Tafadhali ingiza barua pepe sahihi';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _email = value;
                                },
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  label: Text("Ingiza barua pepe"),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),

                    //  Column for password
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Nenosiri",
                            style: TextStyle(color: Colors.lightBlue),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 10,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: SizedBox(
                              height: 60,
                              child: TextFormField(
                                obscureText: true,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Tafadhali ingiza nenosiri';
                                  }
                                  if (value.length < 8) {
                                    return 'Nenosiri liwe na angalau herufi 8';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _password = value;
                                },
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  label: Text("Ingiza nenosiri"),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Forgot password?",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),

                    // Checkbox list tile
                    // CheckboxListTile(
                    //   title: Text(
                    //     'Remember me',
                    //     style: TextStyle(
                    //       color: Colors.white,
                    //       fontWeight: FontWeight.bold,
                    //     ),
                    //   ),
                    //   value: _checkedValue,
                    //   activeColor: Colors.white,
                    //   checkColor: Colors.black,
                    //   onChanged: (newValue) {
                    //     setState(() {
                    //       _checkedValue = newValue!;
                    //     });
                    //   },
                    // ),

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
                        ],
                      ),
                      child: TextButton(
                          onPressed: _submitForm,
                          child: Text(
                            "INGIA",
                            style: TextStyle(color: Colors.lightBlue),
                          )),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Huna akaunti?",
                          style: TextStyle(color: Colors.lightBlue),
                        ),
                        SizedBox(width: 10),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CreateAccount()),
                              );
                            },
                            child: Text(
                              "Jisajili",
                              style: TextStyle(
                                  color: Colors.lightBlue,
                                  fontWeight: FontWeight.bold),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    )
     ,
),

           
        ],
      )
    );
  }}
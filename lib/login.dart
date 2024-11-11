// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // TODO: Add text editing controllers (101)
  final _usernameCntroller = TextEditingController();
  final _passwordController = TextEditingController();
  

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            const SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                Image.asset('assets/diamond.png'),
                const SizedBox(height: 16.0),
                const Text('SHRINE'),
              ],
            ),
            const SizedBox(height: 120.0),
            // TODO: Remove filled: true values (103)
            TextField(

               controller: _usernameCntroller,
            
             
              decoration: const InputDecoration(
                filled: true,
                labelText: 'Username',
              ),
            ),

            const SizedBox(height:120.0),

            TextField(
              controller: _passwordController,
              decoration:const InputDecoration(
            filled: true,
            labelText: 'Password',  
              ),obscureText:true,),
            // TODO: Add TextField widgets (101)
           
            // TODO: Add button bar (101)

            OverflowBar(
              alignment: MainAxisAlignment.end,
              children:<Widget>[
                TextButton(
                  
                  child: const Text('CANCEL') ,
                  onPressed: (){
                    _usernameCntroller.clear();
                    _passwordController.clear();
                    //to do clear the text fields
                  },),
                  //todo elevation to next
                  //todo beveled rectangular border to next 
                  ElevatedButton(
                    child: const Text('NEXT'),
                    onPressed:(){
                      Navigator.pop(context);
                     //todo show next page 
                    },),
              ])
          ],
        ),
      ),
    );
  }
}

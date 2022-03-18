
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Fo extends StatefulWidget {
  static const routName = '/z';
  const Fo({ Key? key }) : super(key: key);

  @override
  State<Fo> createState() => _FoState();
}

class _FoState extends State<Fo> {
  final _formkey = GlobalKey<FormState>();
   var database = {
    'nom': '',
    'prenom': '',
    'number': '',
    
  };
  void _saveform() async{
    final isValid = _formkey.currentState!.validate();
    if (!isValid) {
      return;
    }
      _formkey.currentState!.save();
 var url = Uri.parse('https://utilisateur-7d6c7-default-rtdb.firebaseio.com/constact.json');
var response = await http.post(url, body: json.encode(database));
print('Response status: ${response.statusCode}');
print('Response body: ${response.body}');
      


  }
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            //width: width * 0.99,
            margin: EdgeInsets.symmetric(horizontal: 10),
            //color: Colors.red,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
            Container(
               margin: EdgeInsets.only(top: 40),
            child: TextFormField(
              decoration: InputDecoration(prefixIcon: Icon(Icons.search)),
              keyboardType: TextInputType.text,
            ),
          ),
           SizedBox(height: 250),
                Container(
                  width: width * 0.98,
                  height:300,
                  //color: Colors.red,
                  child: ListView(
                    children: [
                      Form(
                        key: _formkey,
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 5),
                              child: Text(
                                "Nom",
                                style: TextStyle(
                                  fontSize: 17
                                ),
                              ),
                            ),
                            SizedBox(height: height * 0.01,),
                            TextFormField(
                              onSaved: (value){
                                database['nom']= value!;
                              },
                              
                              decoration: InputDecoration(
                                
                                fillColor: Colors.grey[300],
                                filled: true,
                                border: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide.none
                                ),
                              ),
                              validator: (value){
                                if (value!.length <=0 || value.isEmpty) {
                                  return 'Entrez un nom svp';
                                  
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
                            ),
                    //--------------------------------------------------------
                            SizedBox(height: height * 0.01,),
                             Container(
                              padding: EdgeInsets.only(left: 5),
                              child: Text(
                                "Prenom",
                                style: TextStyle(
                                  fontSize: 17
                                ),
                              ),
                            ),
                            SizedBox(height: height * 0.01,),
                            TextFormField(
                              onSaved: (value){
                                database['prenom']= value!;
                              },
                              decoration: InputDecoration(
                                
                                fillColor: Colors.grey[300],
                                filled: true,
                                border: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide.none
                                ),
                              ),
                              validator: (value){
                                if (value!.length <=0 || value.isEmpty) {
                                  return 'Entrez un Prenom svp';
                                  
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
                            ),
                            //--------------------------------------------------------
                          
                           Container(
                              padding: EdgeInsets.only(left: 5),
                              child: Text(
                                "Number",
                                style: TextStyle(
                                  fontSize: 17
                                ),
                              ),
                            ),
                            SizedBox(height: height * 0.01,),
                            TextFormField(
                              onSaved: (value){
                                database['number']= value!;
                              },
                              decoration: InputDecoration(
                                
                                fillColor: Colors.grey[300],
                                filled: true,
                                border: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide.none
                                ),
                              ),
                               validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter you phone';
                            }
                            return null;
                          },
                              keyboardType: TextInputType.number,
                            ),
                    //--------------------------------------------------------
                               
                          ],
                        )
                      )
                    ],
                  ),
                ),
                Container(
                  width: width * 0.6,
                  height: height * 0.06,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.yellow[600]
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      _saveform();
                      {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('patientez svp')),
                        );
                        Navigator.pop(context);
                      }
                    
                      // if (database['motdepass']==database['confirmation']) {
                        
                      // }
                      // else{
                      //   print('different');
                      //   setState(() {
                      //     var erro='les mots de pass doivent etre correct';
                      //   });
                      // }
                      
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.yellow[600],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)
                      )
                    ),
                    child: Text(
                      "S'incrire",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                      ),
                    ),
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

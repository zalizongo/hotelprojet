import 'package:flutter/material.dart';

class Formulaire extends StatefulWidget {
  static const routName = '/p';
  const Formulaire({Key? key}) : super(key: key);

  @override
  State<Formulaire> createState() => _FormulaireState();
}

class _FormulaireState extends State<Formulaire> {
  @override
  Widget build(BuildContext context) {
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

  }
  final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.all(8.0),
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
          Spacer(),
          
          Container(
            width: width * 0.98,
            height: height * 0.5,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                Form(
                    key: _formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            "Nom",
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            fillColor: Colors.grey[300],
                            filled: true,
                            border: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none),
                          ),
                          keyboardType: TextInputType.text,
                          onSaved: (value) {
                            database['nom'] = value!;
                          },
                          validator: (value) {
                            if (value!.length <= 0 || value.isEmpty) {
                              return 'Entrez un nom svp';
                            }
                            return null;
                          },
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            "Prenom",
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            fillColor: Colors.grey[300],
                            filled: true,
                            border: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none),
                          ),
                          keyboardType: TextInputType.name,
                          onSaved: (value) {
                            database['prenom'] = value!;
                          },
                          validator: (value) {
                            if (value!.length <= 0 || value.isEmpty) {
                              return 'Entrez un Prenom svp svp';
                            }
                            return null;
                          },
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            "Number",
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            fillColor: Colors.grey[300],
                            filled: true,
                            border: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none),
                          ),
                          keyboardType: TextInputType.number,
                          onSaved: (value) {
                            database['number'] = value!;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter you phone';
                            }
                            return null;
                          },
                        ),
                          SizedBox(height: height * 0.05,),
                          Container(
                            child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                           primary: Colors.yellow[600],
                          shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(30)
                      )
                    ),
                     onPressed:(){
                       _saveform();
                              {
                        
                        //Navigator.pop(context);
                         }
                            } ,child: Text('Enregister',style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                      ),),),
                              width: width * 0.9,
                              height: height * 0.06,
                              decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.yellow[600]
                              
                  ),
                          )
                      ],
                    ))
              ],
            ),
          )
        ],
      ),
    )));
  }
}

import 'dart:io';

import 'package:mytown_itfest_2024/main.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import 'package:cloud_functions/cloud_functions.dart';

class LostSearchForm extends StatefulWidget {
  @override
  _LostSearchForm createState() => _LostSearchForm();
}

class _LostSearchForm extends State<LostSearchForm> {
  bool isLoading = false;
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  //FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  TextEditingController denumireObiect = TextEditingController();
  TextEditingController descObiect = TextEditingController();

  int _currentStep = 0;
  StepperType stepperType = StepperType.vertical;

  XFile? file;
  // image picker method for uploading images of the object
  Future pickImage() async {
    ImagePicker imagePicker = ImagePicker();
    file = await imagePicker.pickImage(source: ImageSource.gallery);
    print('${file?.path}');

    if (file == null) return;
  }

  Future<void> checkMatches(String descriere) async{
    HttpsCallable callable = FirebaseFunctions.instance.httpsCallable('checkSearchMatches');
    final results = await callable();
    //print(results.data);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        backgroundColor: Colors.white,
        body: Theme(
          data: ThemeData(
            /*
            colorScheme: Theme.of(context).colorScheme.copyWith(
                  primary: accentColor,
                  background: accentColor,
                  secondary: accentColor,
                ),
                */
          ),
          child: Stepper(
            type: stepperType,
            physics: const ScrollPhysics(),
            currentStep: _currentStep,
            onStepContinue: () {
              if (_currentStep == 0) {
                if (_formKey1.currentState!.validate()) {
                  // verify data with db
                  checkMatches(denumireObiect.text);

                  FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;
                  var date = DateTime.now().toString().split(' ')[0].split('-');
                  var uuid = Uuid();
                  print(denumireObiect.text);
                  firestoreInstance
                    .collection("lostObjects")
                    .doc(uuid.v1())
                    .set({
                      "uniqueID": uuid.v1(),
                      "denumireObiect": denumireObiect.text,
                      "descObiect": descObiect.text,
                      "userId": 1,
                      "isFound": false,
                      "registrationDate": date,
                    }).then((res) {
                  //Get a reference to storage root
                  Reference referenceRoot = FirebaseStorage.instance.ref();
                  Reference referenceDirImages =
                      referenceRoot.child('lostItems');

                  //Create a reference for the image to be stored
                  Reference referenceImageToUpload =
                      referenceDirImages.child(uuid.v1());
                  
                  //Handle errors/success
                  try {
                    //Store the file
                    referenceImageToUpload.putFile(File(file!.path));
                  } catch (error) {
                    //Some error occurred
                    print(error);
                  }
                  }).catchError((err) {
                    print(err);
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Error"),
                            content: Text(err.message),
                            actions: [
                              TextButton(
                                child: Text("Ok"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              )
                            ],
                          );
                        });
                  });


                  setState(() {
                    _currentStep += 1;
                  });
                }
              }
              // post ticket OR report ticket as checked
              else if (_currentStep == 1) {
                if (_formKey2.currentState!.validate()) {
                  //registerToFb();
                }
              }
            },
            onStepCancel: () {
              setState(() {
                if (_currentStep > 0) {
                  _currentStep -= 1;
                }
              });
            },
            steps: <Step>[
              // first step
              Step(
                title: const Text(
                  'Spune-ne mai multe despre obiect',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      //color: headerTextColor
                      ),
                ),
                content: Form(
                  key: _formKey1,
                  child: Column(
                    children: <Widget>[
                      // textbox nume proiect
                      TextFormField(
                        controller: denumireObiect,
                        decoration: const InputDecoration(
                            labelText: 'Denumire obiect',
                            labelStyle: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                //color: lighterTextColor
                                )),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Nu poți lăsa acest spațiu liber!';
                          }
                          return null;
                        },
                      ),
                      // textbox descriere obiect
                      TextFormField(
                        maxLines: 8,
                        controller: descObiect,
                        decoration: const InputDecoration(
                            labelText: 'Descrie-ti obiectul pierdut \n(culoare, forma, repere importante)',
                            labelStyle: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                //color: lighterTextColor
                                )),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Nu poți lăsa acest spațiu liber!';
                          }
                          return null;
                        },
                      ),
                      /*
                      TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(
                            labelText: 'Adresa de email',
                            labelStyle: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                //color: lighterTextColor
                                )),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Nu poți lăsa acest spațiu liber!';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: phoneNrController,
                        decoration: const InputDecoration(
                            labelText: 'Număr de telefon',
                            labelStyle: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                //color: lighterTextColor
                                )),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Nu poți lăsa acest spațiu liber!';
                          }
                          return null;
                        },
                      ),
                      */
                      MaterialButton(
                        color: Color.fromARGB(255, 233, 43, 76),
                        child: const Text("Pick Image from Gallery",
                            style: TextStyle(
                              color: Colors.white,
                            )),
                        onPressed: () {
                          pickImage();
                      }),
                    ],
                  ),
                ),
                isActive: _currentStep >= 0,
                state:
                    _currentStep >= 0 ? StepState.complete : StepState.disabled,
              ),
              
              // pasul doi -> an gasit sau nu obiectul dupa desc dorita
              Step(
                title: const Text('Finalizează-ți cererea',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600
                        //color: headerTextColor
                        )),
                content: Form(
                  key: _formKey2,
                  child: Column(
                    children: <Widget>[
                      
                    ],
                  ),
                ),
                isActive: _currentStep >= 0,
                state:
                    _currentStep >= 2 ? StepState.complete : StepState.disabled,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
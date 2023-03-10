import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:lab9/model/student.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final formKey = GlobalKey<FormState>();
  Student myStudent = Student();
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  // ignore: prefer_final_fields
  CollectionReference _studentCollection =
      FirebaseFirestore.instance.collection("students");
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: firebase,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              appBar: AppBar(title: Text('Eror')),
              body: Center(child: Text('${snapshot.error}')),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {}
          return Scaffold(
              appBar: AppBar(title: Text('แบบฟอร์มกรอกข้อมูล')),
              body: Center(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: formKey,
                    child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('ชื่อ', style: TextStyle(fontSize: 20)),
                            TextFormField(
                              validator:
                                  RequiredValidator(errorText: 'กรุณาป้อนชื่อ'),
                              onSaved: (value) {
                                myStudent.fname = value;
                              },
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text('นามสกุล',
                                style: TextStyle(fontSize: 20)),
                            TextFormField(
                              validator: RequiredValidator(
                                  errorText: 'กรุณาป้อนนามสกุล'),
                              onSaved: (value) {
                                myStudent.lname = value;
                              },
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text('อีเมล', style: TextStyle(fontSize: 20)),
                            TextFormField(
                              validator: RequiredValidator(
                                  errorText: 'กรุณาป้อนอีเมล'),
                              onSaved: (value) {
                                myStudent.email = value;
                              },
                              keyboardType: TextInputType.emailAddress,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text('อุณหภูมิ',
                                style: TextStyle(fontSize: 20)),
                            TextFormField(
                              validator: RequiredValidator(
                                  errorText: 'กรุณาป้อนอุณหภูมิ'),
                              onSaved: (value) {
                                myStudent.temp = value;
                              },
                              keyboardType: TextInputType.number,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    textStyle: const TextStyle(fontSize: 20)),
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    formKey.currentState!.save();
                                    await _studentCollection.add({
                                      'fname': myStudent.fname,
                                      'lname': myStudent.lname,
                                      'email': myStudent.email,
                                      'temp': myStudent.temp,
                                    });
                                    formKey.currentState?.reset();
                                  }
                                },
                                child: const Text('บันทึก'),
                              ),
                            )
                          ]),
                    ),
                  ),
                ),
              ));
        });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:lab9/model/student.dart';

class FromScreen extends StatefulWidget {
  const FromScreen({super.key});

  @override
  State<FromScreen> createState() => _FromScreenState();
}

class _FromScreenState extends State<FromScreen> {
  final formKey = GlobalKey<FormState>();
  Student myStudent = Student();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Input From'),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Name', style: TextStyle(fontSize: 20)),
                    TextFormField(
                      validator: RequiredValidator(errorText: 'กรุณาป้อนชื่อ'),
                      onSaved: (value) {
                        myStudent.fname = value;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text('Lastname', style: TextStyle(fontSize: 20)),
                    TextFormField(
                      validator:
                          RequiredValidator(errorText: 'กรุณาป้อนนามสกุล'),
                      onSaved: (value) {
                        myStudent.lname = value;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text('Email', style: TextStyle(fontSize: 20)),
                    TextFormField(
                      validator: RequiredValidator(errorText: 'กรุณาป้อนอีเมล'),
                      onSaved: (value) {
                        myStudent.email = value;
                      },
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text('Temp', style: TextStyle(fontSize: 20)),
                    TextFormField(
                      validator:
                          RequiredValidator(errorText: 'กรุณาป้อนอุณหภูมิ'),
                      onSaved: (value) {
                        myStudent.temp = value;
                      },
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        child: const Text('Save'),
                        style: ElevatedButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 20)),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            print("${myStudent.fname}");
                            print("${myStudent.lname}");
                            print("${myStudent.email}");
                            print("${myStudent.temp}");
                          }
                        },
                      ),
                    )
                  ]),
            ),
          ),
        ));
  }
}

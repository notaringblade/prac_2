import 'package:flutter/material.dart';
import 'package:prac_2/models/data_model.dart';
import 'package:prac_2/pages/data_display_screen.dart';
import 'package:prac_2/widgets/default_button.dart';
import 'package:prac_2/widgets/text_field.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final DataModel _data = DataModel();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController collegeController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();
  bool data_valid = false;
  Future addToData() async {
    if (nameController.text.isNotEmpty &&
        ageController.text.isNotEmpty &&
        collegeController.text.isNotEmpty &&
        departmentController.text.isNotEmpty) {
      setState(() {
        _data.data.add({
          "name": nameController.text,
          "age": ageController.text,
          "college": collegeController.text,
          "department": departmentController.text
        });
        nameController.text = "";
        ageController.text = "";
        collegeController.text = "";
        departmentController.text = "";
        FocusScope.of(context).unfocus();
      });
      data_valid = true;
      print(_data.data);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Please enter required data")));
      data_valid = false;
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 180,
            ),
            CustomTextField(textController: nameController, hintText: "name"),
            SizedBox(
              height: 50,
            ),
            CustomTextField(textController: ageController, hintText: "age", inputType: TextInputType.number),
            SizedBox(
              height: 50,
            ),
            CustomTextField(
                textController: collegeController, hintText: "college"),
            SizedBox(
              height: 50,
            ),
            CustomTextField(
                textController: departmentController, hintText: "department"),
            SizedBox(
              height: 50,
            ),
            DefaultButtonWidget(
                onTap: () async {
                  await addToData();
                  if (data_valid) {
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DataDisplayScreen(data: _data.data),
                          ));
                    });
                  }
                },
                buttonName: "Submit"),
                SizedBox(height: 50,),
            DefaultButtonWidget(
                onTap: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DataDisplayScreen(data: _data.data),
                      ));
                },
                buttonName: "View Data")
          ],
        ),
      ),
    );
  }
}

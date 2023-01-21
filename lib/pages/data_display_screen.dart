import 'package:flutter/material.dart';
import 'package:prac_2/models/data_model.dart';

class DataDisplayScreen extends StatefulWidget {
  DataDisplayScreen({Key? key, required this.data}) : super(key: key);
  
  final List data;
  _DataDisplayScreenState createState() => _DataDisplayScreenState();
}

class _DataDisplayScreenState extends State<DataDisplayScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Text("Display",
                style: TextStyle(
                  color: Colors.white,
                )),

            Table(
              children: const [
                TableRow(children: [
                  Text(
                    "Name",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "Age",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                    
                  ),
                  Text(
                    "College",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "Department",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ]),
              ],
              border: TableBorder.all(width: 2, color: Colors.white),
            ),
            SizedBox(height: 20,),
                      Divider(color: Colors.white, thickness: 2),

            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return Column(
                    children: const  [
                      SizedBox(height: 20,),
                      Divider(color: Colors.white, thickness: 2),
                    ],
                  );
                },
                itemCount: widget.data.length,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          widget.data[index]['name'],
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          widget.data[index]['age'],
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          widget.data[index]['college'],
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          widget.data[index]['department'],
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

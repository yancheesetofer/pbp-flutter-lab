import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/form.dart';
import 'package:counter_7/data.dart';


class PublicDrawer extends StatefulWidget {
  const PublicDrawer({super.key, required this.data, required this.addData});
  final List<Budget> data;
  final Function(Budget) addData;

  @override
  _PublicDrawerState createState() => _PublicDrawerState();
}

class _PublicDrawerState extends State<PublicDrawer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: Column(
          children: [
            ListTile(
              //home page
              title: const Text('counter_7'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyHomePage(
                            title: 'Program Counter',
                            data: widget.data,
                            addData: widget.addData,
                          )),
                );
              },
            ),
            ListTile(
              title: const Text('Tambah Budget'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyFormPage(
                            data: widget.data,
                            addData: widget.addData,
                          )),
                );
              },
            ),
            ListTile(
              title: const Text('Data Budget'),
              onTap: () {
                // form page
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyDataPage(
                            data: widget.data,
                            addData: widget.addData,
                          )),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'main.dart';
import 'drawer.dart';

class MyDataPage extends StatefulWidget {
  const MyDataPage({super.key, required this.data, required this.addData});
  final List<Budget> data;
  final Function(Budget) addData;

  @override
  State<MyDataPage> createState() => _MyDataPageState();
}

class _MyDataPageState extends State<MyDataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Budget Form'),
      ),

      // the drawer
      drawer: PublicDrawer(
        data: widget.data,
        addData: widget.addData,
      ),

      body: ListView.builder(
          itemCount: widget.data.length,
          itemBuilder: (BuildContext context, int index) {
            var budgetTitle = widget.data[index].judul;
            var date = widget.data[index].tanggal;
            return ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(1),
                  side: const BorderSide(color: Colors.black, width: 0.3),
                ),
                trailing: Text(widget.data[index].jenisBudget),
                subtitle: Text(widget.data[index].nominal.toString()),
                
                title: Text('$budgetTitle - $date'));
          }),
    );
  }
}
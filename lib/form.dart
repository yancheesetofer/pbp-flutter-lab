import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'drawer.dart';
import 'package:flutter/services.dart';
import 'main.dart';

class MyFormPage extends StatefulWidget {
  const MyFormPage({super.key, required this.data, required this.addData});

  final List<Budget> data;
  final Function(Budget) addData;

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _judul = "";
  String _nominal = "";
  String jenis = 'Pemasukan';
  List<String> jenisList = ['Pengeluaran', 'Pemasukan'];
  String tanggal = "";
  List<String> listData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Budget'),
      ),

      //drawer menu
      drawer: PublicDrawer(
        data: widget.data,
        addData: widget.addData,
      ),

      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Judul",
                          labelText: "Judul",
                          icon: const Icon(Icons.title),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.5),
                          ),
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            _judul = value!;
                          });
                        },
                        onSaved: (String? value) {
                          setState(() {
                            _judul = value!;
                          });
                        },
                        // Validator to check if title is empty
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Judul tidak boleh kosong!';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                          hintText: "Nominal",
                          labelText: "Nominal",
                          icon: const Icon(Icons.numbers),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.5),
                          ),
                        ),
                        onSaved: (String? value) {
                          setState(() {
                            _nominal = value!;
                          });
                        },
                        onChanged: (String? value) {
                          setState(() {
                            _nominal = value!;
                          });
                        },
                        // Validator
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Nominal tidak boleh kosong!';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20.0),
                      ListTile(
                        leading: const Icon(Icons.class_),
                        title: const Text(
                          'Pilih Jenis',
                        ),
                        trailing: DropdownButton(
                          value: jenis,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: jenisList.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              jenis = newValue!;
                            });
                          },
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        decoration: const InputDecoration(
                            icon:
                                Icon(Icons.calendar_today),
                            labelText: "Enter Date"
                            ),
                        readOnly: true,
                        onChanged: (String? newValue) {
                          setState(() {
                            tanggal = newValue!;
                          });
                        },
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(
                                  2000),
                              lastDate: DateTime(2101));

                          if (pickedDate != null) {
                            String formattedDate =
                                DateFormat('dd/MM/yyyy').format(pickedDate);

                            setState(() {
                              tanggal = formattedDate;
                            });
                          }
                        },
                      ),
                      const SizedBox(height: 20.0),
                      TextButton(
                        child: const Text(
                          "Simpan",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            var intNominal = int.parse(_nominal);
                            widget.addData(
                              Budget(
                                  _judul, intNominal, jenis, tanggal),
                            );

                            showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  elevation: 15,
                                  child: Container(
                                    child: ListView(
                                      padding: const EdgeInsets.only(
                                          top: 20, bottom: 20),
                                      shrinkWrap: true,
                                      children: <Widget>[
                                        Center(
                                            child:
                                                const Text('Informasi Data')),
                                        SizedBox(height: 20),
                                        // TODO: Munculkan informasi yang didapat dari form
                                        Text('Judul: $_judul'),
                                        Text('Nominal: $_nominal'),
                                        Text('Tipe: $jenis'),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('Back'),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                        },
                      ),
                    ],
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
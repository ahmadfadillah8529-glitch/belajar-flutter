import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  //kunci global form
  final _formKey = GlobalKey<FormState>();


  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  var _outputName = '';
  var _outputDate = '';

  @override
  void dispose() {
    //menghapus inputan yang sudah di isi
    _nameController.dispose();
    //mengeksekusi method dispose
    super.dispose();
  }

  void _submitForm() {
    setState(() {
      _outputName = _nameController.text;
    });
    print("Nama Lengkap : ${_nameController.text}");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Nama Lengkap : ${_nameController.text}")),
    );

    //memanggil method clear
    _clearInput;
  }

  void _clearInput() {
    //membersihkan isi textbox
    _nameController.clear();
  }

  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context, 
      initialDate: initialDate , 
      firstDate:DateTime(1990), 
      lastDate: DateTime(2026)
    );
    if (newDate == null) return;
    setState(() {
      _dateController.text = '${newDate.day}/${newDate.month}/${newDate.year}';
    });
      
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('My Form App')),
        body: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // Form fields will go here
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller : _nameController,
                    decoration: InputDecoration(
                      labelText: 'Masukan Nama ',
                      border: OutlineInputBorder(),
                    ),
                    validator:(value) {
                      if (value == null || value.isEmpty) {
                        return "Nama Tidak Boleh Kosong";
                      }
                      return null;
                    },
                  ), 
                ),

                SizedBox(height: 20),
                //Tanggal Lahir
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller : _dateController,
                    onTap: () {
                      pickDate(context);
                    },
                    decoration: const InputDecoration(
                      labelText: 'Start date',
                      hintText: 'Start date',
                      border: OutlineInputBorder(),
                      
                    ),
                    validator:(value) {
                      if (value == null || value.isEmpty) {
                        return "Nama Tidak Boleh Kosong";
                      }
                      return null;
                    },
                  ), 
                ),

                SizedBox(height: 20),
                OutlinedButton(onPressed: (){
                  if (_formKey.currentState!.validate()) {
                    _submitForm();
                  }
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.deepPurpleAccent, width: 1),
                ),
                 child: Text("Simpan Data"),
                ),
                Text(
                  'Nama : ${_outputName.isEmpty ? "-" : _outputName}',
                  style: const TextStyle(fontSize: 16),
                ),
                
              ],
            ),
          ),
        ),
      );
  }
}
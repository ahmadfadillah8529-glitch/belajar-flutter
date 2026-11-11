import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ahmad_12rpl1/helpers/size_helper.dart';
import 'package:flutter_ahmad_12rpl1/latihan_form/output_screen.dart';
import 'package:intl/intl.dart';

class FormLatihan extends StatefulWidget {
  const FormLatihan({super.key});

  @override
  State<FormLatihan> createState() => _FormLatihanState();
}

class _FormLatihanState extends State<FormLatihan> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController namaController = TextEditingController();
  TextEditingController telpController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController tglpendaftaranController = TextEditingController();

  String _pilihkelas = "";
  String _eskul = "";

  final Map<String, bool> _eskulPilihan = {
    'Pramuka': false,
    'Futsal': false,
    'Basket': false,
    'Paskibra': false,
    'Voli': false,
  };

  String? _eskulError;

  final List<String> kelas = [
    "XII RPL 1",
    "XII RPL 2",
    "XII RPL 3",
    "XII RPL 4",
    "XII RPL 5",
  ];

  @override
  void initState() {
    super.initState();
    tglpendaftaranController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [const Color.fromARGB(192, 47, 175, 197), const Color.fromARGB(255, 250, 250, 250)],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            )
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Card(
              elevation: 4,
              margin: const EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Formulir Diri",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 18),

                      TextFormField(
                        controller: namaController,
                        decoration: InputDecoration(
                          hintText: "Nama Lengkap",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) return 'Input Nama';
                          return null;
                        },
                      ),

                      const SizedBox(height: 18),

                      TextFormField(
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                          ],
                        controller: telpController,
                        decoration: InputDecoration(
                          hintText: "Nomor Telepon",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) return 'Input Nomor Telepon';
                          return null;
                        },
                      ),

                      const SizedBox(height: 18),

                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: "Email",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) return 'Input Email';
                          return null;
                        },
                      ),

                      const SizedBox(height: 18),

                      //eskul
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Pilih Eskul (Minimal 1, Maksimal 2):',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ..._eskulPilihan.keys.map((String key) {
                        return CheckboxListTile(
                          title: Text(key),
                          value: _eskulPilihan[key],
                          controlAffinity: ListTileControlAffinity.leading,
                          contentPadding: EdgeInsets.zero,
                          onChanged: (bool? value) {
                            setState(() {
                              // Hitung berapa eskul yang sudah dicentang saat ini
                              int selectedCount = _eskulPilihan.values.where((e) => e).length;

                              if (value == true && selectedCount >= 2) {
                                // Jika mencoba memilih lebih dari 2
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Maksimal hanya bisa memilih 2 eskul!'),
                                    duration: Duration(seconds: 1),
                                  ),
                                );
                              } else {
                                _eskulPilihan[key] = value ?? false;
                                _eskulError = null;
                              }
                            });
                          },
                        );
                      }).toList(),

                      if (_eskulError != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(
                            _eskulError!,
                            style: const TextStyle(color: Colors.red, fontSize: 12),
                          ),
                        ),
                      const SizedBox(height: 18),

                       TextFormField(
                        controller: tglpendaftaranController,
                        decoration: const InputDecoration(
                          hintText: "Tanggal Pendaftaran",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Input Tanggal Pendaftaran';
                          }
                          return null;
                        },
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context, 
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2024), 
                            lastDate: DateTime(2100),
                          );
                          if (pickedDate != null) {
                            setState(() {
                              tglpendaftaranController.text = DateFormat(
                                'yyyy-MM-dd',
                              ).format(pickedDate);
                            });
                          }
                        },
                      ),

                      const SizedBox(height: 18),

                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: "Pilih Kelas",
                          border: OutlineInputBorder(),
                        ),
                        items: kelas
                            .map(
                              (item) => DropdownMenuItem(
                                value: item,
                                child: Text(item),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            _pilihkelas = value!;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Pilih Kelas';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 24),

                      SizedBox(
                        width: displayWidth(context) * 0.8,
                        height: displayHeight(context) * 0.075,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 50, 138, 238),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                              side: BorderSide(color: Colors.black),
                            ),
                          ),
                          child: Text(
                            "Submit",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: _submit,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    
    // Validasi checkbox eskul (minimal 1, maksimal 2)
    int selectedEskulCount = _eskulPilihan.values.where((e) => e).length;
    if (selectedEskulCount == 0) {
      setState(() => _eskulError = 'Pilih minimal 1 eskul');
    } else if (selectedEskulCount > 2) {
      setState(() => _eskulError = 'Maksimal hanya boleh memilih 2 eskul');
    } else {
      setState(() => _eskulError = null);
    }

    if (!isValid || selectedEskulCount == 0 || selectedEskulCount > 2) return;

    // Ambil daftar nama eskul yang dipilih ke dalam list / string untuk dikirim
    List<String> eskulTerpilih = _eskulPilihan.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .toList();

    // Navigasi ke halaman output (Pastikan halaman OutputFormScreen Anda sudah disesuaikan untuk menerima data eskul baru ini)
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OutputScreen(
          nama: namaController.text,
          noTelp: telpController.text,
          email: emailController.text,
          kelas: _pilihkelas ?? '',
          eskul: eskulTerpilih.join(', '),
          tglpendaftaran: tglpendaftaranController.text,
        ),
      ),
    );
  }
}


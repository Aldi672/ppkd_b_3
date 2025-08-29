import 'package:flutter/material.dart';
import 'package:ppkd/Utils/database_helper.dart';
import 'package:ppkd/data/data_peserta.dart';

class EditPesertaPage extends StatefulWidget {
  final Peserta peserta;
  const EditPesertaPage({super.key, required this.peserta});

  @override
  State<EditPesertaPage> createState() => _EditPesertaPageState();
}

class _EditPesertaPageState extends State<EditPesertaPage> {
  late TextEditingController namaController;
  late TextEditingController emailController;
  late TextEditingController eventController;
  late TextEditingController kotaController;
  late TextEditingController phoneController;
  late TextEditingController passwordController;
  late TextEditingController confirmController;

  @override
  void initState() {
    super.initState();
    namaController = TextEditingController(text: widget.peserta.nama);
    emailController = TextEditingController(text: widget.peserta.email);

    passwordController = TextEditingController(text: widget.peserta.password);
    confirmController = TextEditingController(text: widget.peserta.confirm);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Peserta')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: namaController,
              decoration: const InputDecoration(labelText: 'Nama'),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: eventController,
              decoration: const InputDecoration(labelText: 'Event'),
            ),
            TextField(
              controller: kotaController,
              decoration: InputDecoration(labelText: 'Kota'),
            ),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(labelText: 'Phone'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            TextField(
              controller: confirmController,
              decoration: InputDecoration(labelText: 'Confirm'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final updatedPeserta = Peserta(
                  id: widget.peserta.id,
                  nama: namaController.text,
                  email: emailController.text,

                  password: passwordController.text,
                  confirm: confirmController.text,
                );
                await DatabaseHelper.updatePeserta(updatedPeserta);
                Navigator.pop(context, true);
              },
              child: const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}

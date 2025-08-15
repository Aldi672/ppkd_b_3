import 'package:flutter/material.dart';
import 'package:ppkd/Tugas7/app_drawer.dart';
import 'package:ppkd/Utils/database_helper.dart';
import 'package:ppkd/Utils/edit_peserta_page.dart';
import 'package:ppkd/data/data_peserta.dart';
import 'package:ppkd/Utils/peserta_list.dart'; // Pastikan sesuai lokasi PesertaListView

class UserWidget extends StatefulWidget {
  static const String routeName = '/user';
  const UserWidget({super.key});

  @override
  State<UserWidget> createState() => _UserWidgetState();
}

class _UserWidgetState extends State<UserWidget> {
  List<Peserta> pesertaList = [];

  @override
  void initState() {
    super.initState();
    _loadPeserta();
  }

  Future<void> _loadPeserta() async {
    final data = await DatabaseHelper.instance.getAllPeserta();
    setState(() {
      pesertaList = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User Page")),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            pesertaList.isEmpty
                ? const Text("Belum ada peserta")
                : SizedBox(
                    height: 350, // agar ListView bisa tampil di dalam Column
                    child: ListView.builder(
                      itemCount: pesertaList.length,
                      itemBuilder: (context, index) {
                        final p = pesertaList[index];
                        return Card(
                          child: ListTile(
                            title: Text(p.nama),
                            subtitle: Text(p.email),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // tombol UPDATE
                                IconButton(
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.blue,
                                  ),
                                  onPressed: () async {
                                    final result = await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            EditPesertaPage(peserta: p),
                                      ),
                                    );

                                    if (result == true) {
                                      _loadPeserta(); // refresh list setelah user menyimpan
                                    }
                                  },
                                ),
                                // tombol DELETE
                                IconButton(
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                  onPressed: () async {
                                    await DatabaseHelper.deletePeserta(p.id!);
                                    _loadPeserta(); // refresh list
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

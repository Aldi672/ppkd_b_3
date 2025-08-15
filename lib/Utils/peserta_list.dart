import 'package:flutter/material.dart';
import 'package:ppkd/data/data_peserta.dart';

class PesertaListView extends StatelessWidget {
  final List<Peserta> pesertaList;

  const PesertaListView({super.key, required this.pesertaList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: pesertaList.length,
        itemBuilder: (context, index) {
          final peserta = pesertaList[index];
          return ListTile(
            title: Text(peserta.nama),
            subtitle: Text(
              "${peserta.email} - ${peserta.event} - ${peserta.kota} - ${peserta.phone} - ${peserta.password} - ${peserta.confirm}",
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ppkd/Tugas14/api/get_user.dart';
import 'package:ppkd/Tugas14/model/user_model.dart';
import 'package:ppkd/Tugas14/view/detail_user.dart';

class Day23GetAPIScreen extends StatefulWidget {
  const Day23GetAPIScreen({super.key});
  static const String routeName = "/get_api_screen";

  @override
  State<Day23GetAPIScreen> createState() => _Day23GetAPIScreenState();
}

class _Day23GetAPIScreenState extends State<Day23GetAPIScreen> {
  @override
  // void initState() {
  //   super.initState();
  //   getUser();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FutureBuilder<List<Result>>(
                  future: getUser(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasData) {
                      final users = snapshot.data as List<Result>;
                      return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: users.length,
                        itemBuilder: (BuildContext context, int index) {
                          final dataUser = users[index];
                          return Container(
                            padding: EdgeInsets.all(10),
                            child: ListTile(
                              leading: Image.network(dataUser.image ?? ""),
                              title: Text(dataUser.title ?? ""),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        DetailUser(result: dataUser),
                                  ),
                                );
                              },
                              // ignore: unnecessary_string_interpolations
                            ),
                          );
                        },
                      );
                    } else {
                      return Text("Gagal Memuat data");
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

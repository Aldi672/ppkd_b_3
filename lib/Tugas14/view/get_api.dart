// ignore_for_file: unused_field

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
  final GlobalKey<RefreshIndicatorState> _refreshKey =
      GlobalKey<RefreshIndicatorState>();

  // ignore: prefer_final_fields
  List<Result> _filteredBooks = [];
  List<Result> _allBooks = [];
  String _selectedFilter = 'title';
  final TextEditingController _searchController = TextEditingController();
  @override
  void initState() {
    super.initState();

    _loadUsers();
  }

  Future<void> _loadUsers() async {
    final users = await getUser();
    setState(() {
      _allBooks = users;
      _filteredBooks = users;
    });
  }

  void _filterBooks(String query) {
    final filtered = _allBooks.where((users) {
      final titleLower = users.title?.toLowerCase() ?? '';
      final originalTitleLower = users.originalTitle?.toLowerCase() ?? '';
      final searchLower = query.toLowerCase();

      if (_selectedFilter == 'title') {
        return titleLower.contains(searchLower);
      } else if (_selectedFilter == 'original_title') {
        return originalTitleLower.contains(searchLower);
      }
      return false;
    }).toList();

    setState(() {
      _filteredBooks = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: RefreshIndicator(
          key: _refreshKey,
          onRefresh: _loadUsers,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search by $_selectedFilter....",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onChanged: (value) {
                      _filterBooks(value);
                    },
                  ),
                ),

                FutureBuilder<List<Result>>(
                  future: getUser(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasData) {
                      return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: _filteredBooks.length,
                        itemBuilder: (BuildContext context, int index) {
                          final dataUser = _filteredBooks[index];
                          return Container(
                            padding: EdgeInsets.all(10),

                            child: Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
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
                            ),

                            // child:  ListTile(
                            //   leading: Image.network(dataUser.image ?? ""),
                            //   title: Text(dataUser.title ?? ""),
                            //   onTap: () {
                            //     Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //         builder: (context) =>
                            //             DetailUser(result: dataUser),
                            //       ),
                            //     );
                            //   },
                            //   // ignore: unnecessary_string_interpolations
                            // ),
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

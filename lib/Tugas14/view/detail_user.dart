import 'package:flutter/material.dart';
import 'package:ppkd/Tugas14/model/user_model.dart';

class DetailUser extends StatelessWidget {
  final Result result;
  const DetailUser({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(result.title ?? "Detail User")),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.topRight,
            colors: [
              Color.fromARGB(255, 14, 12, 12),
              Color.fromARGB(255, 19, 17, 18),
              Color.fromARGB(255, 5, 5, 5),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 500,
                  padding: EdgeInsets.only(left: 30, right: 30, bottom: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(result.image ?? "", fit: BoxFit.cover),
                  ),
                ),
                SizedBox(height: 20),

                Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    children: [
                      Text(
                        "${result.title ?? 'N/A'}",
                        style: TextStyle(
                          fontFamily: 'Latin',
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: Colors.white70,
                        ),
                      ),
                      Spacer(),
                      CircleAvatar(
                        child: Icon(Icons.home_filled, color: Colors.red),
                      ),
                      SizedBox(width: 15),
                      CircleAvatar(
                        child: Icon(
                          Icons.volunteer_activism,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsets.only(left: 20, right: 10),
                  child: Text(
                    "May 25,${result.releaseDate ?? 'N/A'}",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Latin',
                      fontWeight: FontWeight.w200,
                      color: Colors.white70,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 20),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "original_title: ${result.originalTitle ?? 'N/A'}",
                        style: TextStyle(fontSize: 16, color: Colors.white70),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "original_title_romanised: ${result.originalTitleRomanised?.toString() ?? 'N/A'}",
                        style: TextStyle(fontSize: 16, color: Colors.white70),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "description: ${result.description ?? 'N/A'}",
                        style: TextStyle(fontSize: 16, color: Colors.white70),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "movieBanner: ${result.movieBanner ?? 'N/A'}",
                        style: TextStyle(fontSize: 16, color: Colors.white70),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "director: ${result.director ?? 'N/A'}",
                        style: TextStyle(fontSize: 16, color: Colors.white70),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "producer: ${result.producer ?? 'N/A'}",
                        style: TextStyle(fontSize: 16, color: Colors.white70),
                      ),
                      SizedBox(height: 10),

                      SizedBox(height: 10),
                      Text(
                        "runningTime: ${result.runningTime ?? 'N/A'}",
                        style: TextStyle(fontSize: 16, color: Colors.white70),
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

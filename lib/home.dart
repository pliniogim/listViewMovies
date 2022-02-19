import "package:flutter/material.dart";

class MovieListView extends StatelessWidget {
  MovieListView({Key? key}) : super(key: key);

  final List movies = [
    "Avatar",
    "2001",
    "The Great Gatsby",
    "Citizen Kane",
    "Star Wars"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movies"),
        backgroundColor: Colors.blueGrey.shade800,
      ),
      backgroundColor: Colors.blueGrey.shade200,
      body: ListView.builder(
          itemCount: movies.length,
          itemBuilder: (BuildContext, int index) {
            return Card(
              elevation: 4.5,
              color: Colors.white,
              child: ListTile(
                leading: CircleAvatar(
                  child: Container(
                    decoration: BoxDecoration(
                      //color: Colors.blue,
                      borderRadius: BorderRadius.circular(13.9),
                    ),
                    child: Text("P"),
                  ),
                ),
                trailing: Text("..."),
                title: Text(movies[index]),
                subtitle: Text("sub"),
                onTap: () => debugPrint("Movie Name: ${movies.elementAt(index)}"),
              ),
            );
          }),
    );
  }
}

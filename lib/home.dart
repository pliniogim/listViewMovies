import "package:flutter/material.dart";
import "package:movies/model/movie.dart";
import 'ui/move_ui/movie.ui.dart';

class MovieListView extends StatelessWidget {
  MovieListView({Key? key}) : super(key: key);

  final List<Movie> movieList = Movie.getMovies();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movies"),
        backgroundColor: Colors.blueGrey.shade800,
      ),
      backgroundColor: Colors.blueGrey.shade900,
      body: ListView.builder(
          itemCount: movieList.length,
          itemBuilder: (context, int index) {
            return Stack(children: <Widget>[
              movieCard(movieList[index], context),
              Positioned(
                  top: 30,
                  left: 10,
                  child: movieImage(movieList[index].images[0])),
            ]);
          }),
    );
  }

  Widget movieCard(Movie movie, BuildContext context) {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.only(left: 60.0),
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: 160.0,
        child: Card(
            color: Colors.blueGrey.shade600,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 54.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(movie.title,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0,
                                color: Colors.white,
                              )),
                        ),
                      ],
                    ),
                    Row(children: [
                      Text("Rating: ${movie.imdbRating}/10",
                          style: mainTextStyle())
                    ]),
                    Row(children: [
                      Text("Released: ${movie.released}",
                          style: mainTextStyle()),
                    ]),
                    Row(children: [
                      Text(movie.runtime, style: mainTextStyle())
                    ]),
                    Row(children: [Text(movie.rated, style: mainTextStyle())]),
                  ],
                ),
              ),
            )),
      ),
      onTap: () =>
      {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    MovieListDetails(
                      movieName: movie.title,
                      movie: movie,
                    )))
      },
    );
  }

  TextStyle mainTextStyle() {
    return const TextStyle(fontSize: 15.0, color: Colors.grey);
  }

  Widget movieImage(String imageUrl) {
    return InkWell(
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: NetworkImage(imageUrl), fit: BoxFit.cover)),
        ));
  }
}

import 'package:dumyapp1/model/movies_model/movies_model.dart';
import 'package:dumyapp1/provider/movie_provider.dart';
import 'package:dumyapp1/utill/utill_values.dart';
import 'package:dumyapp1/view/CustomWidgets/custom_widgets.dart';
import 'package:dumyapp1/view/MovieList/movies_details_webview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MoviesPage2 extends StatelessWidget {
  const MoviesPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Appointments List"),
      body: Center(
        child:
            Consumer<MovieProvider>(builder: (context, movieProvider, child) {
          if (movieProvider.movies.isEmpty) {
            return const Center(
              child: Text(
                'No appointments found',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
            );
          } else if (movieProvider.movies.isNotEmpty) {
            return ListView.builder(
              itemCount: movieProvider.movies.length,
              itemBuilder: (context, index) {
                final MoviesModel movie = movieProvider.movies[index];
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListTile(
                    leading: Container(
                      margin: const EdgeInsets.only(top: 20, right: 20),
                      width: 45,
                      height: 50,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: appBarColor),
                      child: Center(
                        child: Text(
                          movie.id.toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    title: Padding(
                      padding: const EdgeInsets.only(top: 28),
                      child: Text(movie.movieName!),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(bottom: 20, top: 10),
                      child: Text('Rating : ${movie.rating} ⭐'),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) =>
                              MoviesDetailsWebview(url: movie.imdbUrl)));
                    },
                  ),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }),
      ),
    );
  }
}

import 'package:dumyapp1/model/movies_model/movies_model.dart';
import 'package:dumyapp1/provider/movie_provider.dart';
import 'package:dumyapp1/view/CustomWidgets/custom_widgets.dart';
import 'package:dumyapp1/view/Home/movies_details_webview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Movies List"),
      body: Center(
        child:
            Consumer<MovieProvider>(builder: (context, movieProvider, child) {
          if (movieProvider.movies.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: movieProvider.movies.length,
            itemBuilder: (context, index) {
              final MoviesModel movie = movieProvider.movies[index];
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.white,
                margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                elevation: 5,
                child: ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.only(top: 17, left: 6),
                    child: Text(movie.id.toString()),
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
        }),
      ),
    );
  }
}

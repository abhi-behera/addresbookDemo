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
              return ListTile(
                leading: Text(movie.id.toString()),
                title: Text(movie.movieName!),
                subtitle: Text('${movie.rating}'),
                onTap: () {
                  // print(movie.imdbUrl);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) =>
                          MoviesDetailsWebview(url: movie.imdbUrl)));
                },
              );
            },
          );
        }),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:state_provider/providers/movie_providers.dart';
import 'package:provider/provider.dart';
import 'package:state_provider/screens/fav_moives.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var movies = context.watch<MovieProvider>().movies;
    var myList = context.watch<MovieProvider>().myList;
    //here, the variables will save the data

    return Scaffold(
      appBar: AppBar(
        title: 'Provider'.text.make(),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(children: [
          ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                  backgroundColor: Colors.red[600]),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => MyListScreen()));
              },
              icon: Icon(Icons.favorite),
              label: 'Go to fav list (${myList.length})'.text.size(20).make()),
          Expanded(
              child: ListView.builder(
            itemCount: movies.length,
            itemBuilder: (_, index) {
              final currentMovie = movies[index];
              return Card(
                key: ValueKey(currentMovie.title),
                color: Colors.blue,
                elevation: 0,
                child: ListTile(
                  title: currentMovie.title.text.white.make(),
                  subtitle: Text(
                    currentMovie.duration ?? 'No Information',
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.favorite,
                      color: myList.contains(currentMovie)
                          ? Colors.red
                          : Colors.white,
                    ),
                    onPressed: () {
                      if (!myList.contains(currentMovie)) {
                        context.read<MovieProvider>().addToList(currentMovie);
                      } else {
                        context
                            .read<MovieProvider>()
                            .removeFromList(currentMovie);
                      }
                    },
                  ),
                ),
              );
            },
          ))
        ]),
      ),
    );
  }
}

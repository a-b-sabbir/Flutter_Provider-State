import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:state_provider/providers/movie_providers.dart';
import 'package:velocity_x/velocity_x.dart';

class MyListScreen extends StatefulWidget {
  const MyListScreen({super.key});

  @override
  State<MyListScreen> createState() => _MyListScreenState();
}

class _MyListScreenState extends State<MyListScreen> {
  @override
  Widget build(BuildContext context) {
    final _myList = context.watch<MovieProvider>().myList;

    return Scaffold(
      appBar: AppBar(title: "Fav Movies (${_myList.length})".text.make()),
      body: ListView.builder(
        itemCount: _myList.length,
        itemBuilder: (_, index) {
          final currentMovie = _myList[index];
          return Card(
            key: ValueKey(currentMovie.title),
            elevation: 0,
            child: ListTile(
              title: Text(currentMovie.title),
              subtitle: Text(currentMovie.duration ?? ''),
              trailing: TextButton(
                onPressed: () {
                  context.read<MovieProvider>().removeFromList(currentMovie);
                },
                child: 'Remove'.text.color(Colors.red).make(),
              ),
            ),
          );
        },
      ),
    );
  }
}

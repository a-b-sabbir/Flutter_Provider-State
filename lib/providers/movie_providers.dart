import 'dart:math';

import 'package:flutter/material.dart';
import 'package:state_provider/movie_model/movie_model.dart';

final List<Movie> initialData = List.generate(
    30,
    (index) => Movie(
        title: 'Movie $index', duration: "${Random().nextInt(100) + 60}"));
//Movie type object is created here and saved the object to 'initialData'

//here, the state will be maintained by ChangeNotifier package
class MovieProvider with ChangeNotifier {
  final List<Movie> _movie = initialData;
  List<Movie> get movies => _movie;

  final List<Movie> _myList = [];
  List<Movie> get myList => _myList;

  void addToList(Movie movie) {
    _myList.add(movie);
    notifyListeners();
  }

  void removeFromList(Movie movie) {
    _myList.remove(movie);
    notifyListeners();
  }
}

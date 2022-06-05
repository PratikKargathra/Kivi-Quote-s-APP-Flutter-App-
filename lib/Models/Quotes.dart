import 'package:flutter/material.dart';
class HomeDesignBlocks{
  String title;
  List quoteCategoryList;
  bool isGrid;
  VoidCallback? viewMore;

  HomeDesignBlocks({
    required this.title,
    required this.quoteCategoryList,
    this.isGrid = true,
    this.viewMore,
  });
}

class Quote{
  int? id;
  String quote;
  bool markedAsRead;
  bool favorite;
  String author;
  String backgroundImage;

  Quote({
    this.id,
    required this.quote,
    required this.markedAsRead,
    required this.favorite,
    required this.author,
    required this.backgroundImage
  });

  factory Quote.fromJson(Map<String, dynamic> data){
    return Quote(
      quote: data['content'],
      markedAsRead: false,
      favorite: false,
      author: data['author'],
      backgroundImage: "",
    );
  }

  factory Quote.fromMap(Map<String, dynamic> data){
    return Quote(
        id: data['id'],
        quote: data['quote'],
        markedAsRead: bool.fromEnvironment(data['marked_as_read']),
        favorite: bool.fromEnvironment(data['favorite']),
        author: data['author'],
        backgroundImage: data['background_image'],
    );
  }
}


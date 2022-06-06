import 'package:kiviquotes/sources.dart';
import 'package:flutter/material.dart';

List<String> images = <String>[
  "https://cdn-0.therandomvibez.com/wp-content/uploads/2020/12/Inspirational-Quotes-About-Trying-New-Things.jpg",
  "https://i.pinimg.com/originals/91/b4/8a/91b48af3dc2d7b7b57837d047de217cb.jpg",
  "https://i.pinimg.com/736x/14/f2/13/14f213a50b5a309df034a6004451e1f5.jpg",
  "https://img.ifunny.co/images/13f2b8b8b49144deba4689c8888de2a17fee426a7fd98652e5b4167215ba3e11_1.jpg",
  "https://quotefancy.com/media/wallpaper/3840x2160/3994299-Jacob-Grimm-Quote-How-often-when-we-are-comfortable-we-begin-to.jpg",
  "https://msw.usc.edu/wp-content/uploads/sites/9/2014/02/quote-31.png?w=400",
  "https://quotefancy.com/media/wallpaper/1600x900/7066027-Danna-Faulds-Quote-Trust-the-energy-that-Courses-through-you-Trust.jpg",
  "https://blog.cwf-fcf.org/wp-content/uploads/2017/03/Lao-Tzu-1100x619.jpg",
];

List<String> mostPopular = <String>[
  "Motivational",
  "Albert Einstein",
  "Swami vivekananda",
  "Love",
];

List<String> quotesByAuthor = <String>[
  "Motivational",
  "Albert Einstein",
  "Swami vivekananda",
  "Mark Twain",
];

List<String> featured = <String>[
  "Success",
  "Life",
  "Motivational",
  "Sed",
];

List<String> quotesByCategory = <String>[
  "Albert Einstein",
  "Success",
  "Swami vivekananda",
  "Life",
  "Mark Twain",
  "Motivational",
  "Sed",
  "Love",
];

List<HomeDesignBlocks> homePageLists = <HomeDesignBlocks>[
  HomeDesignBlocks(title: "Most Popular", quoteCategoryList: mostPopular),
  HomeDesignBlocks(title: "Quote's By Author", quoteCategoryList: quotesByAuthor),
  HomeDesignBlocks(title: "Quote's By Category", quoteCategoryList: quotesByCategory,isGrid: false),
  HomeDesignBlocks(title: "Featured", quoteCategoryList: featured),
];

List<String> editorImageList = <String>[
  "https://images.pexels.com/photos/235985/pexels-photo-235985.jpeg?cs=srgb&dl=pexels-pixabay-235985.jpg&fm=jpg",
  "https://www.teahub.io/photos/full/157-1571853_blue-gradient-quote-backgrounds-wallpaper-quotes-basic-blue.jpg",
  "https://images.unsplash.com/photo-1536195892759-c8a3c8e1945e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8YWVzdGhldGljJTIwcXVvdGVzfGVufDB8fDB8fA%3D%3D&w=1000&q=80",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTTGP8TlVheUsxr09OmoH5tNI6566TvBJ-7HrVe5lbvfHgi3TENgZ-_Kjh0GqkE8LGp_w0&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDP0gZzOlJF9XWcvq4IFli1hJUzDMrM2Sok3-U6e9z6EmL2FVvFNbY0Dl01zzCt0B414M&usqp=CAU",
  "https://images.unsplash.com/photo-1497704628914-8772bb97f450?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MnwxMDcxMTcwfHxlbnwwfHx8fA%3D%3D&w=1000&q=80",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSkQ-sqg6ylM5KIf8PbJmo_qyrM9ygv_9QK720NP6BbbSRtJ7JQiocLc4PheKcj_oU_0EQ&usqp=CAU",
];

List<Color> colors = <Color>[
  Colors.white,
  Colors.black,
  Colors.yellowAccent,
  Colors.amber,
  Colors.orange,
  Colors.deepOrange,
  Colors.red,
  Colors.pink,
  Colors.green,
  Colors.blueGrey,
  Colors.indigo,
  Colors.purple,
  Colors.blue,
  Colors.cyan,
  Colors.teal,
  Colors.black45,
];
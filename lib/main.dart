import 'dart:ui';

import 'package:flutter/material.dart';

void main()
{
    runApp(const MyApp());
}

class MyApp extends StatelessWidget
{
    const MyApp({super.key});

    // This widget is the root of your application.
    @override
    Widget build(BuildContext context)
    {
        return MaterialApp(home: Material(type: MaterialType.transparency, child: Scaffold(
                    body: PageView.builder(
                        // Set to Axis.horizontal if you prefer side-to-side
                        scrollDirection: Axis.vertical,
                        itemCount: 5,
                        itemBuilder: (context, index)
                        {
                          return SlamBookLayout(data: mySlamBook[index]) ; // This returns one full-screen card per page
                        },
                    ),
                )));
    }
}

class SlamBookData
{
    final String nickName;
    final String name;
    final String birthday;
    final String age;
    final String favoriteMovie;
    final String favoriteFood;
    final String favoriteColor;
    final String imagePath;
    final String zodiacSign;
    final String favoriteSong;
    final String favoriteHobby;

    SlamBookData({
        required this.nickName,
        required this.name,
        required this.birthday,
        required this.age,
        required this.zodiacSign,
        required this.favoriteMovie,
        required this.favoriteFood,
        required this.favoriteColor,
        required this.imagePath,
        required this.favoriteSong,
        required this.favoriteHobby

    });
}

final List<SlamBookData> mySlamBook = [
  SlamBookData(nickName: "Drei", name: "John Andrei Dimasaka", birthday: "04-21-2003", age: "22", zodiacSign: 'assets/taurus.png', favoriteMovie: 'assets/goodfellas.jpg', favoriteFood: "Sisig", favoriteColor: "Blue", imagePath: 'assets/andrei.jpeg', favoriteSong: "Eleven Weeks", favoriteHobby: 'Gaming'),
  SlamBookData(nickName: "Elong", name: 'Angelo Delos Santos Iyo', birthday: "10-13-2002", age: '23', zodiacSign: 'assets/libra.jpeg', favoriteMovie: 'assets/greenmile.jpg', favoriteFood: "Ginisang Munggo", favoriteColor: "Black", imagePath: 'assets/elong.jpg', favoriteSong: "Wings", favoriteHobby: "Gaming"),
  SlamBookData(nickName: "Ron", name: "Ron Sherwin Bugarin", birthday: "09-06-2004", age: "21", zodiacSign: 'assets/virgo.jpeg', favoriteMovie: 'assets/evangelion.jpg', favoriteFood: '24 Chicken', favoriteColor: "Black", imagePath: 'assets/ronbaliw.jpeg', favoriteSong: 'Why am I still in LA', favoriteHobby: "Gaming"),
  SlamBookData(nickName: "Lek", name: "Leonardo Jualo", birthday: "05-05-2003", age: "22", zodiacSign: 'assets/taurus.png', favoriteMovie: 'assets/onepiece.jpeg', favoriteFood: "Kaldereta", favoriteColor: "Green", imagePath: 'assets/jualo.jpeg', favoriteSong: "Afterthoughts", favoriteHobby: "Gaming"),
  SlamBookData(nickName: "Marky", name: "Mark Joseph D. Amarille", birthday: "12-24-2004", age: "21", zodiacSign: 'assets/capricorn.jpeg', favoriteMovie: 'assets/onepiece.jpeg', favoriteFood: "Fried Chicken", favoriteColor: "Blue", imagePath: 'assets/mark.jpeg', favoriteSong: "Drag me down", favoriteHobby: "Reading")
];

class SlamBookLayout extends StatelessWidget
{
  final SlamBookData data;
    const SlamBookLayout({
        super.key,
        required this.data
    });

    @override
    Widget build(BuildContext context)
    {
        return Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.white,
            child: Padding(padding: EdgeInsets.all(20),
                child: Stack(
                    children: [
                        Column(
                            spacing: 20,
                            children: [
                                Column(
                                    children: [
                                        Align(
                                            alignment: Alignment.topCenter,
                                            child: Text('ALL ABOUT',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: 'Monserrat',
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                    letterSpacing: 2.0
                                                )),
                                        ),
                                        Align(
                                            child: Text('ME',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: 'WinkyMilky',
                                                    fontSize: 75,
                                                    fontWeight: FontWeight.bold,
                                                    letterSpacing: 3.0,
                                                )),
                                        )
                                    ]
                                ),
                                Row(
                                    spacing: 20,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                        Column(
                                            mainAxisSize: MainAxisSize.max,
                                            spacing: 10,
                                            children: [
                                                NameTagWidget(text: data.nickName),
                                                NameTagWidget(text: data.birthday),
                                                NameTagWidget(text: data.age)

                                            ]
                                        ),
                                        Column(
                                            spacing: 10,
                                            children: [
                                                Container(
                                                    alignment: Alignment.center,
                                                    width: 170,
                                                    decoration: BoxDecoration(
                                                        color: Color(0xfdf8f0ed),
                                                        border: Border.all(color: Colors.black),
                                                        borderRadius: BorderRadius.circular(10)
                                                    ),
                                                    child: Text('Favorite Movie',
                                                        style: TextStyle(
                                                            fontSize: 24,
                                                            fontFamily: 'WinkyMilky',

                                                        ),),
                                                ),
                                                SizedBox(
                                                    height: 170,
                                                    width: 170,
                                                    child: PictureWidget(path: data.favoriteMovie,)
                                                )
                                            ]
                                        )
                                    ]
                                ),
                                Row(
                                    spacing: 10,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                        BoxWidget(title: 'Zodiac Sign', path: data.zodiacSign, color: Color(0xfffeefc8),),
                                        BoxWidget(path: data.imagePath, title: data.name, color: Color(0xff96f2d7),)
                                    ],
                                ),
                                Row(
                                    spacing: 10,
                                    children: [
                                        Container(
                                            width: 190,
                                            padding: const EdgeInsets.all(5.0),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(10),
                                                color: Color(0xfdffd8a8),
                                                border: Border.all(color: Colors.black)
                                            ),
                                            child:
                                            Column(
                                                children: [
                                                    Text(
                                                        "FAVORITE FOOD",
                                                        style: TextStyle(
                                                            letterSpacing: 1.8,
                                                            fontSize: 16,
                                                            fontFamily: "WinkyMilky"
                                                        ),
                                                    ),
                                                    Text(
                                                        data.favoriteFood,
                                                        style: TextStyle(
                                                            letterSpacing: 1.8,
                                                            fontSize: 16,
                                                            fontFamily: "WinkyMilky"
                                                        ),
                                                    )
                                                ],
                                            )
                                        ),
                                        Container(
                                            width: 190,
                                            padding: const EdgeInsets.all(5.0),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(10),
                                                color: Color(0xfda5d8ff),
                                                border: Border.all(color: Colors.black)
                                            ),
                                            child: Column(
                                                children: [
                                                    Text(
                                                        "FAVORITE COLOR",
                                                        style: TextStyle(
                                                            letterSpacing: 1.8,
                                                            fontSize: 16,
                                                            fontFamily: "WinkyMilky"
                                                        ),
                                                    ),
                                                    Text(
                                                        data.favoriteColor,
                                                        style: TextStyle(
                                                            letterSpacing: 1.8,
                                                            fontSize: 16,
                                                            fontFamily: "WinkyMilky"
                                                        ),
                                                    )
                                                ],
                                            )
                                        )
                                    ],
                                ),
                                Row(
                                    spacing: 10,
                                    children: [
                                        Container(
                                            height: 60,
                                            width: 190,
                                            padding: const EdgeInsets.all(5.0),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(10),
                                                color: Color(0xfdd0bfff),
                                                border: Border.all(color: Colors.black)
                                            ),
                                            child:
                                            Column(
                                                children: [
                                                    Text(
                                                        "FAVORITE SONG",
                                                        style: TextStyle(
                                                            letterSpacing: 1.8,
                                                            fontSize: 16,
                                                            fontFamily: "WinkyMilky"
                                                        ),
                                                    ),
                                                    Text(
                                                        data.favoriteSong,
                                                        style: TextStyle(
                                                            letterSpacing: 1.8,
                                                            fontSize: 16,
                                                            fontFamily: "WinkyMilky"
                                                        ),
                                                    )
                                                ],
                                            )
                                        ),
                                        Container(
                                            width: 190,
                                            padding: const EdgeInsets.all(5.0),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(10),
                                                color: Color(0xfdffe0dd),
                                                border: Border.all(color: Colors.black)
                                            ),
                                            child:
                                            Column(
                                                children: [
                                                    Text(
                                                        "FAVORITE HOBBY",
                                                        style: TextStyle(
                                                            letterSpacing: 1.8,
                                                            fontSize: 16,
                                                            fontFamily: "WinkyMilky"
                                                        ),
                                                    ),
                                                    Text(
                                                        data.favoriteHobby,
                                                        style: TextStyle(
                                                            letterSpacing: 1.8,
                                                            fontSize: 16,
                                                            fontFamily: "WinkyMilky"
                                                        ),
                                                    )
                                                ],
                                            )
                                        )
                                    ],
                                )
                            ]
                        )
                    ],
                )
            )
        );
    }
}

class FavoriteWidget extends StatelessWidget
{
    const FavoriteWidget({super.key});

    @override
    Widget build(BuildContext context)
    {
        throw SizedBox(
            width: 190,
            height: 170,
            child: Stack(
                children: [
                    Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            color: const Color(0xFFfeefc8),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.5),
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                    offset: const Offset(4, 4),
                                ),
                            ],
                        ),
                    ),
                    Align(
                        alignment: Alignment.center,
                        child:
                        CircleAvatar(
                            radius: 60,
                            foregroundImage: AssetImage('assets/taurus.png'),
                        )
                    )
                ],
            )
        );
    }
}

class BoxWidget extends StatelessWidget
{
    final String path;
    final String title;
    final Color color;
    const BoxWidget({super.key, required this.path, required this.title, required this.color});

    @override
    Widget build(BuildContext context)
    {
        return SizedBox(
            width: 190,
            height: 170,
            child: Stack(
                children: [
                    Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            color: color,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.5),
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                    offset: const Offset(4, 4),
                                ),
                            ],
                        ),
                    ),
                    Align(
                        alignment: Alignment.topCenter,
                        child: Text(title, style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'WinkyMilky',
                            ),),
                    ),
                    Align(
                        alignment: Alignment.center,
                        child:
                        CircleAvatar(
                            radius: 60,
                            foregroundImage: AssetImage(path),
                        )
                    )
                ],
            )
        );
    }
}

class PictureWidget extends StatelessWidget
{
    final String path;
    const PictureWidget({super.key, required this.path});

    @override
    Widget build(BuildContext context)
    {
        return Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Color(0xffffe0dd),
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(15), 
                boxShadow: [
                    BoxShadow(
                        color: Colors.black.withValues(alpha: 0.5),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: const Offset(4, 4),
                    ),],
                image: DecorationImage(
                    image: AssetImage(path),
                    fit: BoxFit.fill,
                )
            )
        );
    }
}

class NameTagWidget extends StatelessWidget
{
    final String text;

    const NameTagWidget({super.key, required this.text});

    @override
    Widget build(BuildContext context)
    {
        return ClipPath(
            clipper: ArrowClipper(),
            child: Container(
                width: 200,
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                    color: Color(0xffd3eaf0), // The light background
                    border: Border.all(color: Colors.black54),
                ),
                child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                        Text(
                            text,
                            style: TextStyle(
                                letterSpacing: 1.1,
                                fontSize: 16,
                                color: Colors.black,
                                fontFamily: 'Times New Roman'

                            )
                            ,
                        ),
                        const SizedBox(width: 30), // Space for the arrow point
                    ],
                ),
            ),
        );
    }
}

// Custom Clipper to create the arrow point on the right
class ArrowClipper extends CustomClipper<Path>
{
    @override
    Path getClip(Size size)
    {
        Path path = Path();
        path.lineTo(size.width - 20, 0);
        path.lineTo(size.width, size.height / 2); // The tip of the arrow
        path.lineTo(size.width - 20, size.height);
        path.lineTo(0, size.height);
        path.close();
        return path;
    }

    @override
    bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

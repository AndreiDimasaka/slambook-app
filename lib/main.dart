import 'package:flutter/material.dart';

void main()
{
    runApp(const MyApp());
}

class MyApp extends StatelessWidget
{
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) 
    {
        return MaterialApp(
            home: Material(
                type: MaterialType.transparency,
                child: Scaffold(
                    body: PageView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: mySlamBook.length,
                        itemBuilder: (context, index)
                        {
                            return SlamBookLayout(data: mySlamBook[index]);
                        },
                    ),
                ),
            ),
        );
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
    final String? favoritePic;
    final String? outsidePic;

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
        required this.favoriteHobby,
        this.favoritePic,
        this.outsidePic,
    });
}

final List<SlamBookData> mySlamBook = [
    SlamBookData(nickName: "Drei", name: "John Andrei Dimasaka", birthday: "04-21-2003", age: "22", zodiacSign: 'assets/taurus.png', favoriteMovie: 'assets/goodfellas.jpg', favoriteFood: "Sisig", favoriteColor: "Blue", imagePath: 'assets/andrei.jpeg', favoriteSong: "Eleven Weeks", favoriteHobby: 'Gaming'),
    SlamBookData(nickName: "Elong", name: 'Angelo Delos Santos Iyo', birthday: "10-13-2002", age: '23', zodiacSign: 'assets/libra.jpeg', favoriteMovie: 'assets/greenmile.jpg', favoriteFood: "Ginisang Munggo", favoriteColor: "Black", imagePath: 'assets/elong.jpg', favoriteSong: "Wings", favoriteHobby: "Gaming", favoritePic: 'assets/iyodrei.jpeg', outsidePic: 'assets/4pic.jpeg'),
    SlamBookData(nickName: "Ron", name: "Ron Sherwin Bugarin", birthday: "09-06-2004", age: "21", zodiacSign: 'assets/virgo.jpeg', favoriteMovie: 'assets/evangelion.jpg', favoriteFood: '24 Chicken', favoriteColor: "Black", imagePath: 'assets/ronbaliw.jpeg', favoriteSong: 'Why am I still in LA', favoriteHobby: "Gaming", favoritePic: 'assets/rondrei.jpg', outsidePic: 'assets/lunita.jpg'),
    SlamBookData(nickName: "Lek", name: "Leonardo Jualo", birthday: "05-05-2003", age: "22", zodiacSign: 'assets/taurus.png', favoriteMovie: 'assets/onepiece.jpeg', favoriteFood: "Kaldereta", favoriteColor: "Green", imagePath: 'assets/jualo.jpeg', favoriteSong: "Afterthoughts", favoriteHobby: "Gaming", favoritePic: 'assets/jumpscare.jpeg', outsidePic: 'assets/nightmares.jpeg'),
    SlamBookData(nickName: "Matt", name: "Jeff Matthew Molina", birthday: "09-02-2004", age: "21", zodiacSign: 'assets/virgo.jpeg', favoriteMovie: 'assets/everything.jpg', favoriteFood: "Ensaymada", favoriteColor: "Black", imagePath: 'assets/matthew.jpg', favoriteSong: "Hold On Til May", favoriteHobby: "Using Instruments", favoritePic: 'assets/mattdrei.jpeg', outsidePic: 'assets/bilyars.jpeg'),
];

class _Dims
{
    final double avatarRadius;
    final double movieBoxSize;
    final double photoBoxSize;
    final double titleFontSize;
    final double labelFontSize;
    final double nameFontSize;
    final double mainFontSize;
    final double cardWidth;
    final double padding;
    final double spacing;

    const _Dims({
        required this.avatarRadius,
        required this.movieBoxSize,
        required this.photoBoxSize,
        required this.titleFontSize,
        required this.labelFontSize,
        required this.nameFontSize,
        required this.mainFontSize,
        required this.cardWidth,
        required this.padding,
        required this.spacing,
    });

    factory _Dims.of(BuildContext context)
    {
        final width = MediaQuery.sizeOf(context).width;
        if (width < 400) 
        {
            return const _Dims(
                avatarRadius: 40,
                movieBoxSize: 110,
                photoBoxSize: 110,
                titleFontSize: 50,
                labelFontSize: 11,
                nameFontSize: 11,
                mainFontSize: 10,
                cardWidth: 130,
                padding: 10,
                spacing: 6,
            );
        }
        else if (width < 600) 
        {
            return const _Dims(
                avatarRadius: 50,
                movieBoxSize: 140,
                photoBoxSize: 130,
                titleFontSize: 65,
                labelFontSize: 13,
                nameFontSize: 13,
                mainFontSize: 12,
                cardWidth: 155,
                padding: 14,
                spacing: 8,
            );
        }
        else if (width < 900) 
        {
            return const _Dims(
                avatarRadius: 60,
                movieBoxSize: 170,
                photoBoxSize: 160,
                titleFontSize: 75,
                labelFontSize: 16,
                nameFontSize: 16,
                mainFontSize: 14,
                cardWidth: 190,
                padding: 20,
                spacing: 10,
            );
        }
        else 
        {
            return const _Dims(
                avatarRadius: 75,
                movieBoxSize: 210,
                photoBoxSize: 200,
                titleFontSize: 90,
                labelFontSize: 20,
                nameFontSize: 18,
                mainFontSize: 16,
                cardWidth: 240,
                padding: 28,
                spacing: 14,
            );
        }
    }
}

class SlamBookLayout extends StatelessWidget
{
    final SlamBookData data;
    const SlamBookLayout({super.key, required this.data});

    @override
    Widget build(BuildContext context) 
    {
        final dimensions = _Dims.of(context);
        return Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white,
            child: SingleChildScrollView(
                padding: EdgeInsets.all(dimensions.padding),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        _Header(d: dimensions),
                        SizedBox(height: dimensions.spacing),

                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                        NameTagWidget(text: data.nickName, dimensions: dimensions),
                                        SizedBox(height: dimensions.spacing),
                                        NameTagWidget(text: data.birthday, dimensions: dimensions),
                                        SizedBox(height: dimensions.spacing),
                                        NameTagWidget(text: data.age, dimensions: dimensions),
                                    ],
                                ),
                                SizedBox(width: dimensions.spacing * 2),
                                Column(
                                    children: [
                                        Container(
                                            alignment: Alignment.center,
                                            width: dimensions.movieBoxSize,
                                            decoration: BoxDecoration(
                                                color: const Color(0xFFF8F0ED),
                                                border: Border.all(color: Colors.black),
                                                borderRadius: BorderRadius.circular(10),
                                            ),
                                            child: Text(
                                                'Favorite Movie',
                                                style: TextStyle(fontSize: dimensions.labelFontSize, fontFamily: 'WinkyMilky'),
                                            ),
                                        ),
                                        SizedBox(height: dimensions.spacing / 2),
                                        SizedBox(
                                            height: dimensions.movieBoxSize,
                                            width: dimensions.movieBoxSize,
                                            child: PictureWidget(path: data.favoriteMovie),
                                        ),
                                    ],
                                ),
                            ],
                        ),
                        SizedBox(height: dimensions.spacing),

                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                                BoxWidget(title: 'Zodiac Sign', path: data.zodiacSign, color: const Color(0xFFFEEFC8), d: dimensions),
                                SizedBox(width: dimensions.spacing),
                                BoxWidget(path: data.imagePath, title: data.name, color: const Color(0xFF96F2D7), d: dimensions),
                            ],
                        ),
                        SizedBox(height: dimensions.spacing),

                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                                _InfoBox(label: 'FAVORITE FOOD', value: data.favoriteFood, color: const Color(0xFFFFD8A8), d: dimensions),
                                SizedBox(width: dimensions.spacing),
                                _InfoBox(label: 'FAVORITE COLOR', value: data.favoriteColor, color: const Color(0xFFA5D8FF), d: dimensions),
                            ],
                        ),
                        SizedBox(height: dimensions.spacing),

                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                                _InfoBox(label: 'FAVORITE SONG', value: data.favoriteSong, color: const Color(0xFFD0BFFF), d: dimensions),
                                SizedBox(width: dimensions.spacing),
                                _InfoBox(label: 'FAVORITE HOBBY', value: data.favoriteHobby, color: const Color(0xFFFFE0DD), d: dimensions),
                            ],
                        ),

                        if (data.favoritePic != null && data.outsidePic != null) ...[
                            SizedBox(height: dimensions.spacing),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                    _photoColumn('Favorite Photo', data.favoritePic!, dimensions),
                                    SizedBox(width: dimensions.spacing * 2),
                                    _photoColumn('Hangout Photo', data.outsidePic!, dimensions),
                                ],
                            ),
                        ],

                        SizedBox(height: dimensions.padding),
                    ],
                ),
            ),
        );
    }

    Widget _photoColumn(String label, String path, _Dims d) 
    {
        return Column(
            children: [
                Container(
                    alignment: Alignment.center,
                    width: d.photoBoxSize,
                    decoration: BoxDecoration(
                        color: const Color(0xFFF8F0ED),
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                        label,
                        style: TextStyle(fontSize: d.labelFontSize, fontFamily: 'WinkyMilky'),
                    ),
                ),
                SizedBox(height: d.spacing / 2),
                SizedBox(
                    height: d.photoBoxSize,
                    width: d.photoBoxSize,
                    child: PictureWidget(path: path),
                ),
            ],
        );
    }
}

class _Header extends StatelessWidget
{
    final _Dims d;
    const _Header({required this.d});

    @override
    Widget build(BuildContext context) 
    {
        return Column(
            children: [
                Text(
                    'ALL ABOUT',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Montserrat',
                        fontSize: d.labelFontSize,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 2.0,
                    ),
                ),
                Text(
                    'ME',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'WinkyMilky',
                        fontSize: d.titleFontSize,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3.0,
                    ),
                ),
            ],
        );
    }
}

// ─── Info Box ─────────────────────────────────────────────────────────────────

class _InfoBox extends StatelessWidget
{
    final String label;
    final String value;
    final Color color;
    final _Dims d;

    const _InfoBox({
        required this.label,
        required this.value,
        required this.color,
        required this.d,
    });

    @override
    Widget build(BuildContext context) 
    {
        return Container(
            width: d.cardWidth,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: color,
                border: Border.all(color: Colors.black),
            ),
            child: Column(
                children: [
                    Text(
                        label,
                        textAlign: TextAlign.center,
                        style: TextStyle(letterSpacing: 1.4, fontSize: d.mainFontSize, fontFamily: 'WinkyMilky'),
                    ),
                    Text(
                        value,
                        textAlign: TextAlign.center,
                        style: TextStyle(letterSpacing: 1.4, fontSize: d.mainFontSize, fontFamily: 'WinkyMilky'),
                    ),
                ],
            ),
        );
    }
}

// ─── Box Widget ───────────────────────────────────────────────────────────────

class BoxWidget extends StatelessWidget
{
    final String path;
    final String title;
    final Color color;
    final _Dims d;

    const BoxWidget({
        super.key,
        required this.path,
        required this.title,
        required this.color,
        required this.d,
    });

    @override
    Widget build(BuildContext context) 
    {
        return SizedBox(
            width: d.cardWidth,
            height: d.cardWidth,
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
                        child: Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text(
                                title,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: d.nameFontSize, fontFamily: 'WinkyMilky'),
                            ),
                        ),
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: CircleAvatar(
                            radius: d.avatarRadius,
                            foregroundImage: AssetImage(path),
                        ),
                    ),
                ],
            ),
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
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: const Color(0xFFFFE0DD),
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                    BoxShadow(
                        color: Colors.black.withValues(alpha: 0.5),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: const Offset(4, 4),
                    ),
                ],
                image: DecorationImage(
                    image: AssetImage(path),
                    fit: BoxFit.cover,
                ),
            ),
        );
    }
}

class NameTagWidget extends StatelessWidget
{
    final String text;
    final _Dims dimensions;

    const NameTagWidget({super.key, required this.text, required this.dimensions});

    @override
    Widget build(BuildContext context) 
    {
        return ClipPath(
            clipper: ArrowClipper(),
            child: Container(
                width: dimensions.cardWidth,
                height: dimensions.cardWidth * 0.28,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                    color: const Color(0xFFD3EAF0),
                    border: Border.all(color: Colors.black54),
                ),
                child: Text(
                    text,
                    style: TextStyle(
                        letterSpacing: 1.1,
                        fontSize: dimensions.nameFontSize,
                        color: Colors.black,
                        fontFamily: 'Times New Roman',
                    ),
                ),
            ),
        );
    }
}

class ArrowClipper extends CustomClipper<Path>
{
    @override
    Path getClip(Size size) 
    {
        final path = Path();
        path.lineTo(size.width - 20, 0);
        path.lineTo(size.width, size.height / 2);
        path.lineTo(size.width - 20, size.height);
        path.lineTo(0, size.height);
        path.close();
        return path;
    }

    @override
    bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

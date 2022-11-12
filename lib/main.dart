import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return EnlargedPhoto_InteractiveView(
                        photo: Image.asset('images/duck.jpg'),
                      );
                    },
                  ));
                },
                child: Hero(
                  tag: 'imageHero',
                  child: CircleAvatar(
                    backgroundImage: AssetImage('images/duck.jpg'),
                    radius: 80,
                  ),
                ),
              ),
            ),
            Text(
              'Zoom with InteractiveViewer',
              style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
            ),
            Divider(height: 30),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return EnlargedPhoto_Photo_View(
                        photo: AssetImage('images/duck.jpg'),
                      );
                    },
                  ));
                },
                child: Hero(
                  tag: 'imageHero',
                  child: CircleAvatar(
                    backgroundImage: AssetImage('images/duck.jpg'),
                    radius: 80,
                  ),
                ),
              ),
            ),
            Text(
              'Zoom with photo_view',
              style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}

class EnlargedPhoto_InteractiveView extends StatelessWidget {
  Widget? photo;
  EnlargedPhoto_InteractiveView({Key? key, this.photo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.black,
      body: GestureDetector(
        child: InteractiveViewer(
          child: Center(
              child: Hero(
            tag: 'imageHero',
            child: photo!,
          )),
        ),
      ),
    );
  }
}

class EnlargedPhoto_Photo_View extends StatelessWidget {
  ImageProvider photo;
  EnlargedPhoto_Photo_View({Key? key, this.photo = const AssetImage('images/duck.jpg')})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[Colors.black, Colors.grey.shade900],
          stops: [0.1, 1.0],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0.0,
          title: Text('photo'),
          backgroundColor: Colors.transparent,
          centerTitle: true,
        ),
        body: Center(
          child: PhotoView(
            imageProvider: photo,
            backgroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[Colors.black, Colors.grey.shade900],
                stops: [0.1, 1.0],
              ),
            ),
            minScale: PhotoViewComputedScale.contained * 1.0,
            maxScale: PhotoViewComputedScale.covered * 1.1,
            tightMode: true,
            heroAttributes: const PhotoViewHeroAttributes(tag: "someTag"),
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class Hoover extends StatefulWidget {
//   const Hoover({ Key? key }) : super(key: key);

//   @override
//   _HooverState createState() => _HooverState();
// }

// class _HooverState extends State<Hoover> {


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             imageOnHoover('https://c4.wallpaperflare.com/wallpaper/817/500/937/captain-america-avengers-infinity-war-5k-steve-rogers-wallpaper-preview.jpg'),
//             // imageOnHoover('https://c4.wallpaperflare.com/wallpaper/817/500/937/captain-america-avengers-infinity-war-5k-steve-rogers-wallpaper-preview.jpg'),
//             // imageOnHoover('https://c4.wallpaperflare.com/wallpaper/817/500/937/captain-america-avengers-infinity-war-5k-steve-rogers-wallpaper-preview.jpg'),
//             // imageOnHoover('https://c4.wallpaperflare.com/wallpaper/817/500/937/captain-america-avengers-infinity-war-5k-steve-rogers-wallpaper-preview.jpg'),
//             // imageOnHoover('https://c4.wallpaperflare.com/wallpaper/817/500/937/captain-america-avengers-infinity-war-5k-steve-rogers-wallpaper-preview.jpg'),
//             // imageOnHoover('https://c4.wallpaperflare.com/wallpaper/817/500/937/captain-america-avengers-infinity-war-5k-steve-rogers-wallpaper-preview.jpg'),
//           ],
//         )
//       ),
//     );
//   }

//   imageOnHoover(String url){
//     double width = 100;
//     double height = 600;
//     return Flexible(
//       child: MouseRegion(
//         onEnter: (event) {
//           setState(() {
//             print('onEnter');
//             width = 400;
//             height = 600;
//           });
//         },
//         onExit: (event) {
//           setState(() {
//             width = 100;
//             height = 600;
//           });
//         },
//         child: AnimatedContainer(
//           width: width,
//           height: height,
//           duration: const Duration(milliseconds: 500),
//           child: Image.network(
//             url,
//             fit: BoxFit.cover,
//           ),
//         ),
//       ),
//     );
//   }

// }

import 'package:flutter/material.dart';

class Hoover extends StatefulWidget {
  const Hoover({Key? key}) : super(key: key);

  @override
  _HooverState createState() => _HooverState();
}

class _HooverState extends State<Hoover> {
  List<ImageProperties> imagePropertiesList = List.generate(
    6,
    (index) => ImageProperties(
      containerWidth: 600,
      containerHeight: 430,
      imageWidth: 100,
      imageOpacity: 0.8,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            6,
            (index) => buildImage(index),
          ),
        ),
      ),
    );
  }

  Widget buildImage(int index) {
    return Flexible(
      flex: 1,
      fit: FlexFit.loose,
      child: MouseRegion(
        cursor: SystemMouseCursors.allScroll,
        onEnter: (event) {
          setState(() {
            print('onEnter');
            imagePropertiesList[index].imageWidth = 500;
            imagePropertiesList[index].imageOpacity = 1;
          });
        },
        onExit: (event) {
          setState(() {
            imagePropertiesList[index].imageWidth = 100;
            imagePropertiesList[index].imageOpacity = 0.8;
          });
        },
        child: AnimatedContainer(
          width: imagePropertiesList[index].imageWidth,
          height: imagePropertiesList[index].containerHeight,
          duration: const Duration(milliseconds: 500),
          curve: Curves.ease,
          child: Opacity(
            opacity: imagePropertiesList[index].imageOpacity,
            child: Image.network(
              'https://c4.wallpaperflare.com/wallpaper/817/500/937/captain-america-avengers-infinity-war-5k-steve-rogers-wallpaper-preview.jpg',
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
              // colorBlendMode: BlendMode.darken,
            ),
          )
        ),
      ),
    );
  }
}

class ImageProperties {
  double containerWidth;
  double containerHeight;
  double imageWidth;
  double imageOpacity;

  ImageProperties({
    required this.containerWidth,
    required this.containerHeight,
    required this.imageWidth,
    required this.imageOpacity,
  });
}

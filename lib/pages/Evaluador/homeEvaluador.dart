// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// ignore: unused_import
import 'package:vitalmovecbi/widgets/navap.dart';

class HomeEvaluador extends StatefulWidget {
  const HomeEvaluador({Key? key}) : super(key: key);

  @override
  State<HomeEvaluador> createState() => _HomeEvaluadorState();
}

class _HomeEvaluadorState extends State<HomeEvaluador> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body:  GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/pageTests');
                    },
                    child: blueSquare(
                        text: "Tests",
                        imagePath: "img/Evaluador/test.svg",
                        size: size)),
                GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/pageTestB');
                    },
                    child: blueSquare(
                        text: "Lista usuarios",
                        imagePath: "img/Evaluador/groupuser.svg",
                        size: size)),
                GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/registerUser');
                    },
                    child: blueSquare(
                        text: "Crear usuario",
                        imagePath: "img/Evaluador/user_add.svg",
                        size: size)),
                GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/configuracion');
                    },
                    child: blueSquare(
                        text: "Configuracion",
                        imagePath: "img/Evaluador/setting.svg",
                        size: size)),
              ]),
      ),
    );

    // return Scaffold(
    //   body: ListView(
    //     children: [

    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           GestureDetector(
    //             onTap: () {
    //               Navigator.pushNamed(context, '/pageTests');
    //             },
    //             child: blueSquare(
    //                 text: "Tests",
    //                 imagePath: "img/Evaluador/test.svg",
    //                 size: size),
    //           ),
    //           GestureDetector(
    //             onTap: () {
    //               Navigator.pushNamed(context, '/pageTestB');
    //             },
    //             child: blueSquare(
    //                 text: "Lista usuarios",
    //                 imagePath: "img/Evaluador/groupuser.svg",
    //                 size: size),
    //           )
    //         ],
    //       ),
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           GestureDetector(
    //             onTap: () {
    //               Navigator.pushNamed(context, '/registerUser');
    //             },
    //             child: blueSquare(
    //                 text: "Crear usuario",
    //                 imagePath: "img/Evaluador/user_add.svg",
    //                 size: size),
    //           ),
    //           GestureDetector(
    //             onTap: () {
    //               Navigator.pushNamed(context, '/configuracion');
    //             },
    //             child: blueSquare(
    //               text: "Configuracion",
    //               imagePath: "img/Evaluador/setting.svg",
    //               size: size,
    //             ),
    //           )
    //         ],
    //       ),
    //     ],
    //   ),
    // );
  }
}

Widget navEvaluador(context, double height) {
  final size = MediaQuery.of(context).size;

  return Container(
    width: size.width,
    height: height,
    decoration: BoxDecoration(
      color: const Color(0xFFADE8F4),
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(size.width * 0.2),
      ),
    ),
    child: Center(
      child: Image.asset("img/Logo.png"),
    ),
  );
}

Widget blueSquare({
  required String text,
  required String imagePath,
  required Size size,
}) {
  return Container(
    decoration: BoxDecoration(
      color: const Color(0xFFADE8F4),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: SvgPicture.asset(
            imagePath,
            width: 90,
            height: 60,
          ),
        ),
        Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Color.fromRGBO(11, 35, 173, 1),
              fontSize: 16,
            ),
          ),
        ),
      ],
    ),
  );
}

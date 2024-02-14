import 'package:flutter/material.dart';

// class EvaluadorLogin extends StatelessWidget {
//   const EvaluadorLogin({super.key});


//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: Center(
//         child: Column(
//           children: [
//             nav(context),
//             SizedBox(
//               height: 20,
//             ),
//             Container(
//                 child: Column(
//               children: [
//                 Container(
//                   child: Image.asset("img/Logo.png"),
//                 ),
//               ],
//             )),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Codigo de usuario",
//                   style: TextStyle(
//                     fontSize: 18,
//                     color: Color.fromARGB(237, 3, 5, 94),
//                     fontWeight: FontWeight.w800,
//                   ),
//                 ),
//                 SizedBox(height: 5),
//                 inputLogin("Ingrese su codigo de usuario"),
//                 SizedBox(height: 20),
//               ],
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Usuario",
//                   style: TextStyle(
//                     fontSize: 18,
//                     color: Color.fromARGB(237, 3, 5, 94),
//                     fontWeight: FontWeight.w800,
//                   ),
//                 ),
//                 SizedBox(height: 5),
//                 inputLogin("Ingrese su usuario"),
//                 SizedBox(height: 20),
//               ],
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Contraseña",
//                   style: TextStyle(
//                     fontSize: 18,
//                     color: Color.fromARGB(237, 3, 5, 94),
//                     fontWeight: FontWeight.w800,
//                   ),
//                 ),
//                 SizedBox(height: 5),
//                 inputLogin("Ingrese su contraseña"),
//               ],
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Olvidaste tu contraseña?",
//                   style: TextStyle(
//                     fontSize: 15,
//                     color: Color.fromARGB(237, 3, 5, 94),
//                     fontWeight: FontWeight.w800,
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 50),
//             ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     fixedSize: Size(size.width * .5, size.height * .06),
//                     backgroundColor: Color.fromRGBO(0, 150, 199, 1),
//                     foregroundColor: Color.fromRGBO(255, 255, 255, 1),
//                     padding: EdgeInsets.all(size.height * .018),
//                     textStyle: TextStyle(
//                         fontSize: size.aspectRatio * 40,
//                         fontWeight: FontWeight.bold),
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(40))),
//                 onPressed: () {
//                   Navigator.pushReplacementNamed(context, '/evaluadorHome');
//                 },
//                 child: Text('Ingresar')),
//           ],
//         ),
//       ),
//     );
//   }
// }



// Widget inputLogin(String campo) {
//   return Container(
//       width: 300,
//       decoration: BoxDecoration(
//           color: Color.fromARGB(255, 240, 240, 240),
//           boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 3)],
//           borderRadius: BorderRadius.circular(10)),
//       child: TextField(
//           cursorColor: Color.fromARGB(33, 15, 15, 15),
//           decoration: InputDecoration(
//               hintStyle: TextStyle(
//                   color: Colors.grey.shade500,
//                   fontStyle: FontStyle.normal,
//                   fontSize: 14),
//               contentPadding: EdgeInsets.symmetric(horizontal: 20),
//               hintText: campo,
//               border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                   borderSide: BorderSide.none))));
// }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/');
              },
              icon: const Icon(Icons.arrow_back))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(size.width * .7, size.height * .08),
                    backgroundColor: const Color.fromRGBO(0, 150, 199, 1),
                    foregroundColor: const Color.fromRGBO(255, 255, 255, 1),
                    padding: EdgeInsets.all(size.height * .025),
                    textStyle: TextStyle(
                        fontSize: size.aspectRatio * 30,
                        fontWeight: FontWeight.bold),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40))),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/evaluadorHome');
                },
                child: const Text('Iniciar Home Evaluador')),
          ],
        ),
      ),
    );
  }


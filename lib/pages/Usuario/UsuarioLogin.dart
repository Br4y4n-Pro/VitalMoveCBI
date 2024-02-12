import 'package:flutter/material.dart';
import 'package:vitalmovecbi/widgets/InputText.dart';
import 'package:vitalmovecbi/widgets/navap.dart';

class UsuarioLogin extends StatelessWidget {
  const UsuarioLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: ListView(
      children: [
        nav(context),
        SizedBox(
          height: 30,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: size.width * 0.1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Documento de Identidad",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black)),
              const SizedBox(
                height: 3,
              ),
              inputLogin("Ingrese Documento de Identidad",size.width),
              SizedBox(height: 19),
              const Text("Contraseña",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black)),
              const SizedBox(
                height: 3,
              ),



              inputLogin("Ingrese tu contraseña",size.width),
              const SizedBox(height: 35),
              Container(
                width: size.width,
                margin: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(size.width * .4, size.height * .06),
                        backgroundColor: Color.fromRGBO(0, 150, 199, 1),
                        foregroundColor: Color.fromRGBO(255, 255, 255, 1),
                        padding: EdgeInsets.all(size.height * .002),
                        textStyle: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40))),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/homeUsuario');
                    },
                    child: Text('Acceder')),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}


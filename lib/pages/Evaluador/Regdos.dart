// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../../widgets/InputText.dart';

class RegistroUserdos extends StatefulWidget {
  const RegistroUserdos({Key? key}) : super(key: key);

  @override
  State<RegistroUserdos> createState() => _RegistroUserdos();
}

class _RegistroUserdos extends State<RegistroUserdos> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent, // Color azul claro
        centerTitle: true, // Centra el título del AppBar
        title: const Text('Registro de Usuario'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: size.width * 0.07),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Stack(
            children: [
              ListView(
                padding: const EdgeInsets.all(10.0),
                
                children: <Widget>[
                  Column(
                    children: [
                      const SizedBox(height: 40),
                      const Text(
                        'Datos persona de emergencia',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 40),
                      inputLogin(
                        'Nombre Completo ',
                        size.width,
                        TextInputType.name
                      ),
                      const SizedBox(height: 15),
                      inputLogin(
                        'Teléfono',
                        size.width,
                        TextInputType.phone
                      ),
                      const SizedBox(height: 15),
                      inputLogin(
                        'Parentezco',
                        size.width,
                        TextInputType.text
                      ),
                      const SizedBox(height: 15),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: size.width * .8,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(height: 40, width: 56),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, '/registerUser');
                                    },
                                    icon: const Icon(
                                      Icons.circle_outlined,
                                      size: 10,
                                    )),
                                IconButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, '/registerUser2');
                                    },
                                    icon: const Icon(
                                      Icons.circle_rounded,
                                      size: 10,
                                    )),
                                IconButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, '/registerUser3');
                                  },
                                  icon: const Icon(
                                    Icons.circle_outlined,
                                    size: 10,
                                  ),
                                )
                              ],
                            ),
                            IconButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, '/registerUser3');
                                },
                                icon: const Icon(
                                  Icons.keyboard_arrow_right,
                                  size: 40,
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

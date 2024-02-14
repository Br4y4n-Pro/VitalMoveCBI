
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
      body:Container(
  margin: EdgeInsets.symmetric(horizontal: size.width * 0.07),
  child: Form(
    key: _formKey,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    child: Stack(
      children: [
        ListView(
          padding: const EdgeInsets.all(10.0),
          children: <Widget>[
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
            ),
            const SizedBox(height: 15),
            inputLogin(
              'Teléfono',
              size.width,
            ),
            const SizedBox(height: 15),
            inputLogin(
              'Parentezco',
              size.width,
            ),
            const SizedBox(height: 15),
          ],
        ),
        Positioned(
          bottom: 15,
          right: 10,
          child: Row(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(height: 40, width: 40),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/registerUser');
                        },
                        icon: const Icon(
                          Icons.keyboard_arrow_left,
                          size: 40,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/registerUser');
                        },
                        icon: const Icon(
                          Icons.circle_outlined,
                          size: 10,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/registerUser3');
                        },
                        icon: const Icon(
                          Icons.circle_rounded,
                          size: 10,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/registerUser3');
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
                      Navigator.pushNamed(context, '/registerUser3');
                    },
                    icon: const Icon(
                      Icons.keyboard_arrow_right,
                      size: 40,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    ),
  ),
),

    );
  }
}

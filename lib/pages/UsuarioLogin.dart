import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vitalmovecbi/provider/login/LoginFromProvider.dart';
import 'package:vitalmovecbi/provider/login/ProviderLogin.dart';
import 'package:vitalmovecbi/utils/datalogin.dart';
import 'package:vitalmovecbi/widgets/checkBoxLogin.dart';
import 'package:vitalmovecbi/widgets/colores.dart';
import 'package:vitalmovecbi/widgets/loginTextField.dart';
import 'package:vitalmovecbi/widgets/navap.dart';

class UsuarioLogin extends StatefulWidget {
  const UsuarioLogin({super.key});

  @override
  State<UsuarioLogin> createState() => _UsuarioLoginState();
}

class _UsuarioLoginState extends State<UsuarioLogin> {
  UserLogin userLogin = UserLogin();

  @override
  Widget build(BuildContext context) {
    final fromProvider = Provider.of<LoginFromProvider>(context, listen: false);
    // final provider = Provider.of<LoginProvider>(context, listen: false);
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            nav(context),
            const SizedBox(
              height: 30,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
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
                  InputLogin(
                    onChanged: (value) => fromProvider.usuario = value,
                    campo: "Ingrese Documento de Identidad",
                    tamano: size.width,
                    tipo: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese su documento de identidad';
                      }
                      if (value.length < 7 || value.length > 12) {
                        return 'El documento de identidad debe tener entre 7 y 12 caracteres';
                      }
                      final RegExp regex = RegExp(
                        r'^\d{7,12}$',
                      );
                      if (!regex.hasMatch(value)) {
                        return 'El documento de identidad no es válido';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 19),
                  const Text("Contraseña",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.black)),
                  const SizedBox(
                    height: 3,
                  ),
                  Consumer<LoginFromProvider>(
                    builder: (context, fromProvider, child) => InputLogin(
                      campo: "Ingrese tu contraseña",
                      tamano: size.width,
                      tipo: TextInputType.visiblePassword,
                      onChanged: (value) => fromProvider.password = value,
                    ),
                  ),
                  const SizedBox(height: 1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CheckBoxInput(),
                          SizedBox(width: 0.1),
                          Text(
                            "¿Recordar Contraseña?",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Recuperar contraseña",
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 19),
                  Container(
                    width: size.width,
                    margin: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(size.width * .4, size.height * .06),
                        backgroundColor: Colores.primaryColor,
                        padding: EdgeInsets.all(size.height * .002),
                        textStyle: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      onPressed: () async {
                        try {
                          final provider = Provider.of<LoginProvider>(
                            context,
                            listen: false,
                          );
                          final fromProvider = Provider.of<LoginFromProvider>(
                            context,
                            listen: false,
                          );
                          provider.login(fromProvider, context);
                        } catch (error) {
                          print('Error al enviar la solicitud: $error');
                        }
                      },
                      child: const Text(
                        'Acceder',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: size.width * .01),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//   void _mostrarDialogo(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Confirmación'),
//           content: const Text('¿Deseas ir a la pantalla siguiente?'),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop(); // Cerrar el diálogo
//                 Navigator.pushReplacementNamed(context, '/evaluadorHome');
//               },
//               child: const Text('Evaluador'),
//             ),
//             TextButton(
//               onPressed: () async {},
//               child: const Text('Usuario'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

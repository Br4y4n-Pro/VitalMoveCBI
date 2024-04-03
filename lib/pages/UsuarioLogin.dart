// ignore_for_file: file_names, avoid_print
import 'package:flutter/foundation.dart';
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
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final fromProvider = Provider.of<LoginFromProvider>(context, listen: false);
    final provider = Provider.of<LoginProvider>(context);
    final size = MediaQuery.of(context).size;

    Orientation orientation = MediaQuery.of(context).orientation;
    bool isLandscape = orientation == Orientation.landscape;
    // Define los breakpoints para pantallas verticales
    const double verticalSmall = 400;
    const double verticalMedium = 600;
    const double verticalLarge = 900;

    // Define los breakpoints para pantallas apaisadas
    const double landscapeSmall = 815;
    const double landscapeMedium = 1000;
    const double landscapeLarge = 1200;
    bool masAnchoqueLarge = landscapeLarge < size.width;
    // print(orientation);
    // print(isLandscape);
    // print('Ancho: ${size.width} Altura: ${size.height}');
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            (kIsWeb && landscapeSmall <= size.width)
                ? Container()
                : nav(context),
            (kIsWeb && landscapeSmall <= size.width)
                ? Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: masAnchoqueLarge
                            ? size.width * .2
                            : size.width * .1,
                        vertical: size.height * .1),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Colors.grey.shade300, blurRadius: 3)
                      ],
                    ),
                    height: size.height,
                    width: size.width,
                    child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromARGB(255, 82, 81, 81),
                                blurRadius: 10,
                                blurStyle: BlurStyle.outer)
                          ]),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: masAnchoqueLarge
                                ? size.width * .3
                                : size.width * .4,
                            height: size.height,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.horizontal(
                                    left: Radius.circular(10)),
                                image: DecorationImage(
                                    image:
                                        AssetImage('img/General/webLogin.jpeg'),
                                    alignment: Alignment.center,
                                    fit: BoxFit.cover)),
                          ),
                          Container(
                              height: size.height,
                              width: masAnchoqueLarge
                                  ? size.width * .3
                                  : size.width * .4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('img/Logo.png'),
                                  _form(fromProvider, provider),
                                ],
                              )),
                        ],
                      ),
                    ),
                  )
                : _form(
                    fromProvider,
                    provider,
                  )
          ],
        ),
      ),
    );
  }

  Widget _form(LoginFromProvider fromProvider, provider) {
    final size = MediaQuery.of(context).size;

    return Container(
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
          Consumer(
              builder: (context, value, child) => InputLogin(
                    campo: "Ingrese Documento de Identidad",
                    tamano: size.width,
                    tipo: TextInputType.number,
                    onChanged: (value) => fromProvider.usuario = value,
                  )),
          const SizedBox(height: 19),
          const Text("Contraseña",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.black)),
          const SizedBox(
            height: 3,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color(0xffF5F5F5),
                      boxShadow: [
                        BoxShadow(color: Colors.grey.shade300, blurRadius: 3)
                      ],
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    cursorColor: const Color.fromARGB(33, 15, 15, 15),
                    obscureText: _obscureText,
                    onChanged: (value) => fromProvider.password = value,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(
                          color: Colors.grey.shade500,
                          fontStyle: FontStyle.normal,
                          fontSize: 14),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 16.0),
                      hintText: 'Ingresa tu contraseña',
                      border: InputBorder.none,
                      focusColor: Colors.transparent,
                      suffixIcon: IconButton(
                        icon: Icon(_obscureText
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                    ),
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
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
                  setState(() {
                    try {
                      provider.ischeck = true;
                      provider.login(fromProvider, context);
                    } catch (error) {
                      print('Error al enviar la solicitud: $error');
                    }
                  });
                },
                child: (!provider.ischeck)
                    ? const Text(
                        'Acceder',
                        style: TextStyle(color: Colors.white),
                      )
                    : const CircularProgressIndicator(
                        color: Colors.white,
                      )),
          ),
          SizedBox(height: size.width * .01),
        ],
      ),
    );
  }
}

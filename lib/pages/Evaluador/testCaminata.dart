// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vitalmovecbi/Modelos/UsuariosModelo.dart';
import 'package:vitalmovecbi/index.dart';
import 'package:vitalmovecbi/provider/usuarios/providerUsuarios.dart';


class TestCaminata extends StatefulWidget {
  const TestCaminata({super.key});

  @override
  State<TestCaminata> createState() => _TestCaminata();
}

class _TestCaminata extends State<TestCaminata> {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    TextEditingController controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Test Caminata",
          style: TextStyle(
            color: Colores.quaternaryColor,
          ),
        ),
        backgroundColor: Colores.primaryColor,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colores.quaternaryColor),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 60),
            Container(
                width: size.width,
                decoration: BoxDecoration(
                    color: const Color(0xffF5F5F5),
                    boxShadow: [
                      BoxShadow(color: Colors.grey.shade300, blurRadius: 3)
                    ],
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: controller,
                  onChanged: (value) => {},
                  keyboardType: TextInputType.name,
                  cursorColor: const Color.fromARGB(33, 15, 15, 15),
                  decoration: InputDecoration(
                      hintStyle: TextStyle(
                          color: Colors.grey.shade500,
                          fontStyle: FontStyle.normal,
                          fontSize: 14),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20),
                      hintText: "Ingresa el nombre o la cedula",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none)),
                )),
            const SizedBox(height: 50),
            Container(
              height: 1,
              width: size.width,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(0, 150, 199, 1),
              ),
            ),
            const SizedBox(height: 40),
            Consumer<UsuarioProvider>(
              builder: (context, provider, child) {
                if (provider.usuarios.isEmpty) {
                  return const Center(
                      child: CircularProgressIndicator(
                    color: Colores.primaryColor,
                  ));
                }
                return Expanded(
                  child: ListView.builder(
                    itemCount: provider.usuarios.length,
                    itemBuilder: (context, index) {
                      Usuario usuario = provider.usuarios[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/pageTestCaminataFCR',
                            arguments: usuario,
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          height: 70,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colores.quaternaryColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: (usuario.imgperfil != null)
                                  ? NetworkImage(usuario.imgperfil.toString())
                                  : AssetImage('img/Usuario/usu2.png')
                                      as ImageProvider<Object>?,
                            ),
                            title:
                                Text('${usuario.nombres} ${usuario.apellidos}'),
                            subtitle: Text('${usuario.dni}'),
                            trailing: IconButton(
                                onPressed: () {}, icon: Icon(Icons.open_with)),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

Widget inputLogin(String campo) {
  return Container(
    width: 350,
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 240, 240, 240),
      boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 3)],
      borderRadius: BorderRadius.circular(10),
    ),
    child: TextField(
      cursorColor: const Color.fromARGB(33, 15, 15, 15),
      decoration: InputDecoration(
        hintStyle: TextStyle(
          color: Colors.grey.shade500,
          fontStyle: FontStyle.normal,
          fontSize: 14,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        hintText: campo,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    ),
  );
}

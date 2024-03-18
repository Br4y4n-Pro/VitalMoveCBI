// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vitalmovecbi/Modelos/UsuariosModelo.dart';
import 'package:vitalmovecbi/provider/configuracion/modoscuroProvider.dart';
import 'package:vitalmovecbi/provider/usuarios/providerUsuarios.dart';
import 'package:vitalmovecbi/widgets/colores.dart';

class Persona {
  final String nombre;
  final String cedula;

  Persona(this.nombre, this.cedula);
}

class Testbruce extends StatefulWidget {
  const Testbruce({super.key});

  @override
  State<Testbruce> createState() => _Testbruce();
}

class _Testbruce extends State<Testbruce> {
  final TextEditingController controller = TextEditingController();
  List<Usuario> usuariosFiltrados = [];

  @override
  void initState() {
    super.initState();
    // Inicializa el controlador del TextField
    controller.addListener(_filtrarUsuarios);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _filtrarUsuarios(); // Llama a _filtrarUsuarios() después de construir el widget para llenar la lista inicialmente.
    });
  }

  @override
  void dispose() {
    // Limpia el controlador cuando el widget se desmonte
    controller.dispose();
    super.dispose();
  }

  void _filtrarUsuarios() {
    final texto = controller.text.toLowerCase();
    final provider = Provider.of<UsuarioProvider>(context, listen: false);

    setState(() {
      if (texto.isEmpty) {
        // Si no hay texto, muestra todos los usuarios
        usuariosFiltrados = provider.usuarios;
      } else {
        // Filtra los usuarios basándose en el texto ingresado
        usuariosFiltrados = provider.usuarios.where((usuario) {
          final nombreCompleto =
              '${usuario.nombres} ${usuario.apellidos}'.toLowerCase();
          final dni = usuario.dni?.toLowerCase() ?? '';
          return nombreCompleto.contains(texto) || dni.contains(texto);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
     final darkModeProvider = Provider.of<DarkModeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Test Bruce",
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
                           style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
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
                    itemCount: usuariosFiltrados.length,
                    itemBuilder: (context, index) {
                      final usuario = usuariosFiltrados[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/pageTestBM',
                            arguments: usuario,
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          height: 70,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: (darkModeProvider.isDarkModeEnabled)
                                  ? Colores.primaryColor
                                  : Colores.quaternaryColor,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20))),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: (usuario.imgperfil != null)
                                  ? NetworkImage(usuario.imgperfil.toString())
                                  : const AssetImage('img/Usuario/usu2.png')
                                      as ImageProvider<Object>?,
                            ),
                            title:
                                Text('${usuario.nombres} ${usuario.apellidos}'),
                            subtitle: Text('${usuario.dni}'),
                            trailing: IconButton(
                                onPressed: () {}, icon: const Icon(Icons.open_with)),
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

Widget lista(String nombre, String cedula) {
  return Container(
    decoration: BoxDecoration(
      color: const Color(0xFFADE8F4),
      borderRadius: BorderRadius.circular(10),
    ),
    margin: const EdgeInsets.symmetric(vertical: 1),
    child: ListTile(
      title: Text(nombre),
      subtitle: Text(cedula),
      leading: const CircleAvatar(
        radius: 30,
        backgroundImage: AssetImage("img/General/viejito.jpg"),
      ),
    ),
  );
}

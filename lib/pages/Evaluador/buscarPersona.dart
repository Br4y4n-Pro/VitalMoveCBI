// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vitalmovecbi/Modelos/UsuariosModelo.dart';
import 'package:vitalmovecbi/pages/Evaluador/PerfilInformativo.dart';
import 'package:vitalmovecbi/provider/configuracion/modoscuroProvider.dart';
import 'package:vitalmovecbi/provider/usuarios/providerUsuarios.dart';

import 'package:vitalmovecbi/widgets/colores.dart';

class BuscarPersona extends StatefulWidget {
  const BuscarPersona({super.key});

  @override
  State<BuscarPersona> createState() => _BuscarPersonaState();
}

class _BuscarPersonaState extends State<BuscarPersona> {
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
       automaticallyImplyLeading: false,
        title: const Text(
          "Buscar Persona",
          style: TextStyle(
              color: Colores.quaternaryColor, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colores.primaryColor,
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
            Expanded(
              child: ListView.builder(
                itemCount: usuariosFiltrados.length,
                itemBuilder: (context, index) {
                  final usuario = usuariosFiltrados[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              PerfilInformativo(usuario: usuario),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      height: 70,
                      decoration: BoxDecoration(
                         color: (darkModeProvider.isDarkModeEnabled)
                                  ? Colores.primaryColor
                                  : Colores.quaternaryColor,
                          borderRadius: const BorderRadius.all(Radius.circular(20))),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: (usuario.imgperfil != null)
                              ? NetworkImage(usuario.imgperfil.toString())
                              : const AssetImage('img/Usuario/usu2.png')
                                  as ImageProvider<Object>?,
                        ),
                        title: Text('${usuario.nombres} ${usuario.apellidos}'),
                        subtitle: Text('${usuario.dni}'),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

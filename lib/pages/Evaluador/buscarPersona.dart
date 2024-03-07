// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// ignore: unused_import
import 'package:vitalmovecbi/Modelos/UsuariosModelo.dart';
import 'package:vitalmovecbi/pages/Evaluador/PerfilInformativo.dart';
import 'package:vitalmovecbi/provider/usuarios/providerUsuarios.dart';
import 'package:vitalmovecbi/widgets/InputText.dart';

import 'package:vitalmovecbi/widgets/colores.dart';

class BuscarPersona extends StatefulWidget {
  const BuscarPersona({Key? key});

  @override
  State<BuscarPersona> createState() => _BuscarPersonaState();
}

class _BuscarPersonaState extends State<BuscarPersona> {
  @override
  void initState() {
    super.initState();
    final usuarioProvider =
        Provider.of<UsuarioProvider>(context, listen: false);
    usuarioProvider.allUser(context);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colores.quaternaryColor),
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
            inputLogin("Cedula  ò Nombre ", size.width, TextInputType.name),
            const SizedBox(height: 60),
            Container(
              width: size.width,
              margin: EdgeInsets.symmetric(horizontal: size.width * 0.1),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(0, 150, 199, 1),
                      foregroundColor: const Color.fromRGBO(255, 255, 255, 1),
                      padding: EdgeInsets.all(size.height * .002),
                      textStyle: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40))),
                  onPressed: () {},
                  child: const Text('Buscar')),
            ),
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
                  return const Center(child: Text("Cargando usuarios..."));
                }
                return Expanded(
                  // Asegura que ListView.builder tenga un límite en su altura.
                  child: ListView.builder(
                    itemCount: provider.usuarios.length,
                    itemBuilder: (context, index) {
                      Usuario usuario = provider.usuarios[index];
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
                          margin: const EdgeInsets.only(
                              bottom:
                                  10), // Añade un margen solo en la parte inferior de cada Container
                          height: 70,
                          width: double
                              .infinity, // Hace que el Container se expanda al máximo ancho posible
                          decoration: BoxDecoration(
                              color: Colores.quaternaryColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: ListTile(
                            leading: CircleAvatar(
                              // Puedes poner la imagen que prefieras aquí
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

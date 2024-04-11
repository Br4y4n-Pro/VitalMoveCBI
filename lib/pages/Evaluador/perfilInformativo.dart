// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:vitalmovecbi/Modelos/UsuariosModelo.dart';
import 'package:vitalmovecbi/services/localStorage.dart';
import 'package:vitalmovecbi/widgets/colores.dart';

class PerfilInformativo extends StatefulWidget {
  final Usuario usuario;
  const PerfilInformativo({super.key, required this.usuario});
  @override
  State<PerfilInformativo> createState() => _PerfilInformativoState();
}

class _PerfilInformativoState extends State<PerfilInformativo> {
  @override
  void initState() {
    super.initState();
    LocalStorage.prefs.setString('id', widget.usuario.idUsuario.toString());
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var usuarioId = LocalStorage.prefs.getString('id');
    print(usuarioId);

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colores.quaternaryColor),
        title: const Text(
          "Ultima Información",
          style: TextStyle(
              color: Colores.quaternaryColor, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colores.primaryColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              height: 80,
              width: double.infinity,
              child: ListTile(
                contentPadding: const EdgeInsets.only(right: 45),
                leading: CircleAvatar(
                  backgroundImage: (widget.usuario.imgperfil != '')
                      ? NetworkImage('${widget.usuario.imgperfil}')
                      : const AssetImage('img/Usuario/usu2.png')
                          as ImageProvider<Object>?,
                ),
                title: Text(
                  '${widget.usuario.nombres} ${widget.usuario.apellidos}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(' CC ${widget.usuario.dni}'),
                trailing: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/perfil');
                    },
                    icon: const Icon(Icons.remove_red_eye_outlined)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Text(" Ultima medicion IMC"),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                          color: Color(0xff0096C7),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: const Center(
                          child: Text(
                        "5",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      )),
                    )
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(height: 23),
                    GestureDetector(
                      onTap: () {},
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(size.width * .2, size.height * .01),
                          backgroundColor: Colores.primaryColor,
                          padding: EdgeInsets.all(size.height * .002),
                          textStyle: const TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                        onPressed: () async {},
                        child: const Center(
                          child: Text(
                            "Actualizar Peso",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text(" Ultima medicion IMC"),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                        color: Color(0xff0096C7),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: const Center(
                          child: Text(
                        "5",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      )),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(height: 40),
            Container(
              height: 1,
              width: size.width,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(0, 150, 199, 1),
              ),
            ),
            const SizedBox(height: 50),
            const Text('Mes en que realizo test'),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/pageCaminata');
              },
              child: Container(
                  height: 70,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      image: DecorationImage(
                        image: AssetImage("img/caminar.jpg"),
                        fit: BoxFit.fitWidth,
                      )),
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        color: Colors.black.withOpacity(.5),
                      ),
                      child: const Center(
                        child: Text(
                          "Caminata",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                      ))),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/pageBruce');
              },
              child: Container(
                  height: 70,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      image: DecorationImage(
                        image: AssetImage("img/bruce.jpg"),
                        fit: BoxFit.fitWidth,
                      )),
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        color: Colors.black.withOpacity(.5),
                      ),
                      child: const Center(
                        child: Text(
                          "Bruce",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                      ))),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/pagePeso');
              },
              child: Container(
                  height: 70,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      image: DecorationImage(
                        image: AssetImage("img/peso.jpg"),
                        fit: BoxFit.fitWidth,
                      )),
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        color: Colors.black.withOpacity(.5),
                      ),
                      child: const Center(
                        child: Text(
                          "Peso",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                      ))),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/pageVOdos');
              },
              child: Container(
                  height: 70,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      image: DecorationImage(
                        image: AssetImage("img/Vo2.jpg"),
                        fit: BoxFit.fitWidth,
                      )),
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        color: Colors.black.withOpacity(.5),
                      ),
                      child: const Center(
                        child: Text(
                          "Vo2",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                      ))),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vitalmovecbi/Modelos/UsuariosModelo.dart';
import 'package:vitalmovecbi/index.dart';
import 'package:vitalmovecbi/provider/configuracion/modoscuroProvider.dart';
import 'package:vitalmovecbi/provider/testbruce/BruceFromProvider.dart';
import 'package:vitalmovecbi/provider/testbruce/ProviderBruce.dart';
import 'package:vitalmovecbi/services/localStorage.dart';
import 'package:vitalmovecbi/widgets/loginTextField.dart';

class TestBruceMod extends StatefulWidget {
  final Usuario? usuario;

  // ignore: use_super_parameters
  const TestBruceMod({Key? key, this.usuario}) : super(key: key);

  @override
  State<TestBruceMod> createState() => _TestBruceMod();
}

class _TestBruceMod extends State<TestBruceMod> {
  DateTime? selectedDate;
  String dropdownValue = 'Etapa';
  String? rhType;

  String dropdownValuesrh = 'Seleccione etapa';
  final TextEditingController _recomendacionController =
      TextEditingController();

  var itemsetapa = [
    'Seleccione etapa',
    'Etapa 1',
    'Etapa 2',
    'Etapa 3',
    'Etapa 4',
    'Etapa 5',
    'Etapa 6',
    'Etapa 7',
    'Etapa 8',
    'Etapa 9',
  ];

  @override
  Widget build(BuildContext context) {
    final darkModeProvider = Provider.of<DarkModeProvider>(context);
    final fromProvider = Provider.of<BruceFromProvider>(context, listen: false);
    final provider = Provider.of<BruceProvider>(context, listen: false);
    final usuario = ModalRoute.of(context)?.settings.arguments as Usuario?;
    
    LocalStorage.prefs.setString('idselecionado', usuario!.idUsuario.toString());

    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colores.primaryColor,
        centerTitle: true,
        title: const Text(
          "Test Bruce",
          style: TextStyle(
            color: Colores.quaternaryColor,
          ),
        ),
        iconTheme: const IconThemeData(color: Colores.quaternaryColor),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          padding: const EdgeInsets.all(10.0),
          children: <Widget>[
            const SizedBox(height: 30),
            const Text(
              "Usuario seleccionado:",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              height: 70,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: (darkModeProvider.isDarkModeEnabled)
                      ? Colores.primaryColor
                      : Colores.quaternaryColor,
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: (usuario?.imgperfil != null)
                      ? NetworkImage(usuario!.imgperfil.toString())
                      : const AssetImage('img/Usuario/usu2.png')
                          as ImageProvider<Object>?,
                ),
                title: Text('${usuario?.nombres} ${usuario?.apellidos}'),
                subtitle: Text('${usuario?.dni}'),
                trailing: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.open_with)),
              ),
            ),
            const SizedBox(height: 30),
            const Center(
              child: Text(
                'Text de Bruce MOD',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightBlueAccent,
                ),
              ),
            ),
            const SizedBox(height: 50),
            Consumer(
              builder: (context, value, child) => InputLogin(
                  onChanged: (value) => fromProvider.saturacion = value,
                  campo: "Saturación",
                  tamano: size.width,
                  tipo: TextInputType.number),
            ),
            const SizedBox(height: 20),
            Container(
              width: size.width * .5,
              padding: const EdgeInsets.symmetric(horizontal: 18),
              decoration: BoxDecoration(
                color: const Color(0xffF5F5F5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 3,
                  )
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              child: DropdownButton<String>(
                value: dropdownValuesrh,
                icon: const Icon(Icons.keyboard_arrow_down),
                alignment: Alignment.bottomLeft,
                items: itemsetapa.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValuesrh = newValue!;
                    rhType = newValue;
                    fromProvider.etapa = newValue;
                  });
                },
                dropdownColor: Colors.white,
                underline: Container(),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: _mostrarModal,
                  child: const Row(
                    children: [
                      Text(
                        'Añadir Recomendacion',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.add),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            Container(
              margin: EdgeInsets.symmetric(horizontal: size.width * 0.1),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(size.width * .4, size.height * .06),
                  backgroundColor: const Color.fromRGBO(0, 150, 199, 1),
                  foregroundColor: const Color.fromRGBO(255, 255, 255, 1),
                  padding: EdgeInsets.all(size.height * .002),
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                onPressed: () async {
                  try {
                    provider.bruce(fromProvider, context);
                  } catch (error) {
                    print('Error al enviar la solicitud: $error');
                  }
                },
                child: const Text('Guardar Registro'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _mostrarModal() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Agregar Recomendación"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextField(
                  controller: _recomendacionController,
                  decoration: const InputDecoration(
                    labelText: 'Recomendación',
                    hintText: 'Ingrese su recomendación aquí',
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                String recomendacion = _recomendacionController.text;
                print('Recomendación agregada: $recomendacion');
                Navigator.of(context).pop();
              },
              child: const Text('Guardar'),
            ),
          ],
        );
      },
    );
  }
}

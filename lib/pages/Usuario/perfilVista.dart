// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vitalmovecbi/Modelos/historialModelo.dart';
import 'package:vitalmovecbi/provider/datosGenerales/historialUser.dart';
import 'package:vitalmovecbi/provider/login/ProviderLogin.dart';
import 'package:vitalmovecbi/widgets/colores.dart';
import 'package:intl/intl.dart';

class PerfilVista extends StatefulWidget {
  const PerfilVista({super.key});

  @override
  State<PerfilVista> createState() => _PerfilVistaState();
}

class _PerfilVistaState extends State<PerfilVista> {
  bool _editingEnabled = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
    final usuario = loginProvider.usuarios[0];
    final providerHistorial = Provider.of<HistorialProvider>(context);
    final ultimoHistorial = providerHistorial.historiales.isNotEmpty
        ? providerHistorial.historiales[0]
        : Historial(); // Reemplaza Historial() con el tipo de dato correcto
    String formatearFecha(String fecha) {
      DateTime dateTime = DateTime.parse(fecha);
      String fechaFormateada = DateFormat('yyyy-MM-dd').format(dateTime);
      return fechaFormateada;
    }

    String fechaFormateada = formatearFecha(usuario.fechaNacimiento.toString());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Datos Personales',
          style: TextStyle(
            color: Colores.quaternaryColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colores.primaryColor,
        actions: [
          if (usuario.rol == '1')
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                setState(() {
                  _editingEnabled = !_editingEnabled;
                });
              },
            ),
        ],
      ),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(150),
            ),
            child: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.transparent,
              child: usuario.imgperfil!.isNotEmpty
                  ? Center(
                      child: ClipOval(
                        child: Image.network(
                          usuario.imgperfil.toString(),
                          fit: BoxFit.cover,
                          width: 100,
                          height: 100,
                        ),
                      ),
                    )
                  : ClipOval(
                      child: Image.asset(
                        "img/Usuario/usu2.png",
                        fit: BoxFit.cover,
                        width: 90,
                        height: 90,
                      ),
                    ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: size.width * .1,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                _editingEnabled
                    ? textFieldEditable("Nombres y apellidos",
                        "${usuario.nombres} ${usuario.apellidos}")
                    : textField("Nombres y apellidos",
                        "${usuario.nombres} ${usuario.apellidos}"),
                const SizedBox(height: 15),
                _editingEnabled
                    ? textFieldEditable(
                        "Documento de Identidad", "${usuario.dni}")
                    : textField("Documento de Identidad", "${usuario.dni}"),
                const SizedBox(height: 15),
                _editingEnabled
                    ? textFieldEditable("Fecha de Nacimiento", fechaFormateada)
                    : textField("Fecha de Nacimiento", fechaFormateada),
                const SizedBox(height: 15),
                _editingEnabled
                    ? textFieldEditable("Género", "${usuario.genero}")
                    : textField("Género", "${usuario.genero}"),
                const SizedBox(height: 15),
                _editingEnabled
                    ? textFieldEditable("Tipo de Sangre", "${usuario.rh}")
                    : textField("Tipo de Sangre", "${usuario.rh}"),
                const SizedBox(height: 15),
                _editingEnabled
                    ? textFieldEditable("Dirección", "${usuario.direccion}")
                    : textField("Dirección", "${usuario.direccion}"),
                const SizedBox(height: 15),
                _editingEnabled
                    ? textFieldEditable(
                        "EPS(Entidad de salud)", "${usuario.eps}")
                    : textField("EPS(Entidad de salud)", "${usuario.eps}"),
                const SizedBox(height: 15),
                _editingEnabled
                    ? textFieldEditable("Alergias", "${usuario.alergias}")
                    : textField("Alergias", "${usuario.alergias}"),
                const SizedBox(height: 15),
                _editingEnabled
                    ? textFieldEditable("IMC",
                        '${double.parse(ultimoHistorial.imc ?? '0').toStringAsFixed(2)}   ${ultimoHistorial.imcdescripcion}')
                    : textField("IMC",
                        '${double.parse(ultimoHistorial.imc ?? '0').toStringAsFixed(2)}   ${ultimoHistorial.imcdescripcion}'),
                const SizedBox(height: 15),
                _editingEnabled
                    ? textFieldEditable("Grupo", "${usuario.grupo}")
                    : textField("Grupo", "${usuario.grupo}"),
                const SizedBox(height: 15),
                _editingEnabled
                    ? textFieldEditable(
                        "Peso (KG)", ultimoHistorial.peso ?? '0')
                    : textField("Peso (KG)", ultimoHistorial.peso ?? '0'),
                const SizedBox(height: 15),
                _editingEnabled
                    ? textFieldEditable("Talla (Metros)", "${usuario.talla}")
                    : textField("Talla (Metros)", "${usuario.talla}"),
                const SizedBox(height: 25),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget textField(String labelText, String initialValue) {
    return TextFormField(
      initialValue: initialValue,
      readOnly: true,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }

  Widget textFieldEditable(String labelText, String initialValue,String atributo) {
    return TextFormField(
      onChanged: (value) => print(value),
      initialValue: initialValue,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}

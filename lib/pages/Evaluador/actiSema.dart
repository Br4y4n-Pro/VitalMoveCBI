// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../../widgets/InputText.dart';


class RegistroUsertres extends StatefulWidget {
  const RegistroUsertres({Key? key}) : super(key: key);

  @override
  State<RegistroUsertres> createState() => _RegistroUsertres();
}

class _RegistroUsertres extends State<RegistroUsertres> {
  final _formKey = GlobalKey<FormState>();

   var items = [
    '0 = Sedentario',
    '1 = bajo',
    '3 a 7 = Moderado',
  ];
 String dropdownValues = '0 = Sedentario';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent, // Color azul claro
        centerTitle: true, // Centra el título del AppBar
        title: const Text('Registro de Actividad '),
      ),
      body: Container(
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
              '¿Cuantos dias por semana realiza activida fisica ?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                

              ),
            ),
            const SizedBox(height: 40),
                 Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    
                      
                      Container(
                        width: size.width * 0.8,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            color: const Color(0xffF5F5F5),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade300, blurRadius: 3)
                            ],
                            borderRadius: BorderRadius.circular(10)),
                        child: DropdownButton<String>(
                          style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                          value: dropdownValues,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: items.map((String item) {
                            return DropdownMenuItem<String>(
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValues = newValue!;
                            });
                          },
                          dropdownColor: Colors.white,
                          underline: Container(),
                        ),
                      ),
                    ],
                  ),
                  
      
                  const SizedBox(height: 15),
                  inputLogin(
                    'Talla (M) ',
                    size.width,
                  ),
                  const SizedBox(height: 15),
                  inputLogin(
                    'Peso (Kg)',
                    size.width,
                  ),

                  const SizedBox(height: 50),
              
                 Container(
                width: size.width,
                margin: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(size.width * .4, size.height * .06),
                        backgroundColor: const Color.fromRGBO(0, 150, 199, 1),
                        foregroundColor: const Color.fromRGBO(255, 255, 255, 1),
                        padding: EdgeInsets.all(size.height * .002),
                        textStyle: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40))),
                    onPressed: () {
                      _mostrarDialogo(context);
                    },
                    child: const Text('Registrar')),
              ),
            
                ],
              ),
              Positioned(
                bottom: 15,
                right: 10,
                child: 
                Row(
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
                        ),),

                        IconButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/registerUser');
                            },
                            icon: const Icon(
                              Icons.circle_outlined,
                              size: 10,
                            )),
                             IconButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/registerUser2');
                            },
                            icon: const Icon(
                              Icons.circle_outlined,
                              size: 10,
                            )),
                        IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/registerUser3');
                          },
                          icon: const Icon(
                            Icons.circle_rounded,
                            size: 10,
                          ),
                        )
                        
                      ],
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '');
                        },
                        icon: const Icon(
                          Icons.keyboard_arrow_right,
                          size: 40,
                        ))
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

void _mostrarDialogo(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Usuario Registrado Exitosamente '),
        
       
        content: const Text(''),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Cerrar el diálogo
              Navigator.pushNamed(context, '/');
            },
            child: const Text('Evaluador'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Cerrar el diálogo
              Navigator.pushNamed(context, '/');
            },
            child: const Text(''),
          ),
        ],
      );
    },
  );
}
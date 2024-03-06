import 'package:flutter/material.dart';
import 'package:vitalmovecbi/Modelos/UsuariosModelo.dart';

class SearchUsuarioDelegate extends SearchDelegate<Usuario> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [Center()];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return Center();
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center();
  }
}

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

class PrincipalPagina extends StatefulWidget {
  @override
  _PrincipalPaginaState createState() => _PrincipalPaginaState();
}

class _PrincipalPaginaState extends State<PrincipalPagina> {
  PickedFile foto;
  final _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camara'),
        actions: <Widget>[
          IconButton(icon: _deleteIcon(), onPressed: _deleteFoto)
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        alignment: Alignment.topCenter,
        child: _mostrarFoto(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _tomarFoto,
        child: Icon(Icons.camera_enhance),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  _tomarFoto() async {
    foto = await _picker.getImage(source: ImageSource.camera);
    setState(() {});
  }

  _deleteFoto() {
    setState(() {
      foto = null;
    });
  }

  Widget _deleteIcon() {
    return Icon(
      Icons.delete,
      color: Colors.white,
    );
  }

  Widget _mostrarFoto() {
    return Image(
      image: AssetImage(foto?.path ?? 'assets/no-image.png'),
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.cover,
    );
  }
}

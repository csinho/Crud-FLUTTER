import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:crud/model/note.dart';

class NoteScreen extends StatefulWidget {
  final Note note;
  NoteScreen(this.note);

  @override
  State<StatefulWidget> createState() => new _NoteScreenState();
}

final notesReference = FirebaseDatabase.instance.reference().child('crud');

class _NoteScreenState extends State<NoteScreen> {
  TextEditingController _tituloController;
  TextEditingController _descricaoController;
  TextEditingController _precoController;

  @override
  void initState() {
    super.initState();

    _tituloController = new TextEditingController(text: widget.note.titulo);
    _descricaoController =
        new TextEditingController(text: widget.note.descricao);
    _precoController = new TextEditingController(text: widget.note.preco);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cursos'), backgroundColor: Colors.black),
      body: Container(
        margin: EdgeInsets.all(15.0),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            TextField(
              controller: _tituloController,
              decoration: InputDecoration(labelText: 'Curso'),
            ),
            Padding(padding: new EdgeInsets.all(5.0)),
            TextField(
              controller: _descricaoController,
              decoration: InputDecoration(labelText: 'Descrição'),
            ),
            TextField(
              controller: _precoController,
              decoration: InputDecoration(labelText: 'Preço'),
            ),
            Padding(padding: new EdgeInsets.all(5.0)),
            RaisedButton(
              child: (widget.note.id != null) ? Text('Alterar') : Text('Novo'),
              onPressed: () {
                if (widget.note.id != null) {
                  notesReference.child(widget.note.id).set({
                    'titulo': _tituloController.text,
                    'descricao': _descricaoController.text,
                    'preco': _precoController.text
                  }).then((_) {
                    Navigator.pop(context);
                  });
                } else {
                  notesReference.push().set({
                    'titulo': _tituloController.text,
                    'descricao': _descricaoController.text,
                    'preco': _precoController.text
                  }).then((_) {
                    Navigator.pop(context);
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

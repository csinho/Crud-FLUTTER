import 'package:firebase_database/firebase_database.dart';

class Note {
  String _id;
  String _titulo;
  String _descricao;
  String _preco;

  Note(this._id, this._titulo, this._descricao, this._preco);

  Note.map(dynamic obj) {
    this._id = obj['id'];
    this._titulo = obj['titulo'];
    this._descricao = obj['descricao'];
    this._preco = obj['preco'];
  }

  String get id => _id;
  String get titulo => _titulo;
  String get descricao => _descricao;
  String get preco => _preco;

  Note.fromSnapshot(DataSnapshot snapshot) {
    _id = snapshot.key;
    _titulo = snapshot.value['titulo'];
    _descricao = snapshot.value['descricao'];
    _preco = snapshot.value['preco'];
  }
}

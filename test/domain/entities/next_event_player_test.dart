// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_test/flutter_test.dart';

class NextEventPlayer {
  final String id;
  final String name;
  final String initals;
  final String? photo;
  final String? position;
  final bool isConfirmed;
  final DateTime? confirmationDate;

  const NextEventPlayer._({
    required this.id,
    required this.name,
    required this.isConfirmed,
    required this.initals,
    this.photo,
    this.position,
    this.confirmationDate,
  });

  factory NextEventPlayer.fromName({
    required String id,
    required String name,
    required bool isConfirmed,
    String? photo,
    String? position,
    DateTime? confirmationDate,
  }) {
    return NextEventPlayer._(
      id: id,
      name: name,
      initals: _getInitials(name),
      isConfirmed: isConfirmed,
      photo: photo,
      position: position,
      confirmationDate: confirmationDate,
    );
  }

  static String _getInitials(String name) {
    final names = name.toUpperCase().split(' ');
    final firstChar = names.first[0];
    final lastChar = names.last[names.length == 1 ? 1 : 0];
    return '$firstChar$lastChar';
  }
}

// SUT = System Under Test ou OUT = Object Under Test

void main() {
  String initialsOf(String name) =>
      NextEventPlayer.fromName(id: '', name: name, isConfirmed: true).initals;
  test('should return the first letter of the first and last names', () {
    expect(initialsOf('Rodrigo Leme'), 'RL');
    expect(initialsOf('Pedro Carvalho'), 'PC');
    expect(initialsOf('Ingrid Mota da Silva'), 'IS');
  });

  test('should return the first letters name', () {
    expect(initialsOf('Rodrigo'), 'RO');
  });

  test('should convert to uppercase', () {
    expect(initialsOf('rodrigo leme'), 'RL');
    expect(initialsOf('rodrigo'), 'RO');
  });
}

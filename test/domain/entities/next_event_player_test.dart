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

  const NextEventPlayer({
    required this.id,
    required this.name,
    required this.isConfirmed,
    this.initals = '',
    this.photo,
    this.position,
    this.confirmationDate,
  });

  NextEventPlayer copyWith({
    String? id,
    String? name,
    String? initals,
    String? photo,
    String? position,
    bool? isConfirmed,
    DateTime? confirmationDate,
  }) {
    return NextEventPlayer(
      id: id ?? this.id,
      name: name ?? this.name,
      initals: initals ?? _getInitials(),
      photo: photo ?? this.photo,
      position: position ?? this.position,
      isConfirmed: isConfirmed ?? this.isConfirmed,
      confirmationDate: confirmationDate ?? this.confirmationDate,
    );
  }

  String _getInitials() {
    final names = name.split(' ');
    final firstChar = names.first[0];
    final lastChar = names.last[0];
    return '$firstChar$lastChar';
  }
}

// SUT = System Under Test ou OUT = Object Under Test

void main() {
  String initialsOf(String name) =>
      NextEventPlayer(id: '', name: name, isConfirmed: true).copyWith().initals;
  test('should return the first letter of the first and last names', () {
    expect(initialsOf('Rodrigo Leme'), 'RL');
    expect(initialsOf('Pedro Carvalho'), 'PC');
    expect(initialsOf('Ingrid Mota da Silva'), 'IS');
  });
}

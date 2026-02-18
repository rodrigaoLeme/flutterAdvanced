import 'package:flutter_advanced/domain/entities/next_event_player.dart';

import 'package:flutter_test/flutter_test.dart';

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
    expect(initialsOf('R'), 'R');
  });

  test('should convert to uppercase', () {
    expect(initialsOf('rodrigo leme'), 'RL');
    expect(initialsOf('rodrigo'), 'RO');
    expect(initialsOf('r'), 'R');
  });

  test('should retun with no name', () {
    expect(initialsOf(''), '-');
  });

  test('should ignore extra whitespaces', () {
    expect(initialsOf('Rodrigo Leme '), 'RL');
    expect(initialsOf('Rodrigo  Leme '), 'RL');
    expect(initialsOf('  Rodrigo  Leme '), 'RL');
    expect(initialsOf(' rodrigo '), 'RO');
    expect(initialsOf(' r '), 'R');
    expect(initialsOf('  '), '-');
  });
}

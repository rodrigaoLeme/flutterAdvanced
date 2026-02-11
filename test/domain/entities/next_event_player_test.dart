import 'package:flutter_test/flutter_test.dart';

class NextEventPlayer {
  final String id;
  final String name;
  final String? photo;
  final String? position;
  final bool isConfirmed;
  final DateTime? confirmationDate;

  const NextEventPlayer({
    required this.id,
    required this.name,
    required this.isConfirmed,
    this.photo,
    this.position,
    this.confirmationDate,
  });

  String getInitials() {
    final names = name.split(' ');
    final firstChar = names.first[0];
    final lastChar = names.last[0];
    return '$firstChar$lastChar';
  }
}

void main() {
  test('should return the first letter of the first and last names', () {
    const player = NextEventPlayer(
      id: '',
      name: 'Rodrigo Leme',
      isConfirmed: true,
    );
    expect(player.getInitials(), 'RL');

    const player2 = NextEventPlayer(
      id: '',
      name: 'Pedro Carvalho',
      isConfirmed: true,
    );
    expect(player2.getInitials(), 'PC');

    const player3 = NextEventPlayer(
      id: '',
      name: 'Ingrid Mota da Silva',
      isConfirmed: true,
    );
    expect(player3.getInitials(), 'IS');
  });
}

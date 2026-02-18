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
    late final String firstChar;
    late final String lastChar;

    final names = name.toUpperCase().trim().split(' ');

    if (names.first == '') {
      firstChar = '-';
      lastChar = '';
    } else if (names.length == 1) {
      firstChar = names.first[0];
      lastChar = (names.first.split('').length > 1) ? names.first[1] : '';
    } else {
      firstChar = names.first[0];
      lastChar = names.last[0];
    }
    return '$firstChar$lastChar';
  }
}

import 'package:flutter_advanced/domain/entities/next_event_player.dart';
import 'package:flutter_advanced/infra/types/json.dart';

class NextEventPlayerMapper {
  static List<NextEventPlayer> toList(JsonArr arr) => arr
      .map<NextEventPlayer>((player) => NextEventPlayerMapper.toObject(player))
      .toList();

  static NextEventPlayer toObject(Json json) => NextEventPlayer.fromName(
        id: json['id'],
        name: json['name'],
        position: json['position'],
        photo: json['photo'],
        confirmationDate: DateTime.tryParse(json['confirmationDate'] ?? ''),
        isConfirmed: json['isConfirmed'],
      );
}

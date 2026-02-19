import 'package:flutter_advanced/domain/entities/next_event.dart';

abstract class LoadNextEventRepository {
  Future<NextEvent> loadNextEvent({required String groupId});
}

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../notifiers /ui_state_notifier.dart';


class GameProvider {
  static final uiStateNotifier =
  NotifierProvider<UIStateNotifier, UIState>(UIStateNotifier.new);
}

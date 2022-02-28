import 'package:flutter/widgets.dart';

import '../enums/viewstate.dart';

class BaseModel extends ChangeNotifier {
  ViewState _state = ViewState.idle;

  ViewState get state => _state;

  void setState(ViewState viewState, {bool triggerListener = true}) {
    _state = viewState;
    if (triggerListener) notifyListeners();
  }
}

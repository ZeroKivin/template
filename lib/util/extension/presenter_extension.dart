// ignore_for_file: invalid_use_of_protected_member

import 'package:core_architecture/core_architecture.dart';
import 'package:flutter/material.dart';

import '../../localization/localization.dart';

extension PresenterExtension<V extends ViewWidget<IPresenter>> on Presenter<V> {
  ThemeData get theme => Theme.of(context);

  Localization get localization => Localization.of(context);
}

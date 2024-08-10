import 'package:flutter_bloc/flutter_bloc.dart';

import '../logger/logger.dart';

abstract base class LogableBloc<Event, State> extends Bloc<Event, State> {
  LogableBloc(super.initialState);

  @override
  void onEvent(Event event) {
    super.onEvent(event);

    logger.debug('$event');
  }

  @override
  void onChange(Change<State> change) {
    super.onChange(change);

    logger.debug('$change');
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);

    logger.logBlocError(runtimeType, error, stackTrace);
  }
}

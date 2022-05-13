import 'package:flutter_bloc/flutter_bloc.dart';

import 'base_state_view.dart';

class BaseListCubit<V extends Cubit>{

  late List<V> listCubit;

  @override
  void deactivate() {}

  @override
  void didChangeDependencies() {}

  @override
  void didUpdateWidgets<W>(W oldWidget) {}

  @override
  void dispose() {}

  @override
  void initState() {}
}

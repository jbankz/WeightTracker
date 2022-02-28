import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../../views/presentation/provider/weight_provider.dart';
import '../../di/injector.dart';
import '../../viewmodels/base_model.dart';

class Providers {
  static List<SingleChildWidget> getProviders = [
    ChangeNotifierProvider<BaseModel>(create: (_) => BaseModel()),
    ChangeNotifierProvider<WeightProvider>(
        create: (_) => WeightProvider(inject())),
  ];
}

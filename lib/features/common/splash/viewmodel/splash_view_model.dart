

import 'dart:async';
import 'package:provider/provider.dart';
import 'package:tunzaatest/core/base/viewmodel/base_view_model.dart';
import 'package:tunzaatest/core/extensions/app_extensions.dart';
import 'package:tunzaatest/product/manager/connectivity_manager.dart';

class SplashViewModel extends BaseViewModel {
  @override
  void init() {
    Provider.of<ConnectivityManager>(context, listen: false)
        .startConnectivity();
    Timer(context.durationNormal, goToOnBoard);
  }
}

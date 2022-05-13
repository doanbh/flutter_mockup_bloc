import 'package:flutter/material.dart';
import 'package:flutter_mockup_bloc/app.dart';
import 'package:flutter_mockup_bloc/di/environments.dart';
import 'package:flutter_mockup_bloc/di/injectable.dart';
import 'package:flutter_mockup_bloc/main_common.dart';
import 'package:flutter_mockup_bloc/utils/env/flavor_config.dart';
import 'package:sp_util/sp_util.dart';

Future<void> main() async {
  await wrapMain(() async {
    const values = FlavorValues(
      baseUrl: 'https://jsonplaceholder.typicode.com/',
      logNetworkInfo: true,
      showFullErrorMessages: true,
    );
    FlavorConfig(
      flavor: Flavor.dev,
      name: 'DEV',
      color: Colors.red,
      values: values,
    );
    // ignore: avoid_print
    print('Starting app from main.dart');
    await configureDependencies(Environments.dev);
    await SpUtil.getInstance();

    runApp(MyApp());
  });
}
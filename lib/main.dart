import 'package:flutter/material.dart';
import 'package:sample/theme/style.dart';
import 'package:sample/routes.dart';
import 'package:sample/bloc/bloc-prov-tree.dart';
import 'package:sample/bloc/bloc-prov.dart';
import 'package:sample/blocs/blocs.dart';
import 'blocs/blocs.dart';

void main() {
  runApp(ExampleApp());
}

class ExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProviderTree(
      blocProviders: <BlocProvider>[
        BlocProvider<AuthBloc>(bloc: AuthBloc()),
        BlocProvider<PrefBloc>(bloc: PrefBloc()),
      ],
      child: MaterialApp(
        title: 'ExampleApp',
        theme: appTheme(),
        initialRoute: '/',
        routes: routes,
      ),
    );
  }
}

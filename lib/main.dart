import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go/src/core/core.dart';
import 'package:go/src/features/features.dart';

void main() {
  runApp(const GoApp());
}

class GoApp extends StatelessWidget {
  const GoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guia de Motéis GO',
      theme: GoTheme.theme,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: TextScaler.linear(1),
          ),
          child: child!,
        );
      },
      home: BlocProvider(
        create: (_) {
          final datasource = HomeDatasourceImpl(httpClient: http.Client());
          final repository = HomeRepositoryImpl(datasource: datasource);
          final usecase = GetMotelListUsecase(repository: repository);
          return HomeController(getMotelListUsecase: usecase);
        },
        child: HomePage(),
      ),
    );
  }
}

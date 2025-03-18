import 'package:flutter/material.dart';
import 'package:yafsa/yafsa/presentation/feature/root/bloc/root_event.dart';

import 'bloc/root_bloc.dart';

class RootView extends StatefulWidget {
  const RootView({super.key});

  @override
  State<RootView> createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  final _rootBloc = RootBloc();

  @override
  void initState() {
    _rootBloc.context = context;
    _rootBloc.add(LoadRootEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container();
  }
}

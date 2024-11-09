import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

final class BaseView<T extends Store> extends StatefulWidget {
  const BaseView({
    super.key,
    required this.onPageBuilder,
    required this.onModelReady,
    this.onDispose,
    required this.viewModel,
  });

  final Widget Function(BuildContext context, T value) onPageBuilder;
  final void Function(T model) onModelReady;
  final VoidCallback? onDispose;
  final T viewModel;

  @override
  State<BaseView<T>> createState() => _BaseViewState<T>();
}

final class _BaseViewState<T extends Store> extends State<BaseView<T>> {
  late T model;

  @override
  void initState() {
    super.initState();

    model = widget.viewModel;
    widget.onModelReady(model);
  }

  @override
  void dispose() {
    super.dispose();

    widget.onDispose?.call();
  }

  @override
  Widget build(BuildContext context) {
    return widget.onPageBuilder(context, model);
  }
}

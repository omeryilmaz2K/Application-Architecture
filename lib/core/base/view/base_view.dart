import 'package:flutter/material.dart';

class BaseView<T> extends StatefulWidget {
  const BaseView({
    super.key,
    required this.viewModel,
    required this.onPageBuilder,
    required this.onModelReady,
    required this.onDispose,
  });

  final T viewModel;
  final Function(BuildContext context, T viewModel) onPageBuilder;
  final Function(T model) onModelReady;
  final VoidCallback onDispose;

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  @override
  void initState() {
    super.initState();

    widget.onModelReady(widget.viewModel);
  }

  @override
  void dispose() {
    super.dispose();

    widget.onDispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.onPageBuilder(
      context,
      widget.viewModel,
    );
  }
}

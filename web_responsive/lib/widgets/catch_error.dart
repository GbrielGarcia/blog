import 'package:flutter/material.dart';

class CatchErrorBuilder<T> extends StatelessWidget {
  const CatchErrorBuilder({
    required this.snapshot,
    required this.builder,
    super.key,
    this.loading,
    this.error,
  });

  final AsyncSnapshot<T> snapshot;

  final Widget? loading;
  final Widget? error;

  final Widget Function(T data) builder;

  @override
  Widget build(BuildContext context) {
    if (snapshot.hasError) {
      return error ?? const Center(child: Text('Something went wrong'));
    }

    if (snapshot.connectionState == ConnectionState.waiting) {
      return loading ?? const _Loading();
    }

    return snapshot.data != null
        ? builder.call(snapshot.data as T)
        : const _Loading();
  }
}

class _Loading extends StatelessWidget {
  const _Loading();

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator.adaptive());
  }
}

import 'package:flutter/material.dart';
import 'package:mercatos/components/widgets/loading_widget.dart';

enum XyStatus {
  loading,
  loaded,
  error,
}

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key, required this.status}) : super(key: key);

  final XyStatus status;

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case XyStatus.loading:
        return _loading();
      case XyStatus.loaded:
        return _done();
      case XyStatus.error:
        return _error();
    }
  }

  Widget _loading() {
    return const LoadingWidget();
  }

  Widget _done() {
    return const Center(child: Text('Done'));
  }

  Widget _error() {
    return const Center(child: Text('Error'));
  }
}

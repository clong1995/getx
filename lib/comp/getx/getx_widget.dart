import 'package:flutter/material.dart';

class GetxWidget extends StatefulWidget {
  final Widget Function() builder;
  final void Function(void Function() update) onInit;

  const GetxWidget({
    Key? key,
    required this.builder,
    required this.onInit,
  }) : super(key: key);

  @override
  State<GetxWidget> createState() => _GetxWidgetState();
}

class _GetxWidgetState extends State<GetxWidget> {
  @override
  void initState() {
    super.initState();
    widget.onInit(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) => widget.builder();
}

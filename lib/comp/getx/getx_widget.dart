import 'package:flutter/material.dart';

class _GetxNotification extends Notification {}

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
  final _GetxNotification notification = _GetxNotification();

  late BuildContext builderContext;

  @override
  void initState() {
    super.initState();
    widget.onInit(() => notification.dispatch(builderContext));
    //WidgetsBinding.instance.addPostFrameCallback();
  }



  @override
  Widget build(BuildContext context) {
    return NotificationListener<_GetxNotification>(
      child: Builder(builder: (BuildContext context) {
        builderContext = context;
        return widget.builder();
      }),
      // child: widget.builder(),
      onNotification: (_GetxNotification notification) {
        setState(() {});
        //止冒泡
        return true;
      },
    );
  }
}

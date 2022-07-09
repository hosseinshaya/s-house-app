import 'package:flutter/material.dart';

class Modal extends StatelessWidget {
  const Modal(
      {required this.child,
      this.margin,
      this.borderRadius,
      this.constraints,
      Key? key})
      : super(key: key);

  final Widget child;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsets? margin;
  final BoxConstraints? constraints;

  @override
  Widget build(BuildContext context) => Container(
      padding: MediaQuery.of(context).viewInsets,
      margin: margin ?? const EdgeInsets.fromLTRB(12, 12, 12, 15),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: borderRadius ?? BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 10,
              offset: const Offset(0, 4),
              spreadRadius: 5),
        ],
      ),
      constraints: constraints,
      child: SingleChildScrollView(
        child: child,
      ));
}


import 'package:flutter/material.dart';

class TemplateScreen extends StatefulWidget {
 final Widget child;
   TemplateScreen(this.child) ;

  @override
  State<TemplateScreen> createState() => _TemplateScreenState();
}

class _TemplateScreenState extends State<TemplateScreen> {
  String? dropdownValue;

  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  final dateController = TextEditingController();
  final validateController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed
    nameController.dispose();
    dateController.dispose();
    validateController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(28),
              topRight: Radius.circular(28))),
      child: widget.child,
    );
  }
}

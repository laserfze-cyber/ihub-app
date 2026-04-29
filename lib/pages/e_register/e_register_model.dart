import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'e_register_widget.dart' show ERegisterWidget;
import 'package:flutter/material.dart';

class ERegisterModel extends FlutterFlowModel<ERegisterWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField1 widget.
  FocusNode? textField1FocusNode;
  TextEditingController? textField1TextController;
  String? Function(BuildContext, String?)? textField1TextControllerValidator;
  String? _textField1TextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'k5eljs5u' /* Enter your email address is re... */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for TextField2 widget.
  FocusNode? textField2FocusNode;
  TextEditingController? textField2TextController;
  late bool textField2Visibility;
  String? Function(BuildContext, String?)? textField2TextControllerValidator;
  String? _textField2TextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'm3msazpw' /* Enter your password is require... */,
      );
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    textField1TextControllerValidator = _textField1TextControllerValidator;
    textField2Visibility = false;
    textField2TextControllerValidator = _textField2TextControllerValidator;
  }

  @override
  void dispose() {
    textField1FocusNode?.dispose();
    textField1TextController?.dispose();

    textField2FocusNode?.dispose();
    textField2TextController?.dispose();
  }
}

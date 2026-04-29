import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/index.dart';
import 'k_admin_widget.dart' show KAdminWidget;
import 'package:flutter/material.dart';

class KAdminModel extends FlutterFlowModel<KAdminWidget> {
  ///  Local state fields for this page.

  DateTime? datepicker1;

  DateTime? datepicker2;

  String? remainingtime;

  ///  State fields for stateful widgets in this page.

  final formKey2 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // State field(s) for TextField1 widget.
  FocusNode? textField1FocusNode;
  TextEditingController? textField1TextController;
  String? Function(BuildContext, String?)? textField1TextControllerValidator;
  InstantTimer? instantTimer;
  // State field(s) for Switch widget.
  bool? switchValue1;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  String? _textController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'us3pqnoc' /* TextField is required */,
      );
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  String? _textController3Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'eaghmwyh' /* TextField is required */,
      );
    }

    return null;
  }

  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode5;
  TextEditingController? textController6;
  String? Function(BuildContext, String?)? textController6Validator;
  String? _textController6Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '2q84dpf6' /* Specialist is required */,
      );
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode6;
  TextEditingController? textController7;
  String? Function(BuildContext, String?)? textController7Validator;
  String? _textController7Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '0mv8cya0' /* Details is required */,
      );
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode7;
  TextEditingController? textController8;
  String? Function(BuildContext, String?)? textController8Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode8;
  TextEditingController? textController9;
  String? Function(BuildContext, String?)? textController9Validator;
  bool isDataUploading_uploadData79y = false;
  FFUploadedFile uploadedLocalFile_uploadData79y =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // Stores action output result for [Backend Call - API (UploadImageToDomain)] action in Container1 widget.
  ApiCallResponse? apiResultpes;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode9;
  TextEditingController? textController10;
  String? Function(BuildContext, String?)? textController10Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode10;
  TextEditingController? textController11;
  String? Function(BuildContext, String?)? textController11Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode11;
  TextEditingController? textController12;
  String? Function(BuildContext, String?)? textController12Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode12;
  TextEditingController? textController13;
  String? Function(BuildContext, String?)? textController13Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode13;
  TextEditingController? textController14;
  String? Function(BuildContext, String?)? textController14Validator;
  DateTime? datePicked3;
  DateTime? datePicked4;
  // State field(s) for Switch widget.
  bool? switchValue2;
  bool isDataUploading_uploadData79Z = false;
  FFUploadedFile uploadedLocalFile_uploadData79Z =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // Stores action output result for [Backend Call - API (UploadImageToDomain)] action in Container14 widget.
  ApiCallResponse? pOSTImage;

  @override
  void initState(BuildContext context) {
    textController2Validator = _textController2Validator;
    textController3Validator = _textController3Validator;
    textController6Validator = _textController6Validator;
    textController7Validator = _textController7Validator;
  }

  @override
  void dispose() {
    textField1FocusNode?.dispose();
    textField1TextController?.dispose();

    instantTimer?.cancel();
    textFieldFocusNode1?.dispose();
    textController2?.dispose();

    textFieldFocusNode2?.dispose();
    textController3?.dispose();

    textFieldFocusNode3?.dispose();
    textController4?.dispose();

    textFieldFocusNode4?.dispose();
    textController5?.dispose();

    textFieldFocusNode5?.dispose();
    textController6?.dispose();

    textFieldFocusNode6?.dispose();
    textController7?.dispose();

    textFieldFocusNode7?.dispose();
    textController8?.dispose();

    textFieldFocusNode8?.dispose();
    textController9?.dispose();

    textFieldFocusNode9?.dispose();
    textController10?.dispose();

    textFieldFocusNode10?.dispose();
    textController11?.dispose();

    textFieldFocusNode11?.dispose();
    textController12?.dispose();

    textFieldFocusNode12?.dispose();
    textController13?.dispose();

    textFieldFocusNode13?.dispose();
    textController14?.dispose();
  }
}

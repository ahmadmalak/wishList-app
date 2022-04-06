import 'package:flutter/cupertino.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';


void nativePopUp(
    { required BuildContext context,
      required VoidCallback onConfirm,
      required VoidCallback onCancel,
      required String title,
      required String content,
      String confirmButtonActionName='',bool iosIsDefaultAction=false,
      String rejectButtonActionName=''}) {
  showPlatformDialog(
    context: context,
    builder: (context) => BasicDialogAlert(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        BasicDialogAction(
          title: Text(rejectButtonActionName),
          onPressed: onCancel,
          iosIsDefaultAction: iosIsDefaultAction,
        ),
        BasicDialogAction(
            title: Text(confirmButtonActionName), onPressed: onConfirm),
      ],
    ),
  );
}

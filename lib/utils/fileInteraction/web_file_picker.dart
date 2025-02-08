// ignore_for_file: use_build_context_synchronously

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:ecodesk_flutter/models/attachment.dart';
import 'package:ecodesk_flutter/utils/fileInteraction/upload_file.dart';
import 'package:ecodesk_flutter/widgets/widgets.dart';

Future<void> webFilePicker({
  required BuildContext context,
  required Function onUploadSuccess,
  required SendMessage widget,
}) async {
  try {
    var picked = await FilePicker.platform.pickFiles();

    if (picked?.files.first.bytes != null) {
      Alert.show(
        widget.props.translations.attachmentUploadingText,
        context,
        textStyle: widget.props.style.chatUploadingAlertTextStyle ??
            Theme.of(context).textTheme.bodyMedium,
        backgroundColor: widget.props.style.chatUploadingAlertBackgroundColor ??
            BottomAppBarTheme.of(context).color!,
        gravity: Alert.bottom,
        duration: Alert.lengthLong,
      );
      List<EcodeskAttachment> attachments = await uploadFile(
        widget.props,
        fileBytes: picked!.files.first.bytes,
        fileName: picked.files.first.name,
      );
      onUploadSuccess(attachments);
    }
  } on Exception catch (_) {
    Alert.show(
      widget.props.translations.attachmentUploadErrorText,
      context,
      textStyle: widget.props.style.chatUploadErrorAlertTextStyle ??
          Theme.of(context).textTheme.bodyMedium,
      backgroundColor: widget.props.style.chatUploadErrorAlertBackgroundColor ??
          BottomAppBarTheme.of(context).color!,
      gravity: Alert.bottom,
      duration: Alert.lengthLong,
    );
  }
}

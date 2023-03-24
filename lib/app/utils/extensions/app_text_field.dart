import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music_download_youtube/app/theme/app_colors.dart';
import 'package:music_download_youtube/app/utils/app_common.dart';
import 'package:music_download_youtube/app/utils/app_constants.dart';
import 'package:music_download_youtube/app/utils/app_decoration.dart';
import 'package:music_download_youtube/app/utils/app_text_style.dart';
import 'package:music_download_youtube/app/utils/extensions/int_extensions.dart';
import 'package:music_download_youtube/app/utils/extensions/string_extensions.dart';
import 'package:music_download_youtube/app/utils/extensions/widget_extensions.dart';
import 'package:music_download_youtube/r.dart';
import 'package:sizer/sizer.dart';

enum TextFieldType {
  // ignore: constant_identifier_names
  EMAIL,
  // ignore: constant_identifier_names
  PASSWORD,
  // ignore: constant_identifier_names
  NAME,
  // ignore: constant_identifier_names
  ADDRESS,
  // ignore: constant_identifier_names
  OTHER,
  // ignore: constant_identifier_names
  PHONE,
  // ignore: constant_identifier_names
  URL,
  // ignore: constant_identifier_names
  USERNAME
}

/// Default Text Form Field
class AppTextField extends StatefulWidget {
  final TextEditingController? controller;
  final TextFieldType textFieldType;

  final InputDecoration? decoration;
  final FocusNode? focus;
  final FormFieldValidator<String>? validator;
  final bool? isPassword;
  final bool? isValidationRequired;
  final TextCapitalization? textCapitalization;
  final TextInputAction? textInputAction;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onChanged;
  final FocusNode? nextFocus;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final int? maxLines;
  final int? minLines;
  final bool? enabled;
  final bool? autoFocus;
  final bool? readOnly;
  final bool? enableSuggestions;
  final int? maxLength;
  final Color? cursorColor;
  final Widget? suffix;
  final Color? suffixIconColor;
  final TextInputType? keyboardType;
  final Iterable<String>? autoFillHints;
  final EdgeInsets? scrollPadding;
  final double? cursorWidth;
  final double? cursorHeight;
  final Function()? onTap;
  final InputCounterWidgetBuilder? buildCounter;
  final List<TextInputFormatter>? inputFormatters;
  final TextAlignVertical? textAlignVertical;
  final bool? expands;
  final bool? showCursor;
  final TextSelectionControls? selectionControls;
  final StrutStyle? strutStyle;
  final String? obscuringCharacter;
  final String? initialValue;
  final String? labelText;
  final Brightness? keyboardAppearance;
  final ToolbarOptions? toolbarOptions;

  final String? errorThisFieldRequired;
  final String? errorInvalidEmail;
  final String? errorMinimumPasswordLength;
  final String? errorInvalidURL;
  final String? errorInvalidUsername;
  final EdgeInsetsGeometry? contentPadding;

  const AppTextField(
      {super.key,
      this.controller,
      required this.textFieldType,
      this.decoration,
      this.focus,
      this.validator,
      this.isPassword,
      this.buildCounter,
      this.isValidationRequired,
      this.textCapitalization,
      this.textInputAction,
      this.onFieldSubmitted,
      this.nextFocus,
      this.textStyle,
      this.textAlign,
      this.maxLines,
      this.minLines,
      this.enabled,
      this.onChanged,
      this.cursorColor,
      this.suffix,
      this.suffixIconColor,
      this.enableSuggestions,
      this.autoFocus,
      this.readOnly,
      this.maxLength,
      this.keyboardType,
      this.autoFillHints,
      this.scrollPadding,
      this.onTap,
      this.cursorWidth,
      this.cursorHeight,
      this.inputFormatters,
      this.errorThisFieldRequired,
      this.errorInvalidEmail,
      this.errorMinimumPasswordLength,
      this.errorInvalidURL,
      this.errorInvalidUsername,
      this.textAlignVertical,
      this.expands,
      this.showCursor,
      this.selectionControls,
      this.strutStyle,
      this.obscuringCharacter,
      this.initialValue,
      this.keyboardAppearance,
      this.toolbarOptions,
      this.contentPadding,
      this.labelText});

  @override
  // ignore: library_private_types_in_public_api
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool isPasswordVisible = false;

  FormFieldValidator<String>? applyValidation() {
    if (widget.isValidationRequired.validate(value: true)) {
      if (widget.validator != null) {
        return widget.validator;
      } else if (widget.textFieldType == TextFieldType.EMAIL) {
        return (s) {
          if (s!.trim().isEmpty) {
            return widget.errorThisFieldRequired
                .validate(value: errorThisFieldRequired);
          }
          if (!s.trim().validateEmail()) {
            return widget.errorInvalidEmail.validate(value: "Email is invalid");
          }
          return null;
        };
      } else if (widget.textFieldType == TextFieldType.PASSWORD) {
        return (s) {
          if (s!.trim().isEmpty) {
            return widget.errorThisFieldRequired
                .validate(value: errorThisFieldRequired);
          }

          if (!s.trim().uppercasePass()) {
            return widget.errorMinimumPasswordLength
                .validate(value: "Password Must include uppercase");
          }

          if (!s.trim().lowercasePass()) {
            return widget.errorMinimumPasswordLength
                .validate(value: "Password Must include lowercase");
          }

          if (!s.trim().specialCharacterPass()) {
            return widget.errorMinimumPasswordLength
                .validate(value: "Password Must include special characters");
          }

          if (!s.trim().oneDigitPass()) {
            return widget.errorMinimumPasswordLength
                .validate(value: "Password Must include digit");
          }

          if (s.trim().length < passwordLengthGlobal) {
            return widget.errorMinimumPasswordLength.validate(
                value:
                    'Minimum password length should be $passwordLengthGlobal');
          }
          return null;
        };
      } else if (widget.textFieldType == TextFieldType.NAME ||
          widget.textFieldType == TextFieldType.PHONE) {
        return (s) {
          if (s!.trim().isEmpty) {
            return widget.errorThisFieldRequired
                .validate(value: errorThisFieldRequired);
          }

          return null;
        };
      } else if (widget.textFieldType == TextFieldType.URL) {
        return (s) {
          if (s!.trim().isEmpty) {
            return widget.errorThisFieldRequired
                .validate(value: errorThisFieldRequired);
          }
          if (!s.validateURL()) {
            return widget.errorInvalidURL.validate(value: 'Invalid URL');
          }
          return null;
        };
      } else if (widget.textFieldType == TextFieldType.USERNAME) {
        return (s) {
          if (s!.trim().isEmpty) {
            return widget.errorThisFieldRequired
                .validate(value: errorThisFieldRequired);
          }
          if (s.contains(' ')) {
            return widget.errorInvalidUsername
                .validate(value: 'Username should not contain space');
          }
          return null;
        };
      } else if (widget.textFieldType == TextFieldType.ADDRESS) {
        return (s) {
          if (s!.trim().isEmpty) {
            return widget.errorThisFieldRequired
                .validate(value: errorThisFieldRequired);
          }
          return null;
        };
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  TextCapitalization applyTextCapitalization() {
    if (widget.textCapitalization != null) {
      return widget.textCapitalization!;
    } else if (widget.textFieldType == TextFieldType.NAME) {
      return TextCapitalization.words;
    } else if (widget.textFieldType == TextFieldType.ADDRESS) {
      return TextCapitalization.sentences;
    } else {
      return TextCapitalization.none;
    }
  }

  TextInputAction? applyTextInputAction() {
    if (widget.textInputAction != null) {
      return widget.textInputAction;
    } else if (widget.textFieldType == TextFieldType.ADDRESS) {
      return TextInputAction.newline;
    } else if (widget.nextFocus != null) {
      return TextInputAction.next;
    } else {
      return TextInputAction.done;
    }
  }

  TextInputType? applyTextInputType() {
    if (widget.keyboardType != null) {
      return widget.keyboardType;
    } else if (widget.textFieldType == TextFieldType.EMAIL) {
      return TextInputType.emailAddress;
    } else if (widget.textFieldType == TextFieldType.ADDRESS) {
      return TextInputType.multiline;
    } else if (widget.textFieldType == TextFieldType.PASSWORD) {
      return TextInputType.visiblePassword;
    } else if (widget.textFieldType == TextFieldType.PHONE) {
      return TextInputType.number;
    } else if (widget.textFieldType == TextFieldType.URL) {
      return TextInputType.url;
    } else {
      return TextInputType.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText.validate(),
          style: boldTextStyle(),
        ).visible(widget.labelText != null),
        2.h.height.visible(widget.labelText != null),
        TextFormField(
          controller: widget.controller,
          obscureText: widget.textFieldType == TextFieldType.PASSWORD &&
              !isPasswordVisible,
          validator: applyValidation(),
          textCapitalization: applyTextCapitalization(),
          textInputAction: applyTextInputAction(),
          onFieldSubmitted: (s) {
            if (widget.nextFocus != null) {
              FocusScope.of(context).requestFocus(widget.nextFocus);
            }

            if (widget.onFieldSubmitted != null) {
              widget.onFieldSubmitted!.call(s);
            }
          },
          keyboardType: applyTextInputType(),
          decoration: widget.decoration != null
              ? (widget.decoration!.copyWith(
                  contentPadding: widget.contentPadding ??
                      EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
                  suffixIconConstraints: BoxConstraints.tight(Size(11.w, 8.w)),
                  suffixIcon: widget.textFieldType == TextFieldType.PASSWORD
                      ? widget.suffix ??
                          SvgPicture.asset(
                            isPasswordVisible
                                ? MainAssets.ic_eye_on
                                : MainAssets.ic_eye_off,
                            width: 2.w,
                            color: widget.suffixIconColor ??
                                Theme.of(context).iconTheme.color,
                          ).
                              // Icon(
                              //   isPasswordVisible
                              //       ? Icons.visibility
                              //       : Icons.visibility_off,
                              //   color: widget.suffixIconColor ??
                              //       Theme.of(context).iconTheme.color,
                              // ).
                              onTap(() {
                            isPasswordVisible = !isPasswordVisible;

                            setState(() {});
                          })
                      : widget.suffix,
                ))
              : const InputDecoration(),
          focusNode: widget.focus,
          style: widget.textStyle ?? primaryTextStyle(color: textPrimaryColor),
          textAlign: widget.textAlign ?? TextAlign.start,
          maxLines: widget.textFieldType == TextFieldType.ADDRESS
              ? null
              : widget.maxLines.validate(value: 1),
          minLines: widget.minLines.validate(value: 1),
          autofocus: widget.autoFocus ?? false,
          enabled: widget.enabled,
          onChanged: widget.onChanged,
          cursorColor: widget.cursorColor ??
              Theme.of(context).textSelectionTheme.cursorColor,
          readOnly: widget.readOnly.validate(),
          maxLength: widget.maxLength,
          enableSuggestions: widget.enableSuggestions.validate(value: true),
          autofillHints: widget.autoFillHints,
          scrollPadding: widget.scrollPadding ?? const EdgeInsets.all(20),
          cursorWidth: widget.cursorWidth.validate(value: 2.0),
          cursorHeight: widget.cursorHeight,
          cursorRadius: radiusCircular(4),
          onTap: widget.onTap,
          buildCounter: widget.buildCounter,
          scrollPhysics: const BouncingScrollPhysics(),
          enableInteractiveSelection: true,
          inputFormatters: widget.inputFormatters,
          textAlignVertical: widget.textAlignVertical,
          expands: widget.expands.validate(),
          showCursor: widget.showCursor,
          selectionControls: widget.selectionControls,
          strutStyle: widget.strutStyle,
          obscuringCharacter: widget.obscuringCharacter.validate(value: '•'),
          initialValue: widget.initialValue,
          keyboardAppearance: widget.keyboardAppearance,
          toolbarOptions: widget.toolbarOptions,
        ),
      ],
    );
  }
}

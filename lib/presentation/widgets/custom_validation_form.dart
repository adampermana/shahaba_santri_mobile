import 'package:flutter/material.dart';

class ValidationWidget<T> extends FormField<T> {
  ValidationWidget({
    required Widget child,
    super.key,
    super.initialValue,
    super.autovalidateMode,
    super.validator,
  }) : super(
         builder: (state) {
           return Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               child,
               if (state.hasError && state.errorText != null)
                 const SizedBox(height: 8),
               if (state.hasError && state.errorText != null)
                 Text(
                   state.errorText!,
                   style: const TextStyle(
                     color: Color.fromARGB(255, 186, 40, 40),
                   ),
                 ),
             ],
           );
         },
       );
}

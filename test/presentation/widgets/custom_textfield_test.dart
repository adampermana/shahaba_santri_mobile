import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/widgets/custom_textfield.dart';

// ─── Helper ──────────────────────────────────────────────────────────────────

/// Wrap in a Form so validators can be triggered via Form.validate()
Widget _form({required Widget child, GlobalKey<FormState>? formKey}) =>
    MaterialApp(
      home: Scaffold(
        body: Form(
          key: formKey,
          child: child,
        ),
      ),
    );

Widget _app(Widget child) =>
    MaterialApp(home: Scaffold(body: child));

// ─── CustomTextFormFieldWidget ────────────────────────────────────────────────

void main() {
  group('CustomTextFormFieldWidget', () {
    // ── Rendering ──────────────────────────────────────────────────────────

    testWidgets('renders TextFormField with hintText', (tester) async {
      await tester.pumpWidget(_app(
        const CustomTextFormFieldWidget(hintText: 'Masukkan nama'),
      ));

      expect(find.byType(TextFormField), findsOneWidget);
      expect(find.text('Masukkan nama'), findsOneWidget);
    });

    testWidgets('renders labelText above input', (tester) async {
      await tester.pumpWidget(_app(
        const CustomTextFormFieldWidget(labelText: 'Nama Lengkap'),
      ));

      expect(find.text('Nama Lengkap'), findsOneWidget);
    });

    testWidgets('renders label with required marker " *" when requiredMarking=true',
        (tester) async {
      await tester.pumpWidget(_app(
        const CustomTextFormFieldWidget(
          labelText: 'Email',
          requiredMarking: true,
        ),
      ));

      // Text.rich renders 'Email' and ' *' as TextSpan
      expect(find.textContaining('Email'), findsOneWidget);
      expect(find.textContaining(' *'), findsOneWidget);
    });

    testWidgets('renders prefixIcon when provided', (tester) async {
      await tester.pumpWidget(_app(
        const CustomTextFormFieldWidget(
          prefixIcon: Icon(Icons.person, key: Key('prefix_icon')),
        ),
      ));

      expect(find.byKey(const Key('prefix_icon')), findsOneWidget);
    });

    testWidgets('renders suffixIcon when provided', (tester) async {
      await tester.pumpWidget(_app(
        const CustomTextFormFieldWidget(
          suffixIcon: Icon(Icons.info, key: Key('suffix_icon')),
        ),
      ));

      expect(find.byKey(const Key('suffix_icon')), findsOneWidget);
    });

    // ── initialValue ──────────────────────────────────────────────────────

    testWidgets('populates initialValue when no controller given', (tester) async {
      await tester.pumpWidget(_app(
        const CustomTextFormFieldWidget(initialValue: 'Hello World'),
      ));

      expect(find.text('Hello World'), findsOneWidget);
    });

    // ── onChanged ─────────────────────────────────────────────────────────

    testWidgets('calls onChanged when user types', (tester) async {
      String? changed;
      final controller = TextEditingController();
      await tester.pumpWidget(_app(
        CustomTextFormFieldWidget(
          controller: controller,
          onChanged: (v) => changed = v,
        ),
      ));

      await tester.enterText(find.byType(TextFormField), 'test input');
      expect(changed, 'test input');
      controller.dispose();
    });

    // ── onTap ─────────────────────────────────────────────────────────────

    testWidgets('calls onTap when field is tapped', (tester) async {
      bool tapped = false;
      await tester.pumpWidget(_app(
        CustomTextFormFieldWidget(onTap: () => tapped = true),
      ));

      await tester.tap(find.byType(TextFormField));
      expect(tapped, isTrue);
    });

    // ── clearText ─────────────────────────────────────────────────────────

    testWidgets('shows clear icon when clearText=true and text is not empty',
        (tester) async {
      final controller = TextEditingController(text: 'some text');
      await tester.pumpWidget(_app(
        CustomTextFormFieldWidget(
          controller: controller,
          clearText: true,
        ),
      ));
      await tester.pump();

      expect(find.byIcon(Icons.clear), findsOneWidget);
      controller.dispose();
    });

    testWidgets('clear icon removes text when tapped', (tester) async {
      String? changed;
      final controller = TextEditingController(text: 'some text');
      await tester.pumpWidget(_app(
        CustomTextFormFieldWidget(
          controller: controller,
          clearText: true,
          onChanged: (v) => changed = v,
        ),
      ));
      await tester.pump();

      await tester.tap(find.byIcon(Icons.clear));
      await tester.pump();

      expect(controller.text, '');
      expect(changed, '');
      controller.dispose();
    });

    testWidgets('does NOT show clear icon when clearText=false (default)',
        (tester) async {
      final controller = TextEditingController(text: 'some text');
      await tester.pumpWidget(_app(
        CustomTextFormFieldWidget(controller: controller),
      ));
      await tester.pump();

      expect(find.byIcon(Icons.clear), findsNothing);
      controller.dispose();
    });

    testWidgets('does NOT show clear icon when readOnly=true even with clearText=true',
        (tester) async {
      final controller = TextEditingController(text: 'some text');
      await tester.pumpWidget(_app(
        CustomTextFormFieldWidget(
          controller: controller,
          clearText: true,
          readOnly: true,
        ),
      ));
      await tester.pump();

      expect(find.byIcon(Icons.clear), findsNothing);
      controller.dispose();
    });

    // ── Validator ─────────────────────────────────────────────────────────

    testWidgets('shows errorText when validator returns error', (tester) async {
      final formKey = GlobalKey<FormState>();
      await tester.pumpWidget(_form(
        formKey: formKey,
        child: CustomTextFormFieldWidget(
          validator: (v) => (v == null || v.isEmpty) ? 'Wajib diisi' : null,
        ),
      ));

      formKey.currentState!.validate();
      await tester.pump();

      expect(find.text('Wajib diisi'), findsOneWidget);
    });

    testWidgets('shows passed errorText directly without validator', (tester) async {
      await tester.pumpWidget(_app(
        const CustomTextFormFieldWidget(errorText: 'Terjadi kesalahan'),
      ));

      expect(find.text('Terjadi kesalahan'), findsOneWidget);
    });

    testWidgets('shows custom error Widget when error param provided', (tester) async {
      await tester.pumpWidget(_app(
        const CustomTextFormFieldWidget(
          error: Text('Error widget', key: Key('err_widget')),
        ),
      ));

      expect(find.byKey(const Key('err_widget')), findsOneWidget);
    });

    testWidgets('asserts that error and errorText cannot both be set', (tester) async {
      expect(
        () => CustomTextFormFieldWidget(
          error: const Text('err'),
          errorText: 'also err',
        ),
        throwsAssertionError,
      );
    });

    // ── obscureText ───────────────────────────────────────────────────────

    testWidgets('text is obscured when obscureText=true', (tester) async {
      await tester.pumpWidget(_app(
        const CustomTextFormFieldWidget(
          obscureText: true,
          initialValue: 'secret',
        ),
      ));

      // obscureText is exposed on EditableText (underlying widget)
      final editableText = tester.widget<EditableText>(find.byType(EditableText));
      expect(editableText.obscureText, isTrue);
    });

    // ── maxLines / multiline ───────────────────────────────────────────────

    testWidgets('maxLines applies to TextFormField', (tester) async {
      await tester.pumpWidget(_app(
        const CustomTextFormFieldWidget(maxLines: 3, minLines: 1),
      ));

      // maxLines is accessible via EditableText
      final editableText = tester.widget<EditableText>(find.byType(EditableText));
      expect(editableText.maxLines, 3);
    });
  });

  // ─── CustomPasswordFormFieldWidget ────────────────────────────────────────

  group('CustomPasswordFormFieldWidget', () {
    testWidgets('renders password field with obscureText=true initially',
        (tester) async {
      await tester.pumpWidget(_app(
        const CustomPasswordFormFieldWidget(),
      ));

      final editableText = tester.widget<EditableText>(find.byType(EditableText));
      expect(editableText.obscureText, isTrue);
    });

    testWidgets('toggles visibility when suffix icon tapped', (tester) async {
      await tester.pumpWidget(_app(
        const CustomPasswordFormFieldWidget(
          visiblePasswordIcon: Icons.visibility,
          invisiblePasswordIcon: Icons.visibility_off,
        ),
      ));

      // Mulai: obscure, icon visibility_off
      expect(find.byIcon(Icons.visibility_off), findsOneWidget);

      // Tap toggle
      await tester.tap(find.byIcon(Icons.visibility_off));
      await tester.pump();

      // Setelah toggle: visible, icon visibility
      expect(find.byIcon(Icons.visibility), findsOneWidget);

      final editableText = tester.widget<EditableText>(find.byType(EditableText));
      expect(editableText.obscureText, isFalse);
    });

    testWidgets('shows labelText when provided', (tester) async {
      await tester.pumpWidget(_app(
        const CustomPasswordFormFieldWidget(labelText: 'Password'),
      ));

      expect(find.text('Password'), findsOneWidget);
    });

    testWidgets('shows hintText when provided', (tester) async {
      await tester.pumpWidget(_app(
        const CustomPasswordFormFieldWidget(hintText: 'Masukkan password'),
      ));

      expect(find.text('Masukkan password'), findsOneWidget);
    });

    testWidgets('calls onChanged when user types', (tester) async {
      String? changed;
      final controller = TextEditingController();
      await tester.pumpWidget(_app(
        CustomPasswordFormFieldWidget(
          controller: controller,
          onChanged: (v) => changed = v,
        ),
      ));

      await tester.enterText(find.byType(TextFormField), 'mysecret');
      expect(changed, 'mysecret');
      controller.dispose();
    });

    testWidgets('validator fires and shows error', (tester) async {
      final formKey = GlobalKey<FormState>();
      await tester.pumpWidget(_form(
        formKey: formKey,
        child: CustomPasswordFormFieldWidget(
          validator: (v) => (v == null || v.isEmpty) ? 'Wajib diisi' : null,
        ),
      ));

      formKey.currentState!.validate();
      await tester.pump();

      expect(find.text('Wajib diisi'), findsOneWidget);
    });
  });

  // ─── CustomEmailFormField ────────────────────────────────────────────────

  group('CustomEmailFormField', () {
    testWidgets('renders TextFormField with email keyboard type', (tester) async {
      await tester.pumpWidget(_app(const CustomEmailFormField()));

      // keyboardType accessible via EditableText
      final editableText = tester.widget<EditableText>(find.byType(EditableText));
      expect(editableText.keyboardType, TextInputType.emailAddress);
    });

    testWidgets('shows default hintText "Masukkan alamat email"', (tester) async {
      await tester.pumpWidget(_app(const CustomEmailFormField()));
      expect(find.text('Masukkan alamat email'), findsOneWidget);
    });

    testWidgets('shows labelText when provided', (tester) async {
      await tester.pumpWidget(_app(
        const CustomEmailFormField(labelText: 'Email'),
      ));
      expect(find.text('Email'), findsOneWidget);
    });

    testWidgets('shows required marker when requiredMarking=true', (tester) async {
      await tester.pumpWidget(_app(
        const CustomEmailFormField(
          labelText: 'Email',
          requiredMarking: true,
        ),
      ));

      expect(find.textContaining(' *'), findsOneWidget);
    });

    testWidgets('calls onChanged when user types', (tester) async {
      String? changed;
      await tester.pumpWidget(_app(
        CustomEmailFormField(onChanged: (v) => changed = v),
      ));

      await tester.enterText(find.byType(TextFormField), 'user');
      expect(changed, 'user');
    });

    // ── Default email validator ───────────────────────────────────────────

    testWidgets('default validator: shows error when email is empty', (tester) async {
      final formKey = GlobalKey<FormState>();
      await tester.pumpWidget(_form(
        formKey: formKey,
        child: const CustomEmailFormField(),
      ));

      formKey.currentState!.validate();
      await tester.pump();

      expect(find.text('Email tidak boleh kosong'), findsOneWidget);
    });

    testWidgets('default validator: shows error for invalid email format',
        (tester) async {
      final formKey = GlobalKey<FormState>();
      await tester.pumpWidget(_form(
        formKey: formKey,
        child: const CustomEmailFormField(initialValue: 'notanemail'),
      ));

      formKey.currentState!.validate();
      await tester.pump();

      expect(find.text('Format email tidak valid'), findsOneWidget);
    });

    testWidgets('default validator: passes for valid email', (tester) async {
      final formKey = GlobalKey<FormState>();
      final controller = TextEditingController(text: 'user@example.com');
      await tester.pumpWidget(_form(
        formKey: formKey,
        child: CustomEmailFormField(controller: controller),
      ));

      final isValid = formKey.currentState!.validate();
      await tester.pump();

      expect(isValid, isTrue);
      controller.dispose();
    });

    testWidgets('shows clear icon when input is not empty', (tester) async {
      final controller = TextEditingController(text: 'test@mail.com');
      await tester.pumpWidget(_app(CustomEmailFormField(controller: controller)));
      await tester.pump();

      expect(find.byIcon(Icons.clear), findsOneWidget);
      controller.dispose();
    });

    testWidgets('clear icon clears text and calls onChanged("")', (tester) async {
      String? changed;
      final controller = TextEditingController(text: 'test@mail.com');
      await tester.pumpWidget(_app(
        CustomEmailFormField(
          controller: controller,
          onChanged: (v) => changed = v,
        ),
      ));
      await tester.pump();

      await tester.tap(find.byIcon(Icons.clear));
      await tester.pump();

      expect(controller.text, '');
      expect(changed, '');
      controller.dispose();
    });

    testWidgets('does NOT show clear icon when readOnly=true', (tester) async {
      final controller = TextEditingController(text: 'test@mail.com');
      await tester.pumpWidget(_app(
        CustomEmailFormField(controller: controller, readOnly: true),
      ));
      await tester.pump();

      expect(find.byIcon(Icons.clear), findsNothing);
      controller.dispose();
    });
  });

  // ─── CustomPasswordFormField ──────────────────────────────────────────────

  group('CustomPasswordFormField', () {
    testWidgets('renders with obscureText=true initially', (tester) async {
      await tester.pumpWidget(_app(const CustomPasswordFormField()));

      final editableText = tester.widget<EditableText>(find.byType(EditableText));
      expect(editableText.obscureText, isTrue);
    });

    testWidgets('toggles password visibility on suffix icon tap', (tester) async {
      await tester.pumpWidget(_app(
        const CustomPasswordFormField(
          visiblePasswordIcon: Icons.visibility,
          invisiblePasswordIcon: Icons.visibility_off,
        ),
      ));

      expect(find.byIcon(Icons.visibility_off), findsOneWidget);

      await tester.tap(find.byIcon(Icons.visibility_off));
      await tester.pump();

      expect(find.byIcon(Icons.visibility), findsOneWidget);
      final editableText = tester.widget<EditableText>(find.byType(EditableText));
      expect(editableText.obscureText, isFalse);
    });

    testWidgets('shows labelText when provided', (tester) async {
      await tester.pumpWidget(_app(
        const CustomPasswordFormField(labelText: 'Kata Sandi'),
      ));
      expect(find.text('Kata Sandi'), findsOneWidget);
    });

    testWidgets('validator fires and shows error message', (tester) async {
      final formKey = GlobalKey<FormState>();
      await tester.pumpWidget(_form(
        formKey: formKey,
        child: CustomPasswordFormField(
          validator: (v) => (v == null || v.isEmpty) ? 'Wajib diisi' : null,
        ),
      ));

      formKey.currentState!.validate();
      await tester.pump();

      expect(find.text('Wajib diisi'), findsOneWidget);
    });
  });

  // ─── CustomPhoneFormField ────────────────────────────────────────────────

  group('CustomPhoneFormField', () {
    testWidgets('renders with phone keyboard type', (tester) async {
      await tester.pumpWidget(_app(const CustomPhoneFormField()));

      final editableText = tester.widget<EditableText>(find.byType(EditableText));
      expect(editableText.keyboardType, TextInputType.phone);
    });

    testWidgets('shows default hintText "Masukkan nomor handphone"', (tester) async {
      await tester.pumpWidget(_app(const CustomPhoneFormField()));
      expect(find.text('Masukkan nomor handphone'), findsOneWidget);
    });

    testWidgets('shows labelText when provided', (tester) async {
      await tester.pumpWidget(_app(
        const CustomPhoneFormField(labelText: 'No. HP'),
      ));
      expect(find.text('No. HP'), findsOneWidget);
    });

    testWidgets('calls onChanged when user types', (tester) async {
      String? changed;
      await tester.pumpWidget(_app(
        CustomPhoneFormField(onChanged: (v) => changed = v),
      ));

      await tester.enterText(find.byType(TextFormField), '812');
      // _IndonesianPhoneNumberFormatter may format it
      expect(changed, isNotNull);
    });

    // ── Default phone validator ───────────────────────────────────────────

    testWidgets('default validator: shows error when phone is empty', (tester) async {
      final formKey = GlobalKey<FormState>();
      await tester.pumpWidget(_form(
        formKey: formKey,
        child: const CustomPhoneFormField(),
      ));

      formKey.currentState!.validate();
      await tester.pump();

      expect(find.text('Nomor telepon tidak boleh kosong'), findsOneWidget);
    });

    testWidgets('default validator: shows error when phone is too short',
        (tester) async {
      final formKey = GlobalKey<FormState>();
      final controller = TextEditingController(text: '08');
      await tester.pumpWidget(_form(
        formKey: formKey,
        child: CustomPhoneFormField(controller: controller),
      ));

      formKey.currentState!.validate();
      await tester.pump();

      expect(
        find.text('Nomor telepon terlalu pendek, minimal 3 digit'),
        findsOneWidget,
      );
      controller.dispose();
    });

    testWidgets('default validator: passes for phone with 3+ digits', (tester) async {
      final formKey = GlobalKey<FormState>();
      final controller = TextEditingController(text: '0812');
      await tester.pumpWidget(_form(
        formKey: formKey,
        child: CustomPhoneFormField(controller: controller),
      ));

      final isValid = formKey.currentState!.validate();
      await tester.pump();

      expect(isValid, isTrue);
      controller.dispose();
    });
  });

  // ─── _IndonesianPhoneNumberFormatter (logic unit test via widget) ─────────

  group('_IndonesianPhoneNumberFormatter via CustomPhoneFormField', () {
    testWidgets('strips leading 0 and formats with (+62) prefix', (tester) async {
      String? changed;
      await tester.pumpWidget(_app(
        CustomPhoneFormField(onChanged: (v) => changed = v),
      ));

      // 0812 → valid prefix 81 → formatted as (+62) 812...
      await tester.enterText(find.byType(TextFormField), '0812');
      await tester.pump();

      expect(changed, contains('(+62)'));
    });

    testWidgets('strips leading 62 and formats with (+62) prefix', (tester) async {
      String? changed;
      await tester.pumpWidget(_app(
        CustomPhoneFormField(onChanged: (v) => changed = v),
      ));

      await tester.enterText(find.byType(TextFormField), '6281');
      await tester.pump();

      expect(changed, contains('(+62)'));
    });

    testWidgets('returns raw digits without format for invalid prefix',
        (tester) async {
      String? changed;
      await tester.pumpWidget(_app(
        CustomPhoneFormField(onChanged: (v) => changed = v),
      ));

      // prefix '12' is not in valid set — returns raw digits
      await tester.enterText(find.byType(TextFormField), '123');
      await tester.pump();

      // not formatted with (+62)
      expect(changed, isNot(contains('(+62)')));
    });
  });
}

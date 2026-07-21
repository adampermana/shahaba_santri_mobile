import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sahaba_mobile/business_logic/location/location_bloc.dart';
import 'package:sahaba_mobile/business_logic/product_form/product_form_bloc.dart';
import 'package:sahaba_mobile/injector.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/screens/camera_screen/widget/success_sheet.dart';
import 'package:sahaba_mobile/presentation/widgets/custom_validation_form.dart';

class FormSheet extends StatelessWidget {
  const FormSheet({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductFormBloc>(
      create: (context) =>
          sl<ProductFormBloc>()
            ..add(ProductFormEvent.started(image, 'UjangKedu')),
      child: BlocListener<ProductFormBloc, ProductFormState>(
        listenWhen: (previous, current) =>
            previous.isLoading != current.isLoading,
        listener: (context, state) async {
          if (!state.isLoading && state.isSuccess) {
            context.pop();
            await showModalBottomSheet<void>(
              backgroundColor: ColorPalette.scaffoldBackground,
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              builder: (_) => const SuccessSheet(),
            );
          }
        },
        child: BlocBuilder<ProductFormBloc, ProductFormState>(
          builder: (context, state) {
            if (state.isLoadingInitiate) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return ColoredBox(
                color: ColorPalette.scaffoldBackground,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        left: 24,
                        right: 24,
                        bottom: 24,
                      ),
                      child: Form(
                        key: state.formKey,
                        autovalidateMode: state.isShowErrorMessage
                            ? AutovalidateMode.always
                            : AutovalidateMode.disabled,
                        child: Column(
                          children: [
                            const SizedBox(height: 16),
                            const SizedBox(
                              width: 32,
                              height: 4,
                              child: Divider(
                                color: Color(
                                  0xFFA6A6A6,
                                ) /* semantic-content-inverse-tertiary */,
                                thickness: 2,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Masukan Detail Produk',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: ColorPalette.kWhite,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () async {
                                    final shouldClose = await showDialog<bool>(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (ctx) => Dialog(
                                        backgroundColor: Colors.transparent,
                                        child: Container(
                                          padding: const EdgeInsets.fromLTRB(
                                            24,
                                            24,
                                            24,
                                            16,
                                          ),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF0F172A),
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                            boxShadow: const [
                                              BoxShadow(
                                                color: Color(0x40000000),
                                                blurRadius: 4,
                                                offset: Offset(0, 4),
                                              ),
                                            ],
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                'Apakah Anda ingin membatalkan laporan ?',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xFFDDDDDD),
                                                ),
                                              ),
                                              const SizedBox(height: 32),
                                              SizedBox(
                                                width: double.infinity,
                                                height: 52,
                                                child: ElevatedButton(
                                                  onPressed: () => Navigator.of(
                                                    ctx,
                                                  ).pop(true),
                                                  style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        const Color(0xFFDE1135),
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            100,
                                                          ),
                                                    ),
                                                  ),
                                                  child: const Text(
                                                    'Ya',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 16),
                                              SizedBox(
                                                width: double.infinity,
                                                height: 52,
                                                child: TextButton(
                                                  onPressed: () => Navigator.of(
                                                    ctx,
                                                  ).pop(false),
                                                  child: const Text(
                                                    'Tidak',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color(0xFFA6A6A6),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                    if (shouldClose == true &&
                                        context.mounted) {
                                      Navigator.pop(context);
                                    }
                                  },
                                  icon: const Icon(
                                    Icons.close,
                                    color: ColorPalette.kWhite,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 24),
                            InkWell(
                              onTap: () async {
                                final pickedFile = await ImagePicker()
                                    .pickImage(
                                      source: ImageSource.camera,
                                    );

                                if (pickedFile != null) {
                                  context.read<ProductFormBloc>().add(
                                    ProductFormEvent.imageChange(
                                      pickedFile.path,
                                    ),
                                  );
                                }
                              },
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  // FOTO PRODUK
                                  CircleAvatar(
                                    radius: 70,
                                    backgroundImage: FileImage(
                                      File(state.image),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 8,
                                    right: 8,
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      decoration: const BoxDecoration(
                                        color: ColorPalette.primaryColor,
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                        size: 22,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 24),
                            Column(
                              spacing: 24,
                              children: [
                                // CustomTextFormField(
                                //   initialValue: state.name,
                                //   labelText: 'Nama Produk',
                                //   fillColor: ColorPalette.kInputFill,
                                //   labelStyle: TextStyle(
                                //     fontSize: 14,
                                //     fontWeight: FontWeight.w500,
                                //   ),
                                //   onChanged: (value) => context
                                //       .read<ProductFormBloc>()
                                //       .add(ProductFormEvent.nameChange(value)),
                                //   validator: (value) {
                                //     if (value == null ||
                                //         value.isEmpty ||
                                //         state.name.isEmpty) {
                                //       return 'Tidak boleh kosong';
                                //     }
                                //     return null;
                                //   },
                                //   hintText: 'Masukan data',
                                //   hintStyle: TextStyle(
                                //     fontSize: 12,
                                //     fontWeight: FontWeight.w400,
                                //     color: Colors.black.withValues(alpha: 0.4),
                                //   ),
                                // ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Deskripsi Produk',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFFDDDDDD),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    SizedBox(
                                      width: double.infinity,
                                      height: 80,
                                      child: DecoratedBox(
                                        decoration: ShapeDecoration(
                                          color: const Color(0x33E8E8E8),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                          ),
                                        ),
                                        child: TextFormField(
                                          maxLength: null,
                                          onChanged: (value) => context
                                              .read<ProductFormBloc>()
                                              .add(
                                                ProductFormEvent.descriptionChange(
                                                  value,
                                                ),
                                              ),
                                          maxLines: null,
                                          decoration: InputDecoration(
                                            hintText: 'Masukan data',
                                            hintStyle: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black.withValues(
                                                alpha: 0.4,
                                              ),
                                            ),
                                            border: InputBorder.none,
                                            contentPadding:
                                                const EdgeInsets.all(
                                                  8,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                // CustomTextFormField(
                                //   labelText: 'Produsen',
                                //   fillColor: Color(0x0C101010),
                                //   labelStyle: TextStyle(
                                //     fontSize: 14,
                                //     fontWeight: FontWeight.w500,
                                //   ),
                                //   onChanged: (value) =>
                                //       context.read<ProductFormBloc>().add(
                                //         ProductFormEvent.produsenChange(value),
                                //       ),
                                //   validator: (value) {
                                //     if (value == null || value.isEmpty) {
                                //       return 'Tidak boleh kosong';
                                //     }
                                //     return null;
                                //   },
                                //   hintText: 'Masukan data',
                                //   hintStyle: TextStyle(
                                //     fontSize: 12,
                                //     fontWeight: FontWeight.w400,
                                //     color: Colors.black.withValues(alpha: 0.4),
                                //   ),
                                // ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text.rich(
                                      TextSpan(
                                        text: 'Produsen',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: ColorPalette.kWhite,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: '*',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    ValidationWidget(
                                      validator: (value) {
                                        if (state.produsen == null) {
                                          return 'Tidak boleh kosong';
                                        }
                                        return null;
                                      },

                                      child: SizedBox(
                                        width: double.infinity,
                                        height: 47,
                                        child: DecoratedBox(
                                          decoration: ShapeDecoration(
                                            color: const Color(0x33E8E8E8),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                    8,
                                                  ),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: DropdownButton<int>(
                                              isExpanded: true,
                                              hint: const Text(
                                                'Pilih',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Color(0xFFA6A6A6),
                                                ),
                                              ),
                                              elevation: 0,
                                              onChanged: (value) => {
                                                context.read<ProductFormBloc>().add(
                                                  ProductFormEvent.produsenChange(
                                                    value!,
                                                  ),
                                                ),
                                              },
                                              value: state.produsen,
                                              underline: const SizedBox(),
                                              icon: const Icon(
                                                Icons.arrow_drop_down,
                                              ),
                                              items: state.dataProdusen
                                                  .map<DropdownMenuItem<int>>(
                                                    (e) =>
                                                        DropdownMenuItem<int>(
                                                          value: e.id,
                                                          child: Text(e.title),
                                                        ),
                                                  )
                                                  .toList(),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text.rich(
                                      TextSpan(
                                        text: 'Brand',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: ColorPalette.kWhite,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: '*',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    ValidationWidget(
                                      validator: (value) {
                                        if (state.produsen == null) {
                                          return 'Tidak boleh kosong';
                                        }
                                        return null;
                                      },

                                      child: SizedBox(
                                        width: double.infinity,
                                        height: 47,
                                        child: DecoratedBox(
                                          decoration: ShapeDecoration(
                                            color: const Color(0x33E8E8E8),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                    8,
                                                  ),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: DropdownButton<int>(
                                              isExpanded: true,
                                              hint: const Text(
                                                'Pilih',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Color(0xFFA6A6A6),
                                                ),
                                              ),
                                              elevation: 0,
                                              onChanged: (value) => {
                                                context
                                                    .read<ProductFormBloc>()
                                                    .add(
                                                      ProductFormEvent.brandChange(
                                                        value!,
                                                      ),
                                                    ),
                                              },
                                              value: state.brandId,
                                              underline: const SizedBox(),
                                              icon: const Icon(
                                                Icons.arrow_drop_down,
                                              ),
                                              items: state.dataBrand
                                                  .map<DropdownMenuItem<int>>(
                                                    (e) =>
                                                        DropdownMenuItem<int>(
                                                          value: e.id,
                                                          child: Text(e.title),
                                                        ),
                                                  )
                                                  .toList(),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 40),
                                  ],
                                ),
                              ],
                            ),
                            const Spacer(),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () async {
                                  try {
                                    final coordinates = context
                                        .read<LocationBloc>()
                                        .state
                                        .locations;
                                    if (coordinates == null) {
                                      context.read<LocationBloc>().add(
                                        const LocationEvent.getCurrentLocation(
                                          isGetPosition: true,
                                        ),
                                      );
                                      return;
                                    }
                                    context.read<ProductFormBloc>().add(
                                      ProductFormEvent.submit(coordinates),
                                    );
                                  } catch (e) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text(e.toString())),
                                    );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: ColorPalette.primary,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 14,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(999),
                                  ),
                                ),
                                child: state.isLoading
                                    ? const CircularProgressIndicator(
                                        color: Colors.white,
                                      )
                                    : const Text(
                                        'Kirim Laporan',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

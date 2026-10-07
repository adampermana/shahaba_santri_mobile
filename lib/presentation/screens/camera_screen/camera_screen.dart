// import 'dart:async';
// import 'dart:io';
// import 'dart:math' as math;

// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:go_router/go_router.dart';
// import 'package:lottie/lottie.dart';
// import 'package:sahaba_mobile/business_logic/location/location_bloc.dart';
// import 'package:sahaba_mobile/business_logic/product_bloc/product_bloc.dart';
// import 'package:sahaba_mobile/infrastructure/core/converter.dart';
// import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
// import 'package:sahaba_mobile/presentation/routers/router_path.dart';
// import 'package:sahaba_mobile/presentation/screens/camera_screen/widget/not_found_sheet.dart';
// import 'package:sahaba_mobile/presentation/screens/camera_screen/widget/result_bottom_sheet.dart';
// import 'package:sahaba_mobile/presentation/screens/camera_screen/widget/single_item_sheet.dart';
// import 'package:sahaba_mobile/presentation/widgets/apps_scaffold.dart';
// import 'package:sahaba_mobile/presentation/widgets/cache_images.dart';
// import 'package:sahaba_mobile/presentation/widgets/custom_dialogs_widget.dart';
// import 'package:sahaba_mobile/presentation/widgets/loading_screen.dart';

// class CameraScanScreen extends HookWidget {
//   const CameraScanScreen({super.key});

//   static const double _cameraFrameAspectRatio = 361 / 544;
//   static const double _scanButtonSize = 80;
//   static const double _scanButtonInnerSize = 64;
//   static const double _scanButtonOverlap = 36;
//   static const double _stageBottomGap = 16;
//   static Future<List<CameraDescription>>? _availableCamerasFuture;

//   @override
//   Widget build(BuildContext context) {
//     final currentLocation = GoRouterState.of(context).uri.toString();

//     final controller = useState<CameraController?>(null);
//     final initFuture = useState<Future<void>?>(null);
//     final cameraFrameKey = useMemoized(GlobalKey.new);

//     useEffect(() {
//       var disposed = false;
//       CameraController? tempController;

//       Future<void> setup() async {
//         try {
//           final cameras = await (_availableCamerasFuture ??=
//               availableCameras());
//           if (disposed) return;

//           final backCamera = cameras.firstWhere(
//             (cam) => cam.lensDirection == CameraLensDirection.back,
//             orElse: () => cameras.first,
//           );

//           final cam = CameraController(
//             backCamera,
//             ResolutionPreset.high,
//             enableAudio: false,
//           );
//           tempController = cam;

//           final future = cam.initialize();
//           initFuture.value = future;
//           await future;

//           if (disposed) {
//             try {
//               await cam.dispose();
//             } on Exception catch (_) {}
//             return;
//           }

//           controller.value = cam;
//         } on Exception catch (e) {
//           debugPrint('Camera setup failed: $e');
//         }
//       }

//       unawaited(setup());

//       return () async {
//         disposed = true;
//         final cam = tempController;
//         if (cam != null) {
//           await cam.dispose().catchError((Object e) {
//             debugPrint('Camera dispose failed: $e');
//           });
//         }
//       };
//     }, []);

//     Map<String, double>? scanCoordinates(LocationState locationState) {
//       if (locationState.locations != null) {
//         return locationState.locations;
//       }

//       if (Platform.isIOS) {
//         return const {'latitude': 0.0, 'longitude': 0.0};
//       }

//       return null;
//     }

//     // Future<void> takePicture() async {

//     //   } on Exception catch (e) {
//     //     if (!context.mounted) return;

//     //     ScaffoldMessenger.of(context).showSnackBar(
//     //       SnackBar(content: Text(e.toString())),
//     //     );
//     //   }
//     // }

//     return AnnotatedRegion<SystemUiOverlayStyle>(
//       value: const SystemUiOverlayStyle(
//         statusBarColor: ColorPalette.scaffoldBackground,
//         statusBarIconBrightness: Brightness.light,
//         statusBarBrightness: Brightness.dark,
//         systemNavigationBarColor: ColorPalette.scaffoldBackground,
//         systemNavigationBarIconBrightness: Brightness.light,
//       ),
//       child: AppScaffold(
//         body: SafeArea(
//           child: MultiBlocListener(
//             listeners: [
//               BlocListener<LocationBloc, LocationState>(
//                 listenWhen: (previous, current) =>
//                     previous.alert != current.alert,
//                 listener: (context, state) async {
//                   if (state.alert != null) {
//                     await showAlertDialog(
//                       context,
//                       titleColor: ColorPalette.kWhite,
//                       messageColor: ColorPalette.kWhite,
//                       iconColor: const Color(0xffB39164),
//                       backgroundColor: ColorPalette.scaffoldBackground,
//                       alert: state.alert,
//                       title: state.titleError,
//                       message: state.messageError,
//                       onRefresh: () => context.read<LocationBloc>().add(
//                         const LocationEvent.getCurrentLocation(
//                           isGetPosition: true,
//                         ),
//                       ),
//                     );
//                   }
//                 },
//               ),
//               BlocListener<ProductBloc, ProductState>(
//                 listenWhen: (previous, current) =>
//                     previous.isLoading != current.isLoading,
//                 listener: (context, state) async {
//                   final dataProduct = state.data
//                      .where((p) => p.type!.toLowerCase().contains('organic'))
//                       .toList();
//                   if (state.isLoading && state.isCamera) {
//                     LoadingOverlay.show(
//                       barrierOpacity: 0.7,
//                       context,
//                       content: Transform.translate(
//                         offset: _cameraFrameCenterOffset(
//                           context,
//                           cameraFrameKey,
//                         ),
//                         child: Lottie.asset(
//                           width: 80,
//                           fit: BoxFit.contain,
//                           'assets/animation/loading.json',
//                         ),
//                       ),
//                     );
//                   } else {
//                     LoadingOverlay.hide();
//                   }
//                   if (!state.isLoading &&
//                       state.data.isEmpty &&
//                       state.isCamera) {
//                     final locationBloc = context.read<LocationBloc>();
//                     await showModalBottomSheet<void>(
//                       backgroundColor: ColorPalette.scaffoldBackground,
//                       context: context,
//                       shape: const RoundedRectangleBorder(
//                         borderRadius: BorderRadius.vertical(
//                           top: Radius.circular(20),
//                         ),
//                       ),
//                       builder: (_) => BlocProvider.value(
//                         value: locationBloc,
//                         child: const NotFoundSheet(),
//                       ),
//                     );
//                     return;
//                   } else if (!state.isLoading &&
//                       (state.data.length == 1 || dataProduct.length == 1) &&
//                       state.isCamera) {
//                     try {
//                       final dataIklan = state.data
//                        .where((p) => p.type!.toLowerCase().contains('iklan'))
//                           .firstOrNull;
//                       final locationBloc = context.read<LocationBloc>();
//                      final coordinates = scanCoordinates(locationBloc.state);
//                       if (coordinates == null) {
//                         if (!context.mounted) return;
//                         context.pop();
//                         locationBloc.add(
//                           const LocationEvent.getCurrentLocation(
//                             isGetPosition: true,
//                           ),
//                         );
//                         return;
//                       }
//                       final draggableController =
//                           DraggableScrollableController();
//                       context.pop();
//                       // chek in
//                       context.read<ProductBloc>().add(
//                         ProductEvent.addLocalData(
//                           state.data[0],
//                           isLoading: false,
//                           coordinates: coordinates,
//                         ),
//                       );

//                       await showModalBottomSheet<void>(
//                         isDismissible: false,
//                         backgroundColor: ColorPalette.scaffoldBackground,
//                         isScrollControlled: true,
//                         context: context,
//                         shape: const RoundedRectangleBorder(
//                           borderRadius: BorderRadius.vertical(
//                             top: Radius.circular(20),
//                           ),
//                         ),
//                         builder: (_) => DraggableScrollableSheet(
//                           initialChildSize: 0.9,
//                           minChildSize: 0.5,
//                           controller: draggableController,
//                           maxChildSize: 0.9,
//                           expand: false,
//                           shouldCloseOnMinExtent: false,
//                           builder: (_, scrollController) => SingleItemSheet(
//                             id: state.data[0].id!,
//                             ad: dataIklan,
//                           ),
//                         ),
//                       );
//                     } on Exception catch (e) {
//                       if (!context.mounted) return;
//                       ScaffoldMessenger.of(
//                         context,
//                       ).showSnackBar(SnackBar(content: Text(e.toString())));
//                     }
//                   } else if (!state.isLoading &&
//                       state.isCamera &&
//                       state.data.isNotEmpty &&
//                       state.data.length > 1) {
//                     final locationBloc = context.read<LocationBloc>();
//                     final productBloc = context.read<ProductBloc>();
//                     await showModalBottomSheet<void>(
//                       backgroundColor: ColorPalette.scaffoldBackground,
//                       context: context,
//                       shape: const RoundedRectangleBorder(
//                         borderRadius: BorderRadius.vertical(
//                           top: Radius.circular(20),
//                         ),
//                       ),
//                       builder: (_) => MultiBlocProvider(
//                         providers: [
//                           BlocProvider.value(value: locationBloc),
//                           BlocProvider.value(value: productBloc),
//                         ],
//                         child: const ProductSearchResultSheet(),
//                       ),
//                     );
//                   }
//                 },
//               ),
//               BlocListener<ProductBloc, ProductState>(
//                 listenWhen: (previous, current) =>
//                     previous.isLoadingSaveData != current.isLoadingSaveData,
//                 listener: (context, state) async {
//                   if (state.isLoadingSaveData) {
//                     final dataIklan = state.data
//                        .where((p) => p.type!.toLowerCase().contains('iklan'))
//                         .firstOrNull;
//                     await context.push(
//                       '$currentLocation/${RouterPath.productDetailPath}',
//                       extra: {
//                         'isAds':
//                            state.tempProduct!.type?.toLowerCase() == 'iklan',
//                         'ad': dataIklan,
//                         'id': state.tempProduct!.id,
//                       },
//                     );
//                     // Navigator.push(
//                     //   context,
//                     //   MaterialPageRoute(
//                     //     builder: (_) => ProductDetailPage(
//                     //       isAds:
//                     //           state.tempProduct!.type?.toLowerCase() ==
//                     //               'iklan',
//                     //       id: state.tempProduct!.id!,
//                     //       ad: dataIklan,
//                     //     ),
//                     //   ),
//                     // );
//                   }
//                 },
//               ),
//             ],
//             child: Padding(
//               padding: const EdgeInsets.fromLTRB(16, 18, 16, 0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   _backAction(context),
//                   const SizedBox(height: 24),
//                   _scanHeader(),
//                   const SizedBox(height: 40),
//                   Expanded(
//                     child: _cameraStage(
//                       controller: controller.value,
//                       initFuture: initFuture.value,
//                       onScan: () async {
//                         final productBloc = context.read<ProductBloc>();
//                         final locationBloc = context.read<LocationBloc>();

//                        var coordinates = scanCoordinates(locationBloc.state);

//                         if (coordinates == null) {
//                           // Trigger GPS fetch
//                           locationBloc.add(
//                             const LocationEvent.getCurrentLocation(
//                               isGetPosition: true,
//                             ),
//                           );

//                           // Tampilkan loading sementara tunggu koordinat
//                           productBloc.add(const ProductEvent.startLoading());

//                           // Await koordinat dari stream LocationBloc
//                          final completer = Completer<Map<String, double>?>();
//                           late StreamSubscription<LocationState> sub;
//                           sub = locationBloc.stream.listen((state) async {
//                             final coords = scanCoordinates(state);
//                             if (coords != null && !completer.isCompleted) {
//                               completer.complete(coords);
//                               await sub.cancel();
//                             } else if (state.alert != null &&
//                                 !completer.isCompleted) {
//                               completer.complete(null);
//                               await sub.cancel();
//                             }
//                           });

//                           // Timeout 15 detik
//                           coordinates = await completer.future.timeout(
//                             const Duration(seconds: 15),
//                             onTimeout: () async {
//                               await sub.cancel();
//                               return null;
//                             },
//                           );

//                           if (coordinates == null) {
//                             productBloc.add(
//                               const ProductEvent.stopLoading(),
//                             );
//                             return;
//                           }
//                         }

//                         final cam = controller.value;
//                         if (cam == null) return;

//                         productBloc.add(const ProductEvent.startLoading());
//                         await WidgetsBinding.instance.endOfFrame;

//                         await initFuture.value;

//                         if (!cam.value.isInitialized) return;

//                         final image = await cam.takePicture();

//                         final croppedFile = await cropImageToAspectRatio(
//                           file: File(image.path),
//                           aspectRatio: _cameraFrameAspectRatio,
//                         );

//                       final compressedFile = await compressImageToTargetSize(
//                           file: croppedFile,
//                         );

//                         if (compressedFile == null) return;

//                         productBloc.add(
//                           ProductEvent.searchImage(
//                             compressedFile,
//                             coordinates,
//                           ),
//                         );
//                       },
//                       cameraFrameKey: cameraFrameKey,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _backAction(BuildContext context) {
//     return Align(
//       alignment: Alignment.centerLeft,
//       child: Semantics(
//         button: true,
//         label: 'Kembali',
//         child: InkWell(
//           borderRadius: BorderRadius.circular(20),
//           onTap: () => Navigator.pop(context),
//           child: const Padding(
//             padding: EdgeInsets.only(right: 8),
//             child: SizedBox(
//               height: 32,
//               child: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Icon(
//                     Icons.chevron_left,
//                     color: ColorPalette.kWhite,
//                     size: 24,
//                   ),
//                   SizedBox(width: 4),
//                   Text(
//                     'Kembali',
//                     style: TextStyle(
//                       color: ColorPalette.kWhite,
//                       fontSize: 16,
//                       fontFamily: 'Satoshi Variable',
//                       fontWeight: FontWeight.w500,
//                       height: 1.38,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _scanHeader() {
//     return const Column(
//       spacing: 4,
//       children: [
//         Text(
//           'Cek Kehalalan Produk',
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             color: ColorPalette.kWhite,
//             fontSize: 20,
//             fontFamily: 'Satoshi Variable',
//             fontWeight: FontWeight.w700,
//             height: 1.40,
//           ),
//         ),
//         SizedBox(
//           width: 273,
//           child: Text(
//             'Posisikan barcode atau kemasan produk di dalam bingkai kamera.',
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               color: ColorPalette.kWhite,
//               fontSize: 14,
//               fontFamily: 'Satoshi Variable',
//               fontWeight: FontWeight.w400,
//               height: 1.43,
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _cameraStage({
//     required CameraController? controller,
//     required Future<void>? initFuture,
//     required VoidCallback onScan,
//     required GlobalKey cameraFrameKey,
//   }) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         if (constraints.maxWidth <= 0 || constraints.maxHeight <= 0) {
//           return const SizedBox.shrink();
//         }

//         const verticalReserve =
//             _scanButtonSize - _scanButtonOverlap + _stageBottomGap;
//         final maxFrameHeight = math.max<double>(
//           0,
//           constraints.maxHeight - verticalReserve,
//         );
//         final frameHeight = math.min(
//           constraints.maxWidth / _cameraFrameAspectRatio,
//           maxFrameHeight,
//         );
//         final frameWidth = frameHeight * _cameraFrameAspectRatio;
//         final contentHeight = math.min(
//           constraints.maxHeight,
//           frameHeight + verticalReserve,
//         );

//         if (frameWidth <= 0 || frameHeight <= 0) {
//           return const SizedBox.shrink();
//         }

//         return Align(
//           alignment: Alignment.topCenter,
//           child: SizedBox(
//             width: constraints.maxWidth,
//             height: contentHeight,
//             child: Stack(
//               clipBehavior: Clip.none,
//               children: [
//                 Positioned(
//                   top: 0,
//                   left: (constraints.maxWidth - frameWidth) / 2,
//                   width: frameWidth,
//                   height: frameHeight,
//                   child: KeyedSubtree(
//                     key: cameraFrameKey,
//                     child: _cameraFrame(
//                       controller: controller,
//                       initFuture: initFuture,
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   top: frameHeight - _scanButtonOverlap,
//                   left: 0,
//                   right: 0,
//                   child: _scanButton(onScan: onScan),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Offset _cameraFrameCenterOffset(
//     BuildContext context,
//     GlobalKey cameraFrameKey,
//   ) {
//     final frameContext = cameraFrameKey.currentContext;
//     final overlayContext = Overlay.of(context, rootOverlay: true).context;
//     final frameBox = frameContext?.findRenderObject() as RenderBox?;
//     final overlayBox = overlayContext.findRenderObject() as RenderBox?;

//     if (frameBox == null ||
//         overlayBox == null ||
//         !frameBox.hasSize ||
//         !overlayBox.hasSize) {
//       return Offset.zero;
//     }

//     final frameCenter = frameBox.localToGlobal(
//       frameBox.size.center(Offset.zero),
//       ancestor: overlayBox,
//     );
//     final overlayCenter = overlayBox.size.center(Offset.zero);

//     return frameCenter - overlayCenter;
//   }

//   Widget _cameraFrame({
//     required CameraController? controller,
//     required Future<void>? initFuture,
//   }) {
//     return Stack(
//       fit: StackFit.expand,
//       children: [
//         ClipRRect(
//           borderRadius: BorderRadius.circular(8),
//        child: _cameraPreview(controller: controller, initFuture: initFuture),
//         ),
//         const IgnorePointer(
//           child: CustomPaint(painter: ScannerOverlayPainter()),
//         ),
//       ],
//     );
//   }

//   Widget _cameraPreview({
//     required CameraController? controller,
//     required Future<void>? initFuture,
//   }) {
//     if (controller == null) {
//       return const Center(
//         child: CircularProgressIndicator(color: ColorPalette.kWhite),
//       );
//     }

//     return FutureBuilder<void>(
//       future: initFuture,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState != ConnectionState.done ||
//             !controller.value.isInitialized) {
//           return const Center(
//             child: CircularProgressIndicator(color: ColorPalette.kWhite),
//           );
//         }

//         return LayoutBuilder(
//           builder: (context, constraints) {
//             final previewSize = controller.value.previewSize;
//             if (previewSize == null) {
//               return CameraPreview(controller);
//             }

//             final isPortrait =
//                 MediaQuery.orientationOf(context) == Orientation.portrait;
//             final previewWidth = isPortrait
//                 ? previewSize.height
//                 : previewSize.width;
//             final previewHeight = isPortrait
//                 ? previewSize.width
//                 : previewSize.height;

//             return SizedBox.expand(
//               child: FittedBox(
//                 fit: BoxFit.cover,
//                 child: SizedBox(
//                   width: previewWidth,
//                   height: previewHeight,
//                   child: CameraPreview(controller),
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }

//   Widget _scanButton({required VoidCallback onScan}) {
//     return Center(
//       child: BlocSelector<ProductBloc, ProductState, bool>(
//         selector: (state) => state.isLoading,
//         builder: (context, isLoading) {
//           return Semantics(
//             button: true,
//             label: 'Scan produk',
//             child: GestureDetector(
//               behavior: HitTestBehavior.opaque,
//               onTap: isLoading ? null : onScan,
//               child: SizedBox.square(
//                 dimension: _scanButtonSize,
//                 child: Center(
//                   child: Container(
//                     width: _scanButtonInnerSize,
//                     height: _scanButtonInnerSize,
//                     decoration: const BoxDecoration(
//                       color: ColorPalette.primary,
//                       shape: BoxShape.circle,
//                     ),
//                     child: const Center(
//                       child: CacheImageOrSvg(
//                         source: 'assets/svg/search-eye-fill.svg',
//                         colorAsset: ColorPalette.kWhite,
//                         width: 32,
//                         height: 32,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class ScannerOverlayPainter extends CustomPainter {
//   const ScannerOverlayPainter();

//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = ColorPalette.kWhite
//       ..strokeCap = StrokeCap.round
//       ..strokeJoin = StrokeJoin.round
//       ..strokeWidth = 4
//       ..style = PaintingStyle.stroke;

//     final shortestSide = math.min(size.width, size.height);
//     final inset = math.min<double>(16, shortestSide * 0.06);
//     final corner = math.min<double>(63, shortestSide * 0.18);
//     final radius = math.min(10, corner * 0.22);
//     final left = inset;
//     final top = inset;
//     final right = size.width - inset;
//     final bottom = size.height - inset;

//     canvas
//       ..drawPath(
//         Path()
//           ..moveTo(left, top + corner)
//           ..lineTo(left, top + radius)
//           ..quadraticBezierTo(left, top, left + radius, top)
//           ..lineTo(left + corner, top),
//         paint,
//       )
//       ..drawPath(
//         Path()
//           ..moveTo(right - corner, top)
//           ..lineTo(right - radius, top)
//           ..quadraticBezierTo(right, top, right, top + radius)
//           ..lineTo(right, top + corner),
//         paint,
//       )
//       ..drawPath(
//         Path()
//           ..moveTo(left, bottom - corner)
//           ..lineTo(left, bottom - radius)
//           ..quadraticBezierTo(left, bottom, left + radius, bottom)
//           ..lineTo(left + corner, bottom),
//         paint,
//       )
//       ..drawPath(
//         Path()
//           ..moveTo(right - corner, bottom)
//           ..lineTo(right - radius, bottom)
//           ..quadraticBezierTo(right, bottom, right, bottom - radius)
//           ..lineTo(right, bottom - corner),
//         paint,
//       );
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
// }

// class CameraBorderClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     const borderWidth = 20.0;

//     // FRAME utama (kotak kamera)
//     final outer = Rect.fromLTWH(0, 150, size.width, size.height - 300);

//     // Bagian dalam frame (area kamera bersih)
//     final inner = Rect.fromLTWH(
//       borderWidth,
//       150 + borderWidth,
//       size.width - borderWidth * 2,
//       (size.height - 300) - borderWidth * 2,
//     );

//     final path = Path()
//       ..addRect(outer)
//       ..addRect(inner);

//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }

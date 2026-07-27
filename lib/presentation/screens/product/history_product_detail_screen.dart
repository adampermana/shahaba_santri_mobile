import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart' as lottie;
import 'package:sahaba_mobile/business_logic/product_detail/product_detail_bloc.dart';
import 'package:sahaba_mobile/injector.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/app/resources/icons.dart';
import 'package:sahaba_mobile/presentation/widgets/apps_scaffold.dart';
import 'package:sahaba_mobile/presentation/widgets/cache_images.dart';

class HistoryProductDetailScreen extends StatelessWidget {
  const HistoryProductDetailScreen({
    required this.id,
    super.key,
    this.lat,
    this.long,
    this.eventTime,
  });
  final int id;
  final double? lat;
  final double? long;
  final String? eventTime;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductDetailBloc>(
      create: (context) =>
          sl<ProductDetailBloc>()..add(ProductDetailEvent.started(id)),
      child: AppScaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(30),
            child: SizedBox.shrink(),
          ),
          elevation: 0,
          titleSpacing: 0,
          leading: IconButton(
            icon: const Icon(Icons.chevron_left, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text(
            'Kembali',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: BlocListener<ProductDetailBloc, ProductDetailState>(
          listenWhen: (previous, current) =>
              previous.isLoading != current.isLoading,
          listener: (context, state) async {
            if (!state.isLoading) {
              await showDialog<void>(
                context: context,
                barrierDismissible: false, // <- Tidak bisa di close manual
                builder: (_) {
                  // Tutup otomatis setelah 2 detik
                  Future.delayed(const Duration(seconds: 2), () {
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                  });

                  return PopScope(
                    canPop: false, // <- Tidak bisa di pop dengan tombol back
                    child: Center(
                      child: SizedBox(
                        width: 200,
                        height: 200,
                        child: lottie.LottieBuilder.asset(
                          fit: BoxFit.contain,
                          'assets/animation/success.json',
                          // state.product!.status == 'Halal'
                          //     // &&
                          //     //         getDateLeft(state.product!.expireDate!) > 0
                          //     ? 'assets/animation/success.json'
                          //     : 'assets/animation/failed.json',
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          },
          child: BlocBuilder<ProductDetailBloc, ProductDetailState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state.errorMessage != null) {
                return Center(child: Text(state.errorMessage!));
              } else {
                final product = state.product!;

                debugPrint('lat: ${product.lat}');
                debugPrint('long: ${product.long}');
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header part (Riwayat Pencarian and Lihat Lokasi)
                      Container(
                        color: Colors.white.withValues(alpha: 0.80),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Riwayat Pencarian Produk',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  (eventTime != null && eventTime!.isNotEmpty)
                                      ? eventTime!
                                      : '-',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () async {
                                await _showLocationDialog(
                                  context,
                                  lat ?? product.lat,
                                  long ?? product.long,
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.only(
                                  bottom: 2,
                                ), // space between text and underline
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: ColorPalette.primary,
                                      width: 2,
                                    ),
                                  ),
                                ),
                                child: const Row(
                                  children: [
                                    Text(
                                      'Lihat Lokasi',
                                      style: TextStyle(
                                        color: ColorPalette.primary,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12,
                                      ),
                                    ),
                                    SizedBox(width: 4),
                                    CacheImageOrSvg(
                                      source: 'assets/svg/map-pin-line.svg',
                                      colorAsset: ColorPalette.primary,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Product Image Group
                      Center(
                        child: Container(
                          width: double.infinity,
                          height: 200,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: CacheImageOrSvg(
                            source: product.images?.first.image ?? '-',
                            fit: BoxFit.contain,
                            autoCache: true,
                            // fit: BoxFit.contain,
                            // errorBuilder: (_, __, ___) => const Icon(
                            //   Icons.image,
                            //   size: 100,
                            //   color: Colors.grey,
                            // ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Terdaftar Halal',
                                    // product.status == 'Halal'
                                    //     ? 'Terdaftar Halal'
                                    //     : 'Belum Terdaftar Halal',
                                    // product.status == 'Halal'
                                    //     ? 'Expired'
                                    //     : product.status == 'Halal'
                                    //     ? 'Terdaftar Halal'
                                    //     : 'Belum Terdaftar Halal',
                                    style: TextStyle(
                                      color: product.status == 'Halal'
                                          // &&
                                          //     getDateLeft(product.expireDate!) >
                                          //         0
                                          ? ColorPalette.kTeal
                                          : const Color(
                                              0xFFC6412D,
                                            ), // Custom red for non-halal based on design
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                    ),
                                  ),
                                ),
                                // Row(
                                //   children: [
                                // Icon(
                                //   Icons.star_border,
                                //   color: Colors.black54,
                                //   size: 24,
                                // ),
                                // const SizedBox(width: 12),
                                // Icon(
                                //   Icons.reply,
                                //   color: Colors.black54,
                                //   size: 24,
                                // ), // Share icon
                                //   ],
                                // ),
                              ],
                            ),
                            const SizedBox(height: 8),

                            Text(
                              product.name!,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: ColorPalette.kWhite,
                              ),
                            ),

                            const SizedBox(height: 24),
                            Visibility(
                              visible: product.status == 'Halal',
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'No Sertifikat',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: ColorPalette.contentDisabled,
                                        ),
                                      ),
                                      Text(
                                        product.certificateNumber ?? '-',
                                        style: const TextStyle(
                                          color: ColorPalette.inverseSecondary,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Terbit tanggal ${product.registerDate ?? '-'}',
                                        //  - ${product.expireDate ?? '-'}',
                                        style: const TextStyle(
                                          color: ColorPalette.inverseSecondary,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      // Visibility(
                                      //   visible:
                                      //       product.expireDate != null &&
                                      //       product.expireDate!.isNotEmpty &&
                                      //       getDateLeft(product.expireDate!) >
                                      //           0,
                                      //   child: Text(
                                      //     '*Berlaku ${getDateLeft(product.expireDate!)} hari lagi',
                                      //     style: TextStyle(
                                      //       color: ColorPalette.kRedDanger,
                                      //       fontSize: 12,
                                      //       fontWeight: FontWeight.w500,
                                      //       height: 1.33,
                                      //     ),
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                  const SizedBox(height: 24),
                                ],
                              ),
                            ),

                            const Text(
                              'Deskripsi Produk',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: ColorPalette.contentDisabled,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              product.description!,
                              style: const TextStyle(
                                color: ColorPalette.inverseSecondary,
                                fontSize: 14,
                                height: 1.5,
                              ),
                            ),
                            const SizedBox(height: 24),

                            const Divider(
                              height: 1,
                              thickness: 1,
                              color: Color(0x33E8E8E8),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Kategori',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: ColorPalette.contentDisabled,
                                  ),
                                ),
                                Text(
                                  product.category ?? '-',
                                  style: const TextStyle(
                                    color: ColorPalette.inverseSecondary,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            const Divider(
                              height: 1,
                              thickness: 1,
                              color: Color(0x33E8E8E8),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Produsen',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: ColorPalette.contentDisabled,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Text(
                                        product.partner ?? '-',
                                        style: const TextStyle(
                                          color: ColorPalette.inverseSecondary,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            const Divider(
                              height: 1,
                              thickness: 1,
                              color: Color(0x33E8E8E8),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 50),
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Future<void> _showLocationDialog(
    BuildContext context,
    double? lat,
    double? long,
  ) async {
    if (lat == null || long == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Lokasi tidak tersedia untuk produk ini.'),
        ),
      );
      return;
    }

    await showDialog<void>(
      context: context,
      builder: (context) => _LocationMapDialog(lat: lat, long: long),
    );
  }

  int getDateLeft(String date) {
    final now = DateTime.now();
    final formatter = DateFormat('dd MMM yyyy');
    final targetDate = formatter.parse(date);

    final days = targetDate.difference(now).inDays;
    debugPrint('days left: ${days < 0}');
    return days;
  }
}

class _LocationMapDialog extends StatefulWidget {
  const _LocationMapDialog({required this.lat, required this.long});
  final double lat;
  final double long;

  @override
  State<_LocationMapDialog> createState() => _LocationMapDialogState();
}

class _LocationMapDialogState extends State<_LocationMapDialog> {
  static const _darkMapStyle = '''
[
  {
    "elementType": "geometry",
    "stylers": [
      {"color": "#1f2937"}
    ]
  },
  {
    "elementType": "labels.icon",
    "stylers": [
      {"visibility": "off"}
    ]
  },
  {
    "elementType": "labels.text.fill",
    "stylers": [
      {"color": "#d1d5db"}
    ]
  },
  {
    "elementType": "labels.text.stroke",
    "stylers": [
      {"color": "#111827"}
    ]
  },
  {
    "featureType": "administrative",
    "elementType": "geometry",
    "stylers": [
      {"color": "#4b5563"}
    ]
  },
  {
    "featureType": "poi",
    "elementType": "geometry",
    "stylers": [
      {"color": "#253244"}
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry",
    "stylers": [
      {"color": "#374151"}
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry.stroke",
    "stylers": [
      {"color": "#111827"}
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry",
    "stylers": [
      {"color": "#4b5563"}
    ]
  },
  {
    "featureType": "transit",
    "elementType": "geometry",
    "stylers": [
      {"color": "#253244"}
    ]
  },
  {
    "featureType": "water",
    "elementType": "geometry",
    "stylers": [
      {"color": "#0f172a"}
    ]
  }
]
''';

  GoogleMapController? _mapController;
  BitmapDescriptor? _customMarkerIcon;

  @override
  void initState() {
    super.initState();
    unawaited(_loadCustomMarker());
  }

  Future<void> _loadCustomMarker() async {
    try {
      const size = 24.0;
      final pictureInfo = await vg.loadPicture(
        const SvgAssetLoader('assets/svg/map-pin-3-fill.svg'),
        null,
      );

      final recorder = ui.PictureRecorder();
      final canvas = Canvas(recorder);
      final scaleX = size / pictureInfo.size.width;
      final scaleY = size / pictureInfo.size.height;
      canvas.scale(scaleX, scaleY);

      // Terapkan warna kTeal ke SVG
      final paint = Paint()
        ..colorFilter = const ColorFilter.mode(
          ColorPalette.primary,
          BlendMode.srcIn,
        );
      canvas
        ..saveLayer(
          Rect.fromLTWH(0, 0, pictureInfo.size.width, pictureInfo.size.height),
          paint,
        )
        ..drawPicture(pictureInfo.picture)
        ..restore();
      pictureInfo.picture.dispose();

      final image = await recorder.endRecording().toImage(
        size.toInt(),
        size.toInt(),
      );
      final bytes = await image.toByteData(format: ui.ImageByteFormat.png);

      if (bytes != null && mounted) {
        setState(() {
          _customMarkerIcon = BitmapDescriptor.bytes(
            bytes.buffer.asUint8List(),
          );
        });
      }
    } on Exception catch (e) {
      debugPrint('Failed to load custom marker: $e');
    }
  }

  @override
  void dispose() {
    _mapController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final point = LatLng(widget.lat, widget.long);

    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 36),
      backgroundColor: const Color(0xFF0F172A),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                height: 205,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: GoogleMap(
                        initialCameraPosition: CameraPosition(
                          target: point,
                          zoom: 15,
                        ),
                        style: _darkMapStyle,
                        onMapCreated: (controller) {
                          _mapController = controller;
                        },
                        markers: {
                          Marker(
                            markerId: const MarkerId('product_location'),
                            position: point,
                            icon: _customMarkerIcon ??
                                BitmapDescriptor.defaultMarker,
                          ),
                        },
                        zoomControlsEnabled: false,
                        myLocationButtonEnabled: false,
                        mapToolbarEnabled: false,
                      ),
                    ),
                    Positioned(
                      right: 6,
                      bottom: 12,
                      child: Column(
                        spacing: 8,
                        children: [
                          _MapZoomButton(
                            icon: AppIcons.zoomInLine,
                            onTap: () => _mapController?.animateCamera(
                              CameraUpdate.zoomIn(),
                            ),
                          ),
                          _MapZoomButton(
                            icon: AppIcons.zoomOutLine,
                            onTap: () => _mapController?.animateCamera(
                              CameraUpdate.zoomOut(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => Navigator.pop(context),
                borderRadius: BorderRadius.circular(10000),
                child: Container(
                  width: double.infinity,
                  height: 52,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10000),
                  ),
                  child: const Text(
                    'Tutup',
                    style: TextStyle(
                      color: Color(0xFFA6A6A6),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      height: 16 / 14,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MapZoomButton extends StatelessWidget {
  const _MapZoomButton({required this.icon, required this.onTap});

  final String icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(6),
        child: SizedBox(
          width: 24,
          height: 24,
          child: SvgPicture.asset(
            icon,
            width: 24,
            height: 24,
            colorFilter: const ColorFilter.mode(
              ColorPalette.kWhite,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}

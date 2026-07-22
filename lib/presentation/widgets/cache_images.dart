import 'dart:io' as io;

import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';

class CacheImageOrSvg extends StatelessWidget {
  const CacheImageOrSvg({
    required this.source,
    this.colorAsset,
    super.key,
    this.isCircle = false,
    this.fit = BoxFit.cover,
    this.borderRadius,
    this.errorBuilder,
    this.width,
    this.height,
    this.cacheHeight,
    this.cacheWidth,
    this.placeholderBuilder,
    this.svgColor,
    this.colorLoading,
    this.svgBlendMode = BlendMode.srcIn,
    this.autoCache = false,
  });

  final String source;
  final Color? colorAsset;
  final Color? svgColor;
  final BlendMode svgBlendMode;
  final bool isCircle;
  final BorderRadius? borderRadius;
  final Widget Function(BuildContext context, String error, dynamic stackTrace)?
  errorBuilder;
  final BoxFit fit;
  final double? width;
  final double? height;
  final int? cacheHeight;
  final int? cacheWidth;
  final bool autoCache;
  final Color? colorLoading;
  final Widget Function(BuildContext context)? placeholderBuilder;

  /// Color to apply to SVG files. If null, will use [colorAsset] as fallback
  /// This gives more control over SVG coloring separate from regular images

  /// Blend mode for SVG color filtering. Default is [BlendMode.srcIn]

  bool get _isSvg {
    final uri = Uri.tryParse(source);
    final path = uri?.path.toLowerCase() ?? source.toLowerCase();
    return path.endsWith('.svg') || path.contains('/svg');
  }

  /// Get the effective color for SVG. Priority: svgColor > colorAsset > null
  Color? get _effectiveSvgColor => svgColor ?? colorAsset;

  Widget _buildErrorWidget(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: Colors.grey.shade100,
      child: const Center(
        child: Icon(Icons.broken_image_outlined, color: Colors.black54),
      ),
    );
  }

  Widget _buildPlaceholder(BuildContext context) {
    return placeholderBuilder?.call(context) ??
        Container(
          width: width,
          height: height,
          color: Colors.grey.shade100,
          child: Center(
            child: SizedBox(
              height: 32,
              width: 32,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: colorLoading ?? ColorPalette.kWhite,
              ),
            ),
          ),
        );
  }

  Widget _buildSvgErrorWidget(
    BuildContext context,
    Object error,
    StackTrace stackTrace,
  ) {
    debugPrint('Failed to load SVG: $source\n$error');
    return errorBuilder?.call(context, error.toString(), stackTrace) ??
        _buildErrorWidget(context);
  }

  Widget _buildCachedSvgErrorWidget(
    BuildContext context,
    Object error,
    StackTrace stackTrace,
    io.File file,
  ) {
    debugPrint(
      'Failed to load cached SVG, trying image fallback: $source\n$error',
    );
    return _buildImageFile(file);
  }

  Widget _buildNetworkSvg() {
    if (autoCache) {
      return _buildCachedNetworkFile(shouldTrySvg: true);
    }

    return SvgPicture.network(
      source,
      width: width,
      height: height,
      fit: fit,
      colorFilter: _effectiveSvgColor != null
          ? ColorFilter.mode(_effectiveSvgColor!, svgBlendMode)
          : null,
      placeholderBuilder: placeholderBuilder != null
          ? (context) => placeholderBuilder!(context)
          : _buildPlaceholder,
      errorBuilder: _buildSvgErrorWidget,
    );
  }

  Widget _buildCachedNetworkFile({required bool shouldTrySvg}) {
    return StreamBuilder<FileResponse>(
      stream: DefaultCacheManager().getFileStream(source, withProgress: true),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          final error = snapshot.error;
          return errorBuilder?.call(
                context,
                error.toString(),
                snapshot.stackTrace,
              ) ??
              _buildErrorWidget(context);
        }

        final response = snapshot.data;
        if (response is FileInfo) {
          final file = io.File(response.file.path);
          return shouldTrySvg ? _buildFileSvg(file) : _buildImageFile(file);
        }

        return _buildPlaceholder(context);
      },
    );
  }

  Widget _buildFileSvg(io.File file) {
    return SvgPicture.file(
      file,
      width: width,
      height: height,
      fit: fit,
      colorFilter: _effectiveSvgColor != null
          ? ColorFilter.mode(_effectiveSvgColor!, svgBlendMode)
          : null,
      placeholderBuilder: placeholderBuilder != null
          ? (context) => placeholderBuilder!(context)
          : _buildPlaceholder,
      errorBuilder: (context, error, stackTrace) =>
          _buildCachedSvgErrorWidget(context, error, stackTrace, file),
    );
  }

  Widget _buildAssetSvg() {
    return SvgPicture.asset(
      source,
      width: width,
      height: height,
      fit: fit,
      colorFilter: _effectiveSvgColor != null
          ? ColorFilter.mode(_effectiveSvgColor!, svgBlendMode)
          : null,
      errorBuilder: _buildSvgErrorWidget,
    );
  }

  Widget _buildLocalFileSvg() {
    return SvgPicture.file(
      io.File(source),
      width: width,
      height: height,
      fit: fit,
      colorFilter: _effectiveSvgColor != null
          ? ColorFilter.mode(_effectiveSvgColor!, svgBlendMode)
          : null,
      errorBuilder: _buildSvgErrorWidget,
    );
  }

  Widget _buildNetworkImage() {
    if (autoCache) {
      return _buildCachedNetworkFile(shouldTrySvg: false);
    }

    return Image.network(
      source,
      fit: fit,
      width: width,
      height: height,
      cacheHeight: cacheHeight,
      cacheWidth: cacheWidth,
      color: colorAsset,
      loadingBuilder: placeholderBuilder == null
          ? null
          : (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }

              return placeholderBuilder!(context);
            },
      errorBuilder: (context, e, s) =>
          errorBuilder?.call(context, e.toString(), s) ??
          _buildErrorWidget(context),
    );
  }

  Widget _buildImageFile(io.File file) {
    return Image.file(
      file,
      fit: fit,
      width: width,
      height: height,
      cacheHeight: cacheHeight,
      cacheWidth: cacheWidth,
      color: colorAsset,
      errorBuilder: (context, e, s) =>
          errorBuilder?.call(context, e.toString(), s) ??
          _buildErrorWidget(context),
    );
  }

  Widget _buildAssetImage() {
    return Image.asset(
      source,
      fit: fit,
      width: width,
      height: height,
      cacheHeight: cacheHeight,
      cacheWidth: cacheWidth,
      color: colorAsset,
      errorBuilder: (context, e, s) => _buildErrorWidget(context),
    );
  }

  Widget _buildFileImage() {
    return _buildImageFile(io.File(source));
  }

  @override
  Widget build(BuildContext context) {
    if (source.trim().isEmpty) {
      return _buildErrorWidget(context);
    }

    Widget imageWidget;

    try {
      if (source.toLowerCase().startsWith('http')) {
        // Network source
        imageWidget = _isSvg ? _buildNetworkSvg() : _buildNetworkImage();
      } else if (source.toLowerCase().startsWith('assets')) {
        // Asset source
        imageWidget = _isSvg ? _buildAssetSvg() : _buildAssetImage();
      } else {
        // File source
        imageWidget = _isSvg ? _buildLocalFileSvg() : _buildFileImage();
      }
    } on Exception catch (e) {
      // Fallback to error widget if something goes wrong
      imageWidget =
          errorBuilder?.call(context, e.toString(), null) ??
          _buildErrorWidget(context);
    }

    // Apply clipping
    if (isCircle) {
      return ClipOval(child: imageWidget);
    }

    if (borderRadius != null) {
      return ClipRRect(borderRadius: borderRadius!, child: imageWidget);
    }

    return imageWidget;
  }
}

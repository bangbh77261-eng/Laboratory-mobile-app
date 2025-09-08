import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppImage extends StatelessWidget {
  final String imagePath;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Color? color;
  final String? semanticLabel;
  final Widget? placeholder;
  final Widget? errorWidget;
  final BorderRadius? borderRadius;
  final bool isCircular;

  const AppImage({
    super.key,
    required this.imagePath,
    this.width,
    this.height,
    this.fit,
    this.color,
    this.semanticLabel,
    this.placeholder,
    this.errorWidget,
    this.borderRadius,
    this.isCircular = false,
  });

  // Constructor cho ảnh tròn
  const AppImage.circular({
    super.key,
    required this.imagePath,
    required double size,
    this.fit,
    this.color,
    this.semanticLabel,
    this.placeholder,
    this.errorWidget,
  }) : width = size,
       height = size,
       borderRadius = null,
       isCircular = true;

  // Constructor cho icon
  const AppImage.icon({
    super.key,
    required this.imagePath,
    double size = 24,
    this.color,
    this.semanticLabel,
  }) : width = size,
       height = size,
       fit = null,
       placeholder = null,
       errorWidget = null,
       borderRadius = null,
       isCircular = false;

  @override
  Widget build(BuildContext context) {
    Widget image = _buildImage();

    if (isCircular) {
      image = ClipOval(child: image);
    } else if (borderRadius != null) {
      image = ClipRRect(borderRadius: borderRadius!, child: image);
    }

    return image;
  }

  Widget _buildImage() {
    if (imagePath.endsWith('.svg')) {
      return SvgPicture.asset(
        imagePath,
        width: width,
        height: height,
        fit: fit ?? BoxFit.contain,
        // ignore: deprecated_member_use
        color: color,
        semanticsLabel: semanticLabel,
        placeholderBuilder: placeholder != null ? (_) => placeholder! : null,
      );
    }

    return Image.asset(
      imagePath,
      width: width,
      height: height,
      fit: fit,
      color: color,
      semanticLabel: semanticLabel,
      errorBuilder: errorWidget != null 
        ? (context, error, stackTrace) => errorWidget!
        : null,
      frameBuilder: placeholder != null
        ? (context, child, frame, wasSynchronouslyLoaded) {
            if (wasSynchronouslyLoaded) return child;
            return frame == null ? placeholder! : child;
          }
        : null,
    );
  }
}
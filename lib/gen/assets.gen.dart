// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:lottie/lottie.dart' as _lottie;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/bottom_splash.svg
  SvgGenImage get bottomSplash =>
      const SvgGenImage('assets/images/bottom_splash.svg');

  /// File path: assets/images/customer_icon.svg
  SvgGenImage get customerIcon =>
      const SvgGenImage('assets/images/customer_icon.svg');

  /// File path: assets/images/delivery_icon.svg
  SvgGenImage get deliveryIcon =>
      const SvgGenImage('assets/images/delivery_icon.svg');

  /// File path: assets/images/first_banner.svg
  SvgGenImage get firstBanner =>
      const SvgGenImage('assets/images/first_banner.svg');

  /// File path: assets/images/login.svg
  SvgGenImage get login => const SvgGenImage('assets/images/login.svg');

  /// File path: assets/images/logo.svg
  SvgGenImage get logo => const SvgGenImage('assets/images/logo.svg');

  /// File path: assets/images/new_order.svg
  SvgGenImage get newOrder => const SvgGenImage('assets/images/new_order.svg');

  /// File path: assets/images/package_icon.svg
  SvgGenImage get packageIcon =>
      const SvgGenImage('assets/images/package_icon.svg');

  /// File path: assets/images/phone_icon.svg
  SvgGenImage get phoneIcon =>
      const SvgGenImage('assets/images/phone_icon.svg');

  /// File path: assets/images/report.svg
  SvgGenImage get report => const SvgGenImage('assets/images/report.svg');

  /// File path: assets/images/second_banner.svg
  SvgGenImage get secondBanner =>
      const SvgGenImage('assets/images/second_banner.svg');

  /// File path: assets/images/seller_icon.svg
  SvgGenImage get sellerIcon =>
      const SvgGenImage('assets/images/seller_icon.svg');

  /// File path: assets/images/services.svg
  SvgGenImage get services => const SvgGenImage('assets/images/services.svg');

  /// File path: assets/images/third_banner.svg
  SvgGenImage get thirdBanner =>
      const SvgGenImage('assets/images/third_banner.svg');

  /// File path: assets/images/tracking.svg
  SvgGenImage get tracking => const SvgGenImage('assets/images/tracking.svg');

  /// File path: assets/images/welcome.svg
  SvgGenImage get welcome => const SvgGenImage('assets/images/welcome.svg');

  /// File path: assets/images/whatsapp_icon.svg
  SvgGenImage get whatsappIcon =>
      const SvgGenImage('assets/images/whatsapp_icon.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
    bottomSplash,
    customerIcon,
    deliveryIcon,
    firstBanner,
    login,
    logo,
    newOrder,
    packageIcon,
    phoneIcon,
    report,
    secondBanner,
    sellerIcon,
    services,
    thirdBanner,
    tracking,
    welcome,
    whatsappIcon,
  ];
}

class $AssetsLottieFilesGen {
  const $AssetsLottieFilesGen();

  /// File path: assets/lottie_files/no_data.json
  LottieGenImage get noData =>
      const LottieGenImage('assets/lottie_files/no_data.json');

  /// File path: assets/lottie_files/searching.json
  LottieGenImage get searching =>
      const LottieGenImage('assets/lottie_files/searching.json');

  /// List of all assets
  List<LottieGenImage> get values => [noData, searching];
}

class $AssetsTranslationsGen {
  const $AssetsTranslationsGen();

  /// File path: assets/translations/ar.json
  String get ar => 'assets/translations/ar.json';

  /// File path: assets/translations/en.json
  String get en => 'assets/translations/en.json';

  /// List of all assets
  List<String> get values => [ar, en];
}

abstract final class Assets {
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLottieFilesGen lottieFiles = $AssetsLottieFilesGen();
  static const $AssetsTranslationsGen translations = $AssetsTranslationsGen();
}

class SvgGenImage {
  const SvgGenImage(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = false;

  const SvgGenImage.vec(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    _svg.ColorMapper? colorMapper,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
        colorMapper: colorMapper,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter:
          colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class LottieGenImage {
  const LottieGenImage(this._assetName, {this.flavors = const {}});

  final String _assetName;
  final Set<String> flavors;

  _lottie.LottieBuilder lottie({
    Animation<double>? controller,
    bool? animate,
    _lottie.FrameRate? frameRate,
    bool? repeat,
    bool? reverse,
    _lottie.LottieDelegates? delegates,
    _lottie.LottieOptions? options,
    void Function(_lottie.LottieComposition)? onLoaded,
    _lottie.LottieImageProviderFactory? imageProviderFactory,
    Key? key,
    AssetBundle? bundle,
    Widget Function(BuildContext, Widget, _lottie.LottieComposition?)?
    frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    double? width,
    double? height,
    BoxFit? fit,
    AlignmentGeometry? alignment,
    String? package,
    bool? addRepaintBoundary,
    FilterQuality? filterQuality,
    void Function(String)? onWarning,
    _lottie.LottieDecoder? decoder,
    _lottie.RenderCache? renderCache,
    bool? backgroundLoading,
  }) {
    return _lottie.Lottie.asset(
      _assetName,
      controller: controller,
      animate: animate,
      frameRate: frameRate,
      repeat: repeat,
      reverse: reverse,
      delegates: delegates,
      options: options,
      onLoaded: onLoaded,
      imageProviderFactory: imageProviderFactory,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      package: package,
      addRepaintBoundary: addRepaintBoundary,
      filterQuality: filterQuality,
      onWarning: onWarning,
      decoder: decoder,
      renderCache: renderCache,
      backgroundLoading: backgroundLoading,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

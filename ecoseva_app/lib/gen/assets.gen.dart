/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/bell-selected.png
  AssetGenImage get bellSelected =>
      const AssetGenImage('assets/icons/bell-selected.png');

  /// File path: assets/icons/bell-unselected.png
  AssetGenImage get bellUnselected =>
      const AssetGenImage('assets/icons/bell-unselected.png');

  /// File path: assets/icons/bulb.png
  AssetGenImage get bulb => const AssetGenImage('assets/icons/bulb.png');

  /// File path: assets/icons/google.png
  AssetGenImage get google => const AssetGenImage('assets/icons/google.png');

  /// File path: assets/icons/home-selected.png
  AssetGenImage get homeSelected =>
      const AssetGenImage('assets/icons/home-selected.png');

  /// File path: assets/icons/home-unselected.png
  AssetGenImage get homeUnselected =>
      const AssetGenImage('assets/icons/home-unselected.png');

  /// File path: assets/icons/lock.png
  AssetGenImage get lock => const AssetGenImage('assets/icons/lock.png');

  /// File path: assets/icons/mail.png
  AssetGenImage get mail => const AssetGenImage('assets/icons/mail.png');

  /// File path: assets/icons/plus-squared.png
  AssetGenImage get plusSquared =>
      const AssetGenImage('assets/icons/plus-squared.png');

  /// File path: assets/icons/profile-selected.png
  AssetGenImage get profileSelected =>
      const AssetGenImage('assets/icons/profile-selected.png');

  /// File path: assets/icons/profile-unselected.png
  AssetGenImage get profileUnselected =>
      const AssetGenImage('assets/icons/profile-unselected.png');

  /// File path: assets/icons/search-selected.png
  AssetGenImage get searchSelected =>
      const AssetGenImage('assets/icons/search-selected.png');

  /// File path: assets/icons/search-unselected.png
  AssetGenImage get searchUnselected =>
      const AssetGenImage('assets/icons/search-unselected.png');

  /// File path: assets/icons/trash-white.png
  AssetGenImage get trashWhite =>
      const AssetGenImage('assets/icons/trash-white.png');

  /// File path: assets/icons/trash.png
  AssetGenImage get trash => const AssetGenImage('assets/icons/trash.png');

  /// File path: assets/icons/visible-1.png
  AssetGenImage get visible1 =>
      const AssetGenImage('assets/icons/visible-1.png');

  /// File path: assets/icons/visible-2.png
  AssetGenImage get visible2 =>
      const AssetGenImage('assets/icons/visible-2.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        bellSelected,
        bellUnselected,
        bulb,
        google,
        homeSelected,
        homeUnselected,
        lock,
        mail,
        plusSquared,
        profileSelected,
        profileUnselected,
        searchSelected,
        searchUnselected,
        trashWhite,
        trash,
        visible1,
        visible2
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/dustbin.png
  AssetGenImage get dustbin => const AssetGenImage('assets/images/dustbin.png');

  /// File path: assets/images/login.png
  AssetGenImage get login => const AssetGenImage('assets/images/login.png');

  /// File path: assets/images/signup.png
  AssetGenImage get signup => const AssetGenImage('assets/images/signup.png');

  /// List of all assets
  List<AssetGenImage> get values => [dustbin, login, signup];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}

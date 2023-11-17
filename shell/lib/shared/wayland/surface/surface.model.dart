import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:veshell/manager/platform_api/platform_api.provider.dart';

part 'surface.model.freezed.dart';

@freezed
class SurfaceState with _$SurfaceState {
  const factory SurfaceState({
    required SurfaceRole role,
    required int viewId,
    required TextureId textureId,
    required TextureId oldTextureId,
    required Offset surfacePosition,
    required Size surfaceSize,
    required double scale,
    required GlobalKey widgetKey,
    required GlobalKey textureKey,
    required List<int> subsurfacesBelow,
    required List<int> subsurfacesAbove,
    required Rect inputRegion,
  }) = _SurfaceState;
}

enum SurfaceRole {
  none,
  xdgSurface,
  subsurface,
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'xdg_surface.model.freezed.dart';

@freezed
class XdgSurfaceState with _$XdgSurfaceState {
  const factory XdgSurfaceState({
    required bool mapped,
    required XdgSurfaceRole role,
    required Rect visibleBounds,
    required GlobalKey widgetKey,
    required List<int> popups,
  }) = _XdgSurfaceState;
}

enum XdgSurfaceRole {
  @JsonValue(0)
  none,
  @JsonValue(1)
  toplevel,
  @JsonValue(2)
  popup,
}

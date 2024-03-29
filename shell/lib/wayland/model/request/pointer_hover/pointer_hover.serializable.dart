import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shell/wayland/model/request/wayland_request.dart';
import 'package:shell/wayland/model/wl_surface.dart';
import 'package:shell/wayland/provider/wayland.manager.dart';

part 'pointer_hover.serializable.freezed.dart';
part 'pointer_hover.serializable.g.dart';

/// [PointerHoverRequest]
class PointerHoverRequest extends WaylandRequest {
  /// constructor
  const PointerHoverRequest({
    required PointerHoverMessage super.message,
    super.method = 'pointer_hover',
  });
}

/// Model for [PointerHoverMessage]
@freezed
class PointerHoverMessage with _$PointerHoverMessage implements WaylandMessage {
  /// Factory
  factory PointerHoverMessage({
    required SurfaceId surfaceId,
    required double x,
    required double y,
  }) = _PointerHoverMessage;

  /// Creates a new [PointerHoverMessage] instance from a map.
  ///
  /// This constructor is used by the `json_serializable` package to
  /// deserialize JSON data into a [PointerHoverMessage] instance.
  factory PointerHoverMessage.fromJson(Map<String, dynamic> json) =>
      _$PointerHoverMessageFromJson(json);
}

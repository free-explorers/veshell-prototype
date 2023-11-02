import 'package:arena_listener/arena_listener.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zenith/platform_api.dart';
import 'package:zenith/ui/common/state/surface_state.dart';
import 'package:zenith/util/mouse_button_tracker.dart';
import 'package:zenith/util/pointer_focus_manager.dart';

/// Handles all input events for a given window or popup, and redirects them to the platform which will then be
/// forwarded to the appropriate surface.
class ViewInputListener extends ConsumerWidget {
  final int viewId;
  final Widget child;

  const ViewInputListener({
    Key? key,
    required this.viewId,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pointerFocusManager = ref.read(pointerFocusManagerProvider);

    Rect inputRegion = ref.watch(surfaceStatesProvider(viewId).select((v) => v.inputRegion));

    return Stack(
      clipBehavior: Clip.none,
      children: [
        IgnorePointer(
          child: child,
        ),
        Positioned.fromRect(
          rect: inputRegion,
          child: ArenaListener(
            onPointerDown: (PointerDownEvent event) {
              _onPointerDown(ref, event, inputRegion.topLeft);
              return null;
            },
            onPointerMove: (PointerMoveEvent event, GestureDisposition? disposition) {
              if (disposition == GestureDisposition.rejected) {
                return;
              }
              _onPointerMove(ref, event, inputRegion.topLeft);
              return null;
            },
            onPointerUp: (PointerUpEvent event, GestureDisposition? disposition) {
              if (disposition == GestureDisposition.rejected) {
                return null;
              }
              _onPointerUp(ref, event);
              return GestureDisposition.accepted;
            },
            onPointerCancel: (_, __) {
              return GestureDisposition.rejected;
            },
            onLose: (event) => _onLoseArena(ref, event),
            child: Listener(
              onPointerHover: (PointerHoverEvent event) {
                if (event.kind == PointerDeviceKind.mouse) {
                  var position = event.localPosition + inputRegion.topLeft;
                  _pointerMoved(ref, position);
                }
              },
              child: MouseRegion(
                onEnter: (_) => pointerFocusManager.enterSurface(),
                onExit: (_) => pointerFocusManager.exitSurface(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _onPointerDown(WidgetRef ref, PointerEvent event, Offset inputRegionTopLeft) async {
    var position = event.localPosition + inputRegionTopLeft;

    if (event.kind == PointerDeviceKind.mouse) {
      await _pointerMoved(ref, position);
      await _sendMouseButtonsToPlatform(ref, event.buttons);
      ref.read(pointerFocusManagerProvider).startPotentialDrag();
    } else if (event.kind == PointerDeviceKind.touch) {
      await ref.read(platformApiProvider.notifier).touchDown(viewId, event.pointer, position);
    }
  }

  Future<void> _onPointerMove(WidgetRef ref, PointerEvent event, Offset inputRegionTopLeft) async {
    var position = event.localPosition + inputRegionTopLeft;

    if (event.kind == PointerDeviceKind.mouse) {
      // If a button is being pressed while another one is already down, it's considered a move event, not a down event.
      await _sendMouseButtonsToPlatform(ref, event.buttons);
      await _pointerMoved(ref, position);
    } else if (event.kind == PointerDeviceKind.touch) {
      await ref.read(platformApiProvider.notifier).touchMotion(event.pointer, position);
    }
  }

  Future<void> _onPointerUp(WidgetRef ref, PointerUpEvent event) async {
    if (event.kind == PointerDeviceKind.mouse) {
      await _sendMouseButtonsToPlatform(ref, event.buttons);
      ref.read(pointerFocusManagerProvider).stopPotentialDrag();
    } else if (event.kind == PointerDeviceKind.touch) {
      await ref.read(platformApiProvider.notifier).touchUp(event.pointer);
    }
  }

  void _onLoseArena(WidgetRef ref, PointerEvent lastPointerEvent) async {
    if (lastPointerEvent.kind == PointerDeviceKind.mouse) {
      await _sendMouseButtonsToPlatform(ref, 0);
      ref.read(pointerFocusManagerProvider).stopPotentialDrag();
    } else if (lastPointerEvent.kind == PointerDeviceKind.touch) {
      await ref.read(platformApiProvider.notifier).touchCancel(lastPointerEvent.pointer);
    }
  }

  Future<void> _sendMouseButtonsToPlatform(WidgetRef ref, int buttons) async {
    MouseButtonEvent? e = ref.read(mouseButtonTrackerProvider).trackButtonState(buttons);
    if (e != null) {
      await _mouseButtonEvent(ref, e);
    }
  }

  Future<void> _mouseButtonEvent(WidgetRef ref, MouseButtonEvent event) {
    return ref.read(platformApiProvider.notifier).sendMouseButtonEventToView(event.button, event.state == MouseButtonState.pressed);
  }

  Future<void> _pointerMoved(WidgetRef ref, Offset position) {
    return ref.read(platformApiProvider.notifier).pointerHoversView(viewId, position);
  }
}

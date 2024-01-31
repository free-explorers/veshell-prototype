import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shell/wayland/model/event/commit_surface/commit_surface.serializable.dart';
import 'package:shell/wayland/model/wl_surface.dart';
import 'package:shell/wayland/model/xdg_surface.dart';
import 'package:shell/wayland/provider/surface.manager.dart';

part 'xdg_popup_state.g.dart';

/* @Riverpod(keepAlive: true)
Popup popupWidget(PopupWidgetRef ref, SurfaceId surfaceId) {
  return Popup(
    key: ref.watch(
      xdgSurfaceStatesProvider(surfaceId).select((state) => state.widgetKey),
    ),
    surfaceId: surfaceId,
  );
} */

@riverpod
class XdgPopupState extends _$XdgPopupState {
  late final KeepAliveLink _keepAliveLink;

  @override
  XdgPopupSurface build(SurfaceId surfaceId) {
    throw Exception('XdgPopupSurface $surfaceId state was not initialized');
  }

  void initialize(XdgPopupCommitSurfaceMessage message) {
    _keepAliveLink = ref.keepAlive();
    ref.onDispose(() {
      print('disposing XdgPopupStateProvider $surfaceId');
    });
    state = XdgPopupSurface(
      surfaceId: message.surfaceId,
      parentSurfaceId: message.parentSurfaceId!,
      geometry: message.geometry ??
          Rect.fromLTWH(
            message.surface.bufferDelta?.dx ?? 0.0,
            message.surface.bufferDelta?.dy ?? 0.0,
            message.surface.bufferSize?.width ?? 0.0,
            message.surface.bufferSize?.height ?? 0.0,
          ),
    );

    ref.read(popupListForSurfaceProvider.notifier).add(
          message.parentSurfaceId!,
          message.surfaceId,
        );
  }

  void onCommit(XdgPopupCommitSurfaceMessage message) {
    state = state.copyWith(
      parentSurfaceId: message.parentSurfaceId ?? state.parentSurfaceId,
      geometry: message.geometry ??
          Rect.fromLTWH(
            message.surface.bufferDelta?.dx ?? 0.0,
            message.surface.bufferDelta?.dy ?? 0.0,
            message.surface.bufferSize?.width ?? 0.0,
            message.surface.bufferSize?.height ?? 0.0,
          ),
    );
  }

  set parentSurfaceId(int value) {
    state = state.copyWith(parentSurfaceId: value);
  }

  set geometry(Rect value) {
    state = state.copyWith(geometry: value);
  }

  void dispose() {
    ref.read(popupListForSurfaceProvider.notifier).remove(
          state.parentSurfaceId,
          state.surfaceId,
        );
    _keepAliveLink.close();
  }
}

/* @Riverpod(keepAlive: true)
GlobalKey popupStackGlobalKey(PopupStackGlobalKeyRef ref) => GlobalKey();

@Riverpod(keepAlive: true)
class PopupStackChildren extends _$PopupStackChildren {
  @override
  IList<SurfaceId> build() {
    return IList();
  }

  void add(SurfaceId surfaceId) => state = state.add(surfaceId);

  void remove(SurfaceId surfaceId) => state = state.remove(surfaceId);
} */
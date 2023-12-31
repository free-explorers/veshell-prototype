import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shell/manager/platform_api/platform_api.provider.dart';
import 'package:shell/manager/platform_api/platform_event.model.serializable.dart';
import 'package:shell/shared/wayland/subsurface/subsurface.provider.dart';
import 'package:shell/shared/wayland/surface/surface.dart';
import 'package:shell/shared/wayland/surface/surface.model.dart';
import 'package:shell/shared/wayland/xdg_surface/xdg_surface.provider.dart';

part 'surface.provider.g.dart';

@Riverpod(keepAlive: true)
SurfaceWidget surfaceWidget(SurfaceWidgetRef ref, int viewId) {
  return SurfaceWidget(
    key: ref.watch(
      surfaceStatesProvider(viewId).select((state) => state.widgetKey),
    ),
    viewId: viewId,
  );
}

@Riverpod(keepAlive: true)
class SurfaceStates extends _$SurfaceStates {
  @override
  SurfaceState build(int viewId) {
    return SurfaceState(
      role: SurfaceRole.none,
      viewId: viewId,
      textureId: TextureId(-1),
      oldTextureId: TextureId(-1),
      surfacePosition: Offset.zero,
      surfaceSize: Size.zero,
      scale: 1,
      widgetKey: GlobalKey(),
      textureKey: GlobalKey(),
      subsurfacesBelow: [],
      subsurfacesAbove: [],
      inputRegion: Rect.zero,
    );
  }

  void commit({
    required SurfaceRole role,
    required TextureId textureId,
    required Offset surfacePosition,
    required Size surfaceSize,
    required double scale,
    required List<int> subsurfacesBelow,
    required List<int> subsurfacesAbove,
    required Rect inputRegion,
  }) {
    final platform = ref.read(platformApiProvider.notifier);

    // assert(textureId != state.oldTextureId);

    var oldTexture = state.oldTextureId;
    var currentTexture = state.textureId;

    if (textureId != currentTexture) {
      if (oldTexture.value != -1) {
        platform.textureFinalizer.detach(oldTexture);
      }
      oldTexture = currentTexture;
      currentTexture = textureId;
    }

    state = state.copyWith(
      role: role,
      textureId: currentTexture,
      oldTextureId: oldTexture,
      surfacePosition: surfacePosition,
      surfaceSize: surfaceSize,
      scale: scale,
      subsurfacesBelow: subsurfacesBelow,
      subsurfacesAbove: subsurfacesAbove,
      inputRegion: inputRegion,
    );
  }

  void unmap() {
    state = state.copyWith(
      role: SurfaceRole.none,
    );
  }

  void dispose() {
    // Cascading dispose of all surface roles.
    switch (state.role) {
      case SurfaceRole.xdgSurface:
        ref.read(xdgSurfaceStatesProvider(viewId).notifier).dispose();
      case SurfaceRole.subsurface:
        ref.read(subsurfaceStatesProvider(viewId).notifier).dispose();
      case SurfaceRole.none:
        break;
    }

    ref.invalidate(surfaceWidgetProvider(viewId));

    // This refresh seems very redundant but it's actually needed.
    // Without refresh, the state persists in memory and if a Finalizer attaches to an object
    // inside the state, it will never call its finalization callback.
    final _ = ref.refresh(surfaceStatesProvider(viewId));
    ref.invalidate(surfaceStatesProvider(viewId));
  }
}

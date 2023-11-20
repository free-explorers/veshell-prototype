import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:veshell/display/monitor/screen/workspace/tileable/tileable.widget.dart';
import 'package:veshell/manager/window/window.dart';
import 'package:veshell/shared/wayland/xdg_toplevel/xdg_toplevel.provider.dart';

/// Tileable Window that persist when closed
class PersistentWindow extends Tileable {
  /// Const constructor
  const PersistentWindow({required this.viewId, super.key});

  /// The id of the wayland surface
  final int viewId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Window(key: GlobalKey(), viewId: viewId);
  }

  @override
  Widget buildPanelWidget(BuildContext context, WidgetRef ref) {
    final state = ref.watch(XdgToplevelStatesProvider(viewId));
    return Tab(child: Text(state.title));
  }
}
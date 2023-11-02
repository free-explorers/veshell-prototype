// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../../ui/common/state/xdg_surface_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$XdgSurfaceState {
  XdgSurfaceRole get role => throw _privateConstructorUsedError;
  bool get mapped => throw _privateConstructorUsedError;
  Rect get visibleBounds => throw _privateConstructorUsedError;
  GlobalKey<State<StatefulWidget>> get widgetKey =>
      throw _privateConstructorUsedError;
  List<int> get popups => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $XdgSurfaceStateCopyWith<XdgSurfaceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $XdgSurfaceStateCopyWith<$Res> {
  factory $XdgSurfaceStateCopyWith(
          XdgSurfaceState value, $Res Function(XdgSurfaceState) then) =
      _$XdgSurfaceStateCopyWithImpl<$Res, XdgSurfaceState>;
  @useResult
  $Res call(
      {XdgSurfaceRole role,
      bool mapped,
      Rect visibleBounds,
      GlobalKey<State<StatefulWidget>> widgetKey,
      List<int> popups});
}

/// @nodoc
class _$XdgSurfaceStateCopyWithImpl<$Res, $Val extends XdgSurfaceState>
    implements $XdgSurfaceStateCopyWith<$Res> {
  _$XdgSurfaceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = null,
    Object? mapped = null,
    Object? visibleBounds = null,
    Object? widgetKey = null,
    Object? popups = null,
  }) {
    return _then(_value.copyWith(
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as XdgSurfaceRole,
      mapped: null == mapped
          ? _value.mapped
          : mapped // ignore: cast_nullable_to_non_nullable
              as bool,
      visibleBounds: null == visibleBounds
          ? _value.visibleBounds
          : visibleBounds // ignore: cast_nullable_to_non_nullable
              as Rect,
      widgetKey: null == widgetKey
          ? _value.widgetKey
          : widgetKey // ignore: cast_nullable_to_non_nullable
              as GlobalKey<State<StatefulWidget>>,
      popups: null == popups
          ? _value.popups
          : popups // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_XdgSurfaceStateCopyWith<$Res>
    implements $XdgSurfaceStateCopyWith<$Res> {
  factory _$$_XdgSurfaceStateCopyWith(
          _$_XdgSurfaceState value, $Res Function(_$_XdgSurfaceState) then) =
      __$$_XdgSurfaceStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {XdgSurfaceRole role,
      bool mapped,
      Rect visibleBounds,
      GlobalKey<State<StatefulWidget>> widgetKey,
      List<int> popups});
}

/// @nodoc
class __$$_XdgSurfaceStateCopyWithImpl<$Res>
    extends _$XdgSurfaceStateCopyWithImpl<$Res, _$_XdgSurfaceState>
    implements _$$_XdgSurfaceStateCopyWith<$Res> {
  __$$_XdgSurfaceStateCopyWithImpl(
      _$_XdgSurfaceState _value, $Res Function(_$_XdgSurfaceState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = null,
    Object? mapped = null,
    Object? visibleBounds = null,
    Object? widgetKey = null,
    Object? popups = null,
  }) {
    return _then(_$_XdgSurfaceState(
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as XdgSurfaceRole,
      mapped: null == mapped
          ? _value.mapped
          : mapped // ignore: cast_nullable_to_non_nullable
              as bool,
      visibleBounds: null == visibleBounds
          ? _value.visibleBounds
          : visibleBounds // ignore: cast_nullable_to_non_nullable
              as Rect,
      widgetKey: null == widgetKey
          ? _value.widgetKey
          : widgetKey // ignore: cast_nullable_to_non_nullable
              as GlobalKey<State<StatefulWidget>>,
      popups: null == popups
          ? _value._popups
          : popups // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc

class _$_XdgSurfaceState
    with DiagnosticableTreeMixin
    implements _XdgSurfaceState {
  const _$_XdgSurfaceState(
      {required this.role,
      required this.mapped,
      required this.visibleBounds,
      required this.widgetKey,
      required final List<int> popups})
      : _popups = popups;

  @override
  final XdgSurfaceRole role;
  @override
  final bool mapped;
  @override
  final Rect visibleBounds;
  @override
  final GlobalKey<State<StatefulWidget>> widgetKey;
  final List<int> _popups;
  @override
  List<int> get popups {
    if (_popups is EqualUnmodifiableListView) return _popups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_popups);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'XdgSurfaceState(role: $role, mapped: $mapped, visibleBounds: $visibleBounds, widgetKey: $widgetKey, popups: $popups)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'XdgSurfaceState'))
      ..add(DiagnosticsProperty('role', role))
      ..add(DiagnosticsProperty('mapped', mapped))
      ..add(DiagnosticsProperty('visibleBounds', visibleBounds))
      ..add(DiagnosticsProperty('widgetKey', widgetKey))
      ..add(DiagnosticsProperty('popups', popups));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_XdgSurfaceState &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.mapped, mapped) || other.mapped == mapped) &&
            (identical(other.visibleBounds, visibleBounds) ||
                other.visibleBounds == visibleBounds) &&
            (identical(other.widgetKey, widgetKey) ||
                other.widgetKey == widgetKey) &&
            const DeepCollectionEquality().equals(other._popups, _popups));
  }

  @override
  int get hashCode => Object.hash(runtimeType, role, mapped, visibleBounds,
      widgetKey, const DeepCollectionEquality().hash(_popups));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_XdgSurfaceStateCopyWith<_$_XdgSurfaceState> get copyWith =>
      __$$_XdgSurfaceStateCopyWithImpl<_$_XdgSurfaceState>(this, _$identity);
}

abstract class _XdgSurfaceState implements XdgSurfaceState {
  const factory _XdgSurfaceState(
      {required final XdgSurfaceRole role,
      required final bool mapped,
      required final Rect visibleBounds,
      required final GlobalKey<State<StatefulWidget>> widgetKey,
      required final List<int> popups}) = _$_XdgSurfaceState;

  @override
  XdgSurfaceRole get role;
  @override
  bool get mapped;
  @override
  Rect get visibleBounds;
  @override
  GlobalKey<State<StatefulWidget>> get widgetKey;
  @override
  List<int> get popups;
  @override
  @JsonKey(ignore: true)
  _$$_XdgSurfaceStateCopyWith<_$_XdgSurfaceState> get copyWith =>
      throw _privateConstructorUsedError;
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../ui/common/state/desktop_entries.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$installedDesktopEntriesHash() =>
    r'77511f1f86cebed6c9398afc8f4bca3c6e80be73';

/// See also [installedDesktopEntries].
@ProviderFor(installedDesktopEntries)
final installedDesktopEntriesProvider =
    FutureProvider<Map<String, DesktopEntry>>.internal(
  installedDesktopEntries,
  name: r'installedDesktopEntriesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$installedDesktopEntriesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef InstalledDesktopEntriesRef
    = FutureProviderRef<Map<String, DesktopEntry>>;
String _$localizedDesktopEntriesHash() =>
    r'02d8c968877bca2facaf946bb9c7360536b6f686';

/// See also [localizedDesktopEntries].
@ProviderFor(localizedDesktopEntries)
final localizedDesktopEntriesProvider =
    FutureProvider<Map<String, LocalizedDesktopEntry>>.internal(
  localizedDesktopEntries,
  name: r'localizedDesktopEntriesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$localizedDesktopEntriesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LocalizedDesktopEntriesRef
    = FutureProviderRef<Map<String, LocalizedDesktopEntry>>;
String _$appDrawerDesktopEntriesHash() =>
    r'3775e827149d70022189fb6a7abd0463c180040d';

/// See also [appDrawerDesktopEntries].
@ProviderFor(appDrawerDesktopEntries)
final appDrawerDesktopEntriesProvider =
    FutureProvider<Iterable<LocalizedDesktopEntry>>.internal(
  appDrawerDesktopEntries,
  name: r'appDrawerDesktopEntriesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$appDrawerDesktopEntriesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AppDrawerDesktopEntriesRef
    = FutureProviderRef<Iterable<LocalizedDesktopEntry>>;
String _$iconThemesHash() => r'4732eeb6d4c6b6f7c833dfb52b471bbdfd74592c';

/// See also [iconThemes].
@ProviderFor(iconThemes)
final iconThemesProvider = FutureProvider<FreedesktopIconThemes>.internal(
  iconThemes,
  name: r'iconThemesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$iconThemesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef IconThemesRef = FutureProviderRef<FreedesktopIconThemes>;
String _$iconHash() => r'54123dbf6e4985c2ec76b742f229966761ed54f3';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

typedef IconRef = FutureProviderRef<File?>;

/// See also [icon].
@ProviderFor(icon)
const iconProvider = IconFamily();

/// See also [icon].
class IconFamily extends Family<AsyncValue<File?>> {
  /// See also [icon].
  const IconFamily();

  /// See also [icon].
  IconProvider call(
    IconQuery query,
  ) {
    return IconProvider(
      query,
    );
  }

  @override
  IconProvider getProviderOverride(
    covariant IconProvider provider,
  ) {
    return call(
      provider.query,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'iconProvider';
}

/// See also [icon].
class IconProvider extends FutureProvider<File?> {
  /// See also [icon].
  IconProvider(
    this.query,
  ) : super.internal(
          (ref) => icon(
            ref,
            query,
          ),
          from: iconProvider,
          name: r'iconProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$iconHash,
          dependencies: IconFamily._dependencies,
          allTransitiveDependencies: IconFamily._allTransitiveDependencies,
        );

  final IconQuery query;

  @override
  bool operator ==(Object other) {
    return other is IconProvider && other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$fileToScalableImageHash() =>
    r'cdee05cbedc6229524232afe652f39fafdb7da6f';
typedef FileToScalableImageRef = FutureProviderRef<ScalableImage>;

/// See also [fileToScalableImage].
@ProviderFor(fileToScalableImage)
const fileToScalableImageProvider = FileToScalableImageFamily();

/// See also [fileToScalableImage].
class FileToScalableImageFamily extends Family<AsyncValue<ScalableImage>> {
  /// See also [fileToScalableImage].
  const FileToScalableImageFamily();

  /// See also [fileToScalableImage].
  FileToScalableImageProvider call(
    String path,
  ) {
    return FileToScalableImageProvider(
      path,
    );
  }

  @override
  FileToScalableImageProvider getProviderOverride(
    covariant FileToScalableImageProvider provider,
  ) {
    return call(
      provider.path,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'fileToScalableImageProvider';
}

/// See also [fileToScalableImage].
class FileToScalableImageProvider extends FutureProvider<ScalableImage> {
  /// See also [fileToScalableImage].
  FileToScalableImageProvider(
    this.path,
  ) : super.internal(
          (ref) => fileToScalableImage(
            ref,
            path,
          ),
          from: fileToScalableImageProvider,
          name: r'fileToScalableImageProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fileToScalableImageHash,
          dependencies: FileToScalableImageFamily._dependencies,
          allTransitiveDependencies:
              FileToScalableImageFamily._allTransitiveDependencies,
        );

  final String path;

  @override
  bool operator ==(Object other) {
    return other is FileToScalableImageProvider && other.path == path;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, path.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions

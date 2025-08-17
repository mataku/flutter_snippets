import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';

part 'menu.freezed.dart';

@freezed
abstract class Menu with _$Menu {
  const factory Menu({
    required String name,
    required String description,
    required GoRouteData route,
  }) = _Menu;
}

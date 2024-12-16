import 'package:bloc/bloc.dart';
import 'package:ex_app/core/servcie/shared_pref/pref_keys.dart';
import 'package:ex_app/core/servcie/shared_pref/shared_pref.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.dart';

part 'app_cubit.freezed.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState.initial());
  bool isDark = true;

  Future<void> changeAppThemeMode({bool? sharedMode}) async {
    if (sharedMode != null) {
      isDark = sharedMode;
      emit(
        AppState.themeChangeMode(
          isDark: sharedMode,
        ),
      );
    } else {
      isDark = !isDark;
      await SharedPref()
          .setBoolean(
            PrefKeys.themeMode,
            isDark,
          )
          .then(
            (value) => emit(
              AppState.themeChangeMode(
                isDark: isDark,
              ),
            ),
          );
    }
  }
}

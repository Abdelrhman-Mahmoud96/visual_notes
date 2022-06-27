import 'package:get_it/get_it.dart';
import 'package:visual_notes/features/data/database/app_database.dart';
import 'package:visual_notes/features/data/database/database_constants.dart';
import 'package:visual_notes/features/data/repository/note_database_repository.dart';
import 'package:visual_notes/features/domain/entities/note.dart';
import 'package:visual_notes/features/domain/repository/note_repository.dart';
import 'package:visual_notes/features/domain/use_cases/use_case_add_note.dart';
import 'package:visual_notes/features/domain/use_cases/use_case_delete_note.dart';
import 'package:visual_notes/features/domain/use_cases/use_case_get_notes.dart';
import 'package:visual_notes/features/domain/use_cases/use_case_update_note.dart';
import 'package:visual_notes/features/presentation/home/bloc/home_bloc.dart';
import 'package:visual_notes/features/presentation/save_note/bloc/save_note_bloc.dart';

final getIt = GetIt.asNewInstance();

Future<void> initDependencies() async{
  final database = await $FloorAppDatabase
      .databaseBuilder(kDatabaseName).build();

  getIt..registerLazySingleton<AppDatabase>(() => database)

       ..registerLazySingleton<INoteRepository>(() =>
           NoteDatabaseRepository(database: getIt()),
       )

    ..registerLazySingleton<UseCaseAddNote>(() =>
        UseCaseAddNote(noteRepository: getIt()),
    )

    ..registerLazySingleton<UseCaseGetNotes>(() =>
        UseCaseGetNotes(noteRepository: getIt()),
    )

    ..registerLazySingleton<UseCaseUpdateNote>(() =>
        UseCaseUpdateNote(noteRepository: getIt()),
    )

    ..registerLazySingleton<UseCaseDeleteNote>(() =>
        UseCaseDeleteNote(noteRepository: getIt()),
    )

    ..registerFactory<HomeBloc>(() =>
        HomeBloc(
            useCaseGetNotes: getIt(),
            useCaseDeleteNote: getIt(),
            useCaseAddNote: getIt(),
            useCaseUpdateNote: getIt(),
        ),
    )

    ..registerFactoryParam<SaveNoteBloc, Note?, void>((param1, _) =>
        SaveNoteBloc(
            useCaseAddNote: getIt(),
            useCaseUpdateNote: getIt(),
            initialNote: param1,
        ),
    );


}

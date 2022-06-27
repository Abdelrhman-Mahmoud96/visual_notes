import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visual_notes/features/presentation/home/bloc/home_bloc.dart';
import 'package:visual_notes/features/presentation/home/utils/filter.dart';
import 'package:visual_notes/l10n/l10n.dart';

class NoteFilterButton extends StatelessWidget {
  const NoteFilterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final activeFilter = context.select((HomeBloc bloc) =>
    bloc.state.noteViewFilter,);

    return PopupMenuButton<NoteViewFilter>(
        shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        initialValue: activeFilter,
        tooltip: l10n.noteFilterTooltip,
        onSelected: (filter){
          context.read<HomeBloc>().add(HomeEvent.filterChanged(filter: filter));
        },
        itemBuilder: (context){
          return [
            PopupMenuItem(
              value: NoteViewFilter.all,
              child: Text(l10n.noteFilterAll),
          ),
            PopupMenuItem(
                value: NoteViewFilter.isOpen,
                child: Text(l10n.noteFilterOpenOnly),
            ),
            PopupMenuItem(
                value: NoteViewFilter.isClosed,
                child: Text(l10n.noteFilterClosedOnly),
            ),
          ];
        },
      icon: const Icon(Icons.filter_list_rounded),
    );
  }
}

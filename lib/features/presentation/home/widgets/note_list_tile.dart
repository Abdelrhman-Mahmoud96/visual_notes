import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:visual_notes/features/data/database/database_constants.dart';
import 'package:visual_notes/features/domain/entities/note.dart';
import 'package:visual_notes/theme/note_colors.dart';

class NoteListTile extends StatelessWidget {
  const NoteListTile({
    Key? key,
    required this.note,
    this.onDismissed,
    this.onTab,
    this.onToggleClosed,
  }) : super(key: key);

  final Note? note;
  final DismissDirectionCallback? onDismissed;
  final VoidCallback? onTab;
  final ValueChanged<bool>? onToggleClosed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final captionColor = theme.textTheme.caption?.color;

    return Dismissible(
      key: Key('note_list_dismissible_${note!.id}'),
      onDismissed: onDismissed,
      direction: DismissDirection.endToStart,
      background: Container(
        color: NoteColors.visualBlue,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: const Icon(Icons.delete, color: NoteColors.visualPrimaryWhite,),
      ),
      child: ListTile(
        onTap: onTab,
        title: Text(
          note!.title!,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: !note!.isClosed
              ? null
              : TextStyle(
            color: captionColor,
            decoration: TextDecoration.lineThrough,
          ),
        ),
        subtitle: Text(
          DateFormat(kDateFormat).format(note!.date),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        leading: Checkbox(
          shape: const CircleBorder(),
          value: note!.isClosed,
          onChanged: onToggleClosed == null
              ? null
              : (value) => onToggleClosed!(value!),
        ),
        trailing: onTab == null
            ? null
            : const Icon(Icons.chevron_right),
      ),
    );
  }
}

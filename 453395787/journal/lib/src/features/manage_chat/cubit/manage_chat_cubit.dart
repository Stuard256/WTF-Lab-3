import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../common/api/chat_repository_api.dart';
import '../../../common/models/chat_view.dart';
import '../../../common/utils/icons.dart';

part 'manage_chat_state.dart';

part 'manage_chat_cubit.freezed.dart';

class ManageChatCubit extends Cubit<ManageChatState> {
  ManageChatCubit({
    required this.repository,
    required ManageChatState manageChatState,
  }) : super(manageChatState);

  final ChatRepositoryApi repository;

  void onIconSelected(int? id) {
    emit(state.copyWith(selectedIcon: id));
  }

  void onNameChanged(String name) {
    emit(state.copyWith(name: name));
  }

  void applyChanges() {
    state.map(
      adding: (adding) {
        final creationDate = DateTime.now();
        repository.add(
          ChatView(
            id: 0,
            icon: JournalIcons.icons[state.selectedIcon!],
            name: adding.name,
            messagePreview: 'Write your first message!',
            messagePreviewCreationTime: creationDate,
            messageAmount: 0,
            isPinned: false,
            creationDate: creationDate,
          ),
        );
      },
      editing: (editing) {
        repository.update(
          editing.chat.copyWith(
            icon: JournalIcons.icons[state.selectedIcon!],
            name: state.name,
          ),
        );
      },
    );
  }
}

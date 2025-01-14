import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/data/database/chat_database.dart';
import '../../cubit/tag_selector/tags_cubit.dart';

class TagSelectorScope extends StatelessWidget {
  const TagSelectorScope({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TagsCubit(
        messageProviderApi: context.read<ChatDatabase>(),
      ),
      child: child,
    );
  }

  static TagsCubit of(BuildContext context) {
    return context.read<TagsCubit>();
  }
}

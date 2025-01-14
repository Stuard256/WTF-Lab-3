import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:my_final_project/generated/l10n.dart';
import 'package:my_final_project/ui/screens/add_page_screen.dart';
import 'package:my_final_project/ui/widgets/settings_screen/cubit/settings_cubit.dart';
import 'package:share_plus/share_plus.dart';

class SettingBody extends StatefulWidget {
  const SettingBody({super.key});

  @override
  State<SettingBody> createState() => _SettingBodyState();
}

class _SettingBodyState extends State<SettingBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: ListView(
        children: [
          const Divider(),
          ListTile(
            leading: const Icon(Icons.add),
            title: Text(
              S.of(context).add_section,
              style: TextStyle(
                fontSize: context.watch<SettingCubit>().state.textTheme.bodyText1!.fontSize,
              ),
            ),
            onTap: () {
              context.read<SettingCubit>().changeAddStatus();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AddNewScreen(
                    textController: '',
                  ),
                ),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.invert_colors),
            title: Text(
              S.of(context).change_theme,
              style: TextStyle(
                fontSize: context.watch<SettingCubit>().state.textTheme.bodyText1!.fontSize,
              ),
            ),
            subtitle: Text(
              'Light/Dark',
              style: TextStyle(
                fontSize: context.watch<SettingCubit>().state.textTheme.bodyText2!.fontSize,
              ),
            ),
            onTap: context.read<SettingCubit>().changeTheme,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.text_fields),
            title: Text(
              S.of(context).cnange_font_size,
              style: TextStyle(
                fontSize: context.watch<SettingCubit>().state.textTheme.bodyText2!.fontSize,
              ),
            ),
            subtitle: Text(
              'Small/Medium/Large',
              style: TextStyle(
                fontSize: context.watch<SettingCubit>().state.textTheme.bodyText2!.fontSize,
              ),
            ),
            onTap: context.read<SettingCubit>().changeFontSize,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.image),
            title: Text(
              S.of(context).choose_image,
              style: TextStyle(
                fontSize: context.watch<SettingCubit>().state.textTheme.bodyText2!.fontSize,
              ),
            ),
            onTap: context.read<SettingCubit>().changeBackgroundImage,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.bubble_chart),
            title: Text(
              S.of(context).change_bubble_alignment,
              style: TextStyle(
                fontSize: context.watch<SettingCubit>().state.textTheme.bodyText2!.fontSize,
              ),
            ),
            subtitle: Text(
              'Left/Right',
              style: TextStyle(
                fontSize: context.watch<SettingCubit>().state.textTheme.bodyText2!.fontSize,
              ),
            ),
            onTap: context.read<SettingCubit>().changeBubbleAligment,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.align_horizontal_left),
            title: Text(
              S.of(context).change_date_bubble,
              style: TextStyle(
                fontSize: context.watch<SettingCubit>().state.textTheme.bodyText2!.fontSize,
              ),
            ),
            subtitle: Text(
              'Left/Center',
              style: TextStyle(
                fontSize: context.watch<SettingCubit>().state.textTheme.bodyText2!.fontSize,
              ),
            ),
            onTap: context.read<SettingCubit>().changeDateBubble,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.share),
            title: Text(
              S.of(context).share_app,
              style: TextStyle(
                fontSize: context.watch<SettingCubit>().state.textTheme.bodyText2!.fontSize,
              ),
            ),
            onTap: () {
              Share.share('It\'s my app');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.restore_rounded),
            title: Text(
              S.of(context).reset_setting,
              style: TextStyle(
                fontSize: context.watch<SettingCubit>().state.textTheme.bodyText2!.fontSize,
              ),
            ),
            onTap: context.read<SettingCubit>().resetSetting,
          ),
          const Divider(),
        ],
      ),
    );
  }
}

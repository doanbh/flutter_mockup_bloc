import 'package:flutter/material.dart';
import 'package:flutter_mockup_bloc/core/view_model/global/global_viewmodel.dart';
import 'package:flutter_mockup_bloc/provider/data_provider_widget.dart';
import 'package:flutter_mockup_bloc/resource/app_colors.dart';
import 'package:flutter_mockup_bloc/resource/gaps.dart';
import 'package:provider/provider.dart';

class SelectThemeDialog extends StatelessWidget {
  final VoidCallback goBack;

  const SelectThemeDialog({
    required this.goBack,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final globalViewModel = Provider.of<GlobalViewModel>(context);
    return DataProviderWidget(
      childBuilderLocalization: (context, localization) => AlertDialog(
        title: Text(localization.debugLocaleSelector),
        content: SizedBox(
          height: 150,
          width: MediaQuery.of(context).size.width / 1.2,
          child: ListView(
            shrinkWrap: true,
            children: [
              SelectorItem(
                title: 'Sáng',
                selected: globalViewModel.themeMode == ThemeMode.light,
                onClick: () {
                  globalViewModel.updateThemeMode(ThemeMode.light);
                  goBack();
                },
              ),
              SelectorItem(
                title: 'Tối',
                selected: globalViewModel.themeMode == ThemeMode.dark,
                onClick: () {
                  globalViewModel.updateThemeMode(ThemeMode.dark);
                  goBack();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SelectorItem extends StatelessWidget {
  final VoidCallback onClick;
  final String title;
  final bool selected;

  const SelectorItem({
    required this.onClick,
    required this.title,
    required this.selected,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilderTheme: (context, theme) => GestureDetector(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title),
              Gaps.hGap10,
              Opacity(
                opacity: selected ? 1 : 0,
                child: Icon(Icons.check_circle, color: AppColors.primary),
              ),
            ],
          ),
        ),
        onTap: onClick,
      ),
    );
  }
}


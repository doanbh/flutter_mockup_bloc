import 'package:flutter/material.dart';
import 'package:flutter_mockup_bloc/resource/app_colors.dart';
import 'package:flutter_mockup_bloc/resource/gaps.dart';

class CommonWidget {
  static const CircularProgressIndicator loadingCircle =
      CircularProgressIndicator(
    color: AppColors.primary,
  );

  static const Center centerLoadingCircle = Center(
    child: CircularProgressIndicator(
      color: AppColors.primary,
    ),
  );

  static const Padding sectionLoading = Padding(
    padding: EdgeInsets.only(top: 12),
    child: Center(
      child: loadingCircle,
    ),
  );

  static const SizedBox screenBodyLoading = SizedBox.expand(
    child: Center(
      child: loadingCircle,
    ),
  );

  static Widget getEmptySection(Text text, {double? verticalPadding = 30}) {
    final Widget current = Center(child: text);

    if (verticalPadding != null)
      return Padding(
        padding: EdgeInsets.symmetric(vertical: verticalPadding),
        child: current,
      );

    return current;
  }

  static Padding getLoadingSection({
    double verticalPadding = 60,
    double? bottomPadding,
  }) =>
      Padding(
        padding: EdgeInsets.symmetric(vertical: verticalPadding)
            .copyWith(bottom: bottomPadding),
        child: Center(child: loadingCircle),
      );

  static ListView getListViewBuilder({
    EdgeInsetsGeometry? padding = const EdgeInsets.only(top: 40, bottom: 20),
    required List<Widget> children,
  }) =>
      ListView.builder(
        padding: padding,
        itemCount: children.length,
        itemBuilder: (_, index) => children[index],
      );

  static SingleChildScrollView getSingleChildScrollView({
    EdgeInsetsGeometry? padding = const EdgeInsets.only(top: 40, bottom: 20),
    required List<Widget> children,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start,
  }) =>
      SingleChildScrollView(
        padding: padding,
        child: Column(
          crossAxisAlignment: crossAxisAlignment,
          children: children,
        ),
      );

  static Row getFormFieldPrefixIconPainter(CustomPaint icon) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(width: 18),
          icon,
        ],
      );

  static Row getFormFieldSuffixIconPainter(CustomPaint icon) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          const SizedBox(width: 18),
        ],
      );

  static Widget getRoundedImage(
    ImageProvider<Object> imageProvider,
    radius, [
    BoxDecoration? imageDecoration,
  ]) =>
      DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
          borderRadius: imageDecoration?.shape == BoxShape.circle
              ? null
              : imageDecoration?.borderRadius ??
                  BorderRadius.all(Radius.circular((radius))),
          color: imageDecoration?.color,
          border: imageDecoration?.border,
          boxShadow: imageDecoration?.boxShadow,
        ).copyWith(
          shape: imageDecoration?.shape,
        ),
      );

  /// Uniform width of all widgets in input list except SizedBox
  static List<Widget> uniformWidth(List<Widget> list) =>
      list.map((e) => e is SizedBox ? e : Expanded(flex: 1, child: e)).toList();

  static List<Widget> addPadding(
          List<Widget> list, EdgeInsetsGeometry padding) =>
      list.length == 0
          ? list
          : list.map((e) => Padding(padding: padding, child: e)).toList();

  static List<Widget> addSizedBoxAsSeparator(
          SizedBox sizedBox, List<Widget> widgets) =>
      widgets.length == 0
          ? widgets
          : widgets.expand((element) => [element, sizedBox]).toList()
        ..removeLast();

  static Size getResponsiveSizeBaseOnScreenWidth(
          BuildContext context, double delta) =>
      Size(
        MediaQuery.of(context).size.width,
        (MediaQuery.of(context).size.width * delta).toDouble(),
      );

  /// widthDelta = image's width / design screen's width
  ///
  /// heightDelta = image's height / image's width
  static Size getResponsiveSizeBaseOnWidth(
      BuildContext context, double widthDelta, double heightDelta) {
    final screenWidth = MediaQuery.of(context).size.width;
    final width = screenWidth * widthDelta;
    return Size(
      width,
      (width * heightDelta).toDouble(),
    );
  }
}

extension WidgetListExtension<Widget> on List<Widget> {
  addHorizontalSpacing(double size) => this.length == 0
      ? this
      : this
          .expand((element) => [
                element,
                SizedBox(width: size),
              ])
          .toList()
    ..removeLast();

  addVerticalSpacing(double size) => this.length == 0
      ? this
      : this
          .expand((element) => [
                element,
                SizedBox(height: size),
              ])
          .toList()
    ..removeLast();

  addSizedBoxAsSeparator(SizedBox sizedBox) => this.length == 0
      ? this
      : this.expand((element) => [element, sizedBox]).toList()
    ..removeLast();

  // uniformWidth({
  //   BuildContext? context,
  //   double? parentWidth,
  //   double horizontalPadding = 16,
  //   double spaceBetweenChildren = 20,
  // }) {
  //   final double childrenWidth =
  //       ((context != null ? MediaQuery.of(context).size.width : parentWidth!) /
  //               1.9) -
  //           horizontalPadding -
  //           spaceBetweenChildren;

  //   return this
  //       .map((e) => e is SizedBox
  //           ? e
  //           : SizedBox(
  //               width: childrenWidth,
  //               child: e,
  //             ))
  //       .toList();
  // }

  // Error: The argument type 'Widget/*1*/' can't be assigned to the parameter type 'Widget/*2*/'
  // uniformWidth() => this
  //     .map((e) => e is SizedBox
  //         ? e
  //         : Expanded(
  //             flex: 1,
  //             // ignore_for_file: argument_type_not_assignable
  //             child: e,
  //           ))
  //     .toList();
}

class SizedBoxExt {
  static const shrink = SizedBox.shrink();

  static const w5 = SizedBox(width: 5);

  static const h10 = SizedBox(height: 10);
  static const w10 = SizedBox(width: 10);

  static const h12 = SizedBox(height: 12);

  static const w16 = SizedBox(width: 16);

  static const h15 = SizedBox(height: 15);

  static const h20 = SizedBox(height: 20);
  static const w20 = SizedBox(width: 20);

  static const h30 = SizedBox(height: 30);
  static const h40 = SizedBox(height: 40);
  static const h50 = SizedBox(height: 50);

  static const sliverH16 = SliverToBoxAdapter(child: SizedBox(height: 16));
  static const sliverH20 = SliverToBoxAdapter(child: SizedBox(height: 20));
}

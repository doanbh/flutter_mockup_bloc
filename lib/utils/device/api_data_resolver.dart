
import 'package:flutter_mockup_bloc/model/selectable_item.dart';

class ApiDataResolver {
  /// Trường hơp tỉnh/thành phố là: Toàn quốc
  static final SelectableItem nationalSelectableItem =
      SelectableItem(id: '0', name: 'Toàn quốc');

  static final SelectableItem allCareerSelectableItem =
      SelectableItem(id: '0', name: 'Tất cả');

  /// Xử lý trường hợp tỉnh/thành phố là: Toàn quốc
  static bool isNational(String? cityId) => cityId == nationalSelectableItem.id;

  /// Xử lý trường hợp tỉnh/thành phố là: Toàn quốc
  static String resolveCityName({
    required String cityId,
    required String? cityName,
  }) =>
      isNational(cityId) ? nationalSelectableItem.name : cityName!;

  /// Xử lý trường hợp tỉnh/thành phố là: Toàn quốc
  static String resolveDistrictName({
    required String cityId,
    required String districtName,
  }) =>
      isNational(cityId) ? '' : districtName;
}

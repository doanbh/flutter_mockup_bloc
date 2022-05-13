import 'dart:async';
import 'dart:convert';

import 'package:flutter_mockup_bloc/common/common_export.dart';
import 'package:flutter_mockup_bloc/core/error_handling/exceptions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_mockup_bloc/core/net/api.dart';
import 'package:flutter_mockup_bloc/core/net/dio_utils.dart';
import 'package:flutter_mockup_bloc/model/City.dart';
import 'package:flutter_mockup_bloc/model/request_response.dart';
import 'package:flutter_mockup_bloc/model/selectable_item.dart';
import 'package:flutter_mockup_bloc/repository/base_repository.dart';
import 'package:flutter_mockup_bloc/resource/app_constant.dart';
import 'package:flutter_mockup_bloc/utils/device/api_data_resolver.dart';
import 'package:sp_util/sp_util.dart';

class CommonDataRepo {
  final LocalDataStorageService _localDataStorageService;
  final _MemoryCacheManager _memoryCacheManager;
  final _RemoteDataRepo _remoteDataRepo;

  static CommonDataRepo? _instance;

  factory CommonDataRepo() => _instance ??= CommonDataRepo._();

  CommonDataRepo._()
      : _localDataStorageService = LocalDataStorageService(),
        _memoryCacheManager = _MemoryCacheManager(),
        _remoteDataRepo = _RemoteDataRepo();

  Future<void> loadCommonData() async {
    await getCity();
  }

  /// --------------------------------------------------------------------------
  ///                                  City
  /// --------------------------------------------------------------------------

  Future<List<SelectableItem>> getCity() async {
    if (_memoryCacheManager.city.hasData)
      return _memoryCacheManager.city.retrieveData();

    try {
      _memoryCacheManager.city.update(
        _localDataStorageService.containsCityData()
            ? _localDataStorageService
                .getListCityData()
                .map((e) => SelectableItem.fromJsonCity(e))
            : await _remoteDataRepo.getCity(
                (rawData) =>
                    _localDataStorageService.saveCityResponeData(rawData),
              ),
      );
    } catch (e) {
      rethrow;
    }

    return _memoryCacheManager.city.retrieveData();
  }

  Future<List<SelectableItem>> getGeneralCity() async {
    try {
      return List.unmodifiable([
        ApiDataResolver.nationalSelectableItem,
        ...(await getCity()),
      ]);
    } catch (e) {
      rethrow;
    }
  }

  String getCityName(String id) {
    try {
      return _memoryCacheManager.city
          .firstWhere(SelectableItemExt.equalIdTester(id))
          .name;
    } catch (e) {
      throw DataNotFoundException(
          'City.id == $id', 'CommonDataRepo.getCityName()');
    }
  }

  String? getNullableCityName(String id) {
    try {
      return getCityName(id);
    } catch (e) {
      return null;
    }
  }

  SelectableItem getCitySelectableItem(String id) {
    try {
      return SelectableItem(
        id: id,
        name: getCityName(id),
      );
    } catch (e) {
      throw DataNotFoundException(
          'City.id == $id', 'CommonDataRepo.getCityName()');
    }
  }

}

typedef _RawDataCallback = void Function(dynamic);

class _RemoteDataRepo extends BaseRepo{

  // _RemoteDataRepo({required cubit}) : super(cubit: cubit);

  // final ApiClient _client;
  //
  // _RemoteDataRepo() : _client = ApiClient();
  //
  Future<Iterable<SelectableItem>> getCity(_RawDataCallback onData) async {
    // RequestResponse res = await _client.fetch(ApiPath.city, RequestMethod.post);
    try {
      City res = await requestNetwork<City>(Method.get, url: Api.GET_LIST_CITY);

      onData(jsonEncode(res.data!.items!));

      return res.data!.items!.map((e) => SelectableItem(id: e.code.toString(), name: e.name.toString())).toList();
    } catch (e){
      return [];
    }
  }
}

class _MemoryCacheManager {
  _MemoryCacheManager()
      : city = _InMemoryListDataCacheStorage();

  final _InMemoryListDataCacheStorage city;
  late final _InMemoryMapDataCacheStorage district =
      _InMemoryMapDataCacheStorage();
  late final _InMemoryListDataCacheStorage bussinessArea =
      _InMemoryListDataCacheStorage();
}

class _InMemoryListDataCacheStorage {
  _InMemoryListDataCacheStorage() : _data = [];

  List<SelectableItem> _data;

  bool get hasData => _data.isNotEmpty;

  List<SelectableItem> retrieveData() => List.unmodifiable(_data);

  /// Returns the first element that satisfies the given predicate [test].
  ///
  /// Iterates through elements and returns the first to satisfy [test].
  ///
  /// If no element satisfies [test], the result of invoking the [orElse]
  /// function is returned.
  /// If [orElse] is omitted, it defaults to throwing a [StateError].
  SelectableItem firstWhere(
    bool Function(SelectableItem) test, {
    SelectableItem Function()? orElse,
  }) {
    return _data.firstWhere(test, orElse: orElse);
  }

  void update(Iterable<SelectableItem> data) => _data = data.toList();
}

class _InMemoryMapDataCacheStorage {
  _InMemoryMapDataCacheStorage() : _data = {};

  Map<String, List<SelectableItem>> _data;

  bool hasData(String key) => _data[key] != null;

  List<SelectableItem>? retrieveData(String key) =>
      _data[key] == null ? null : List.unmodifiable(_data[key]!);

  /// Returns the first element that satisfies the given predicate [key] & [test].
  ///
  /// Iterates through elements and returns the first to satisfy [test].
  ///
  /// If there is no value for the given [key], throwing a [StateError]
  /// If no element satisfies [test], the result of invoking the [orElse]
  /// function is returned.
  /// If [orElse] is omitted, it defaults to throwing a [StateError].
  SelectableItem firstWhere(
    String key,
    bool Function(SelectableItem) test, {
    SelectableItem Function()? orElse,
  }) {
    if (_data[key] == null) {
      throw StateError("No element");
    }

    return _data[key]!.firstWhere(test, orElse: orElse);
  }

  void update(String key, List<SelectableItem> data) => _data[key] = data;
}

const _jsonCodec = JsonCodec();

Map<String, dynamic> _decodeStringData(String data) =>
    _jsonCodec.decode(data);

List _getListDataFromMap(
    Map<String, dynamic> mapData,
    ) =>
    mapData['data'];

const String _cityKey = 'city';
const String _lastTimeFetchCityDataKey = 'last_time_fetch_city_data';

class LocalDataStorageService {
  bool _hasExpired(String? lastTime) {
    if (lastTime != null) {
      if (lastTime.isEmpty) return true;

      DateTime? lastFetchDate = DateTime.tryParse(lastTime);
      if (lastFetchDate == null ||
          DateTime.now()
              .add(AppConstants.timesToFetchCommonDataAgain)
              .isBefore(lastFetchDate)) return true;
    }

    return false;
  }

  /// --------------------------------------------------------------------------
  ///                                 City
  /// --------------------------------------------------------------------------

  bool containsCityData() =>
      !_hasExpired(SpUtil.getString(_lastTimeFetchCityDataKey));

  /// return List<Map<String, dynamic>>
  List getListCityData() =>
      _jsonCodec.decode(SpUtil.getString(_cityKey)!);

  void saveCityResponeData(String response) {
    SpUtil.putString(_cityKey, response);
    SpUtil.putString(_lastTimeFetchCityDataKey, DateTime.now().toString());
  }
}


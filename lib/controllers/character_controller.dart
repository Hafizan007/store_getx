import 'package:digital_store/models/character_model.dart';
import 'package:digital_store/utils/api.dart';
import 'package:digital_store/utils/http_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as d;

class CharacterController extends GetxController {
  HttpService httpService = HttpService();
  final loading = true.obs;
  final paginateLoading = false.obs;
  final list = <Results>[].obs;
  final detail = Results().obs;
  final hasNext = false.obs;
  final option = 0.obs;
  final params = ''.obs;
  final search = ''.obs;
  final searchController = TextEditingController().obs;
  final listIsEmpty = false.obs;
  @override
  void onInit() {
    httpService.init();
    getListCharacter('1');
    super.onInit();
  }

  Future<void> getListCharacter(String page) async {
    if (page == '1') {
      hasNext(true);
      loading(true);
      list.clear();
      listIsEmpty(false);
    }

    Map<String, Object> customParams;
    if (option > 0 && option <= 3) {
      customParams = {'page': page, 'status': params};
    } else if (option > 3 && option <= 6) {
      customParams = {'page': page, 'species': params};
    } else {
      customParams = {'page': page};
    }
    if (search.value.isNotEmpty) {
      Map<String, Object> searchParams = {'name': search.value};

      customParams.addAll(searchParams);
    }

    if (page != '1') {
      hasNext(true);
    }
    try {
      final result = await httpService.request(
          url: Api.character, method: Method.GET, params: customParams);

      if (result != null) {
        if (result is d.Response) {
          final loadedData = CharacterModel.fromJson(result.data).results!;
          list.addAll(loadedData);
          if (loadedData.length < 20) hasNext(false);
        } else {
          if (result == '404') {
            listIsEmpty(true);
          } else {
            Get.toNamed('/error');
          }
        }
      }
    } finally {
      loading(false);
    }
  }

  void getDetail(Results results) {
    detail.value = results;
  }
}

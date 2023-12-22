import 'dart:convert';

import 'package:bruno/bruno.dart';
import 'package:crash_box/common/Logger.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:getwidget/components/toast/gf_toast.dart';
import 'package:getwidget/getwidget.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import 'state.dart';

class MyLogic extends GetxController {
  final MyState state = MyState();
  final dio = GetIt.I<Dio>();

  @override
  void onInit() {
    getAppVersion();

    super.onInit();
  }

  getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    state.appVersion = packageInfo.version;
    checkUpdate();
    update();
  }

  checkUpdate() async {
    final res = await dio.get("https://github.com/CupOfBread/Crash-Box/releases/download/updator/updator.json");
    Map<String, dynamic> resData = jsonDecode(res.data);
    state.latestAppVersion = resData['version'].toString();
    if (state.latestAppVersion != state.appVersion) {
      GFToast.showToast('发现新版本，请前往设置页面下载最新版以获得最佳体验！', Get.overlayContext!,
          toastPosition: GFToastPosition.BOTTOM,
          toastDuration: 6,
          trailing: const Icon(
            Icons.notifications,
            color: GFColors.SUCCESS,
          ));
    }
    update();
  }

  getUpdateButton() {
    if (state.latestAppVersion != state.appVersion) {
      return GetBuilder<MyLogic>(builder: (logic) {
        return Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(12, 8, 12, 8),
          child: GFButton(
            onPressed: () async {
              final Uri _url = Uri.parse('https://github.com/CupOfBread/Crash-Box/releases/download/latest/app-release_android.apk');
              if (!await launchUrl(_url)) {
                throw Exception('Could not launch $_url');
              }
            },
            text: "获取最新版本 ${state.latestAppVersion}",
            shape: GFButtonShape.pills,
            fullWidthButton: true,
            color: Colors.green,
          ),
        );
      });
    } else {
      return Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(12, 8, 12, 8),
        child: GFButton(
          onPressed: () {
            BrnToast.show("版本已经是最新啦！", Get.overlayContext!);
          },
          text: "当前已是最新版本",
          shape: GFButtonShape.pills,
          fullWidthButton: true,
        ),
      );
    }
  }
}

// ignore_for_file: camel_case_types, non_constant_identifier_names, unnecessary_new, unused_local_variable

import '../Modal/modal.dart';
import '../themes/function.dart';

class mainController {
  ///////  get all Device ID ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  List<String> deviceID_list = [];
  fnGetDeviceID(context) async {
    Map<dynamic, dynamic> deviceIDD = new Map();
    dynamic jsonBody = {
      "sql":
          "SELECT id, device_id  FROM `bearact_app` WHERE `status` = '1' ORDER BY id DESC ",
    };
    var returnData =
        await themeModal.fnFindDynamic(context, jsonBody, action: 'raw_query');
    if (returnData != null && returnData['success'] != null) {
      if (returnData['returnVal'].isNotEmpty) {
        deviceIDD = returnData['returnVal'].asMap();
        for (var i = 0; i < deviceIDD.length; i++) {
          deviceID_list.add(deviceIDD[i]["device_id"]);
        }
      }
    }
  }

////===========================================================================
  ///  Save device id +++++++++++++++++
  save_device_id(context, deviceId) async {
    var jsonBody = {
      "model_location": "admin/Bare_act_model",
      "model": "Bare_act_model",
      "device_id": "$deviceId",
      "status": "1",
      "date_at": currentRegistrationDate(),
    };

    var returnData =
        await themeModal.fnFindDynamic(context, jsonBody, action: 'save');
  }

  /// ==========
}

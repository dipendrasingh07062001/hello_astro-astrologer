import 'dart:convert';

import 'package:astro/api/preference.dart';
import 'package:http/http.dart' as http;

import '../util/snackbar.dart';

class ApiClient {
  Future getRequest(
    String path,
  ) async {
    try {
      var response = await http.get(
        Uri.parse(path),
        headers: Preference.getString(PreferenceConstants.tokenid) == ""
            ? {'content-Type': 'application/json', "accept": "*/*"}
            : {
                'content-Type': 'application/json',
                "authorization":
                    Preference.getString(PreferenceConstants.tokenid),
                "accept": "*/*"
              },
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }
      if (response.statusCode == 201) {
        return jsonDecode(response.body);
      }
      if (response.statusCode == 400) {
        return Future.error({});
      }
      if (response.statusCode == 401) {
        return Future.error({});
      }
      if (response.statusCode >= 500) {
        return Future.error({});
      }
      return null;
    } catch (e) {
      redsnackbar("Something went wrong please try again later.");
      return Future.error({});
    }
  }

  Future postRequest(String path, Map<String, String> body,
      {List<http.MultipartFile>? files}) async {
    try {
      var request = http.MultipartRequest("Post", Uri.parse(path));
      request.headers.addAll(
        Preference.getString(PreferenceConstants.tokenid) == ""
            ? {'Content-Type': 'application/json'}
            : {
                'Content-Type': 'application/json',
                "authorization":
                    Preference.getString(PreferenceConstants.tokenid),
              },
      );
      request.fields.addAll(body);
      if (files != null) request.files.addAll(files);
      http.StreamedResponse response = await request.send();
      int status = response.statusCode;
      var res = await response.stream.bytesToString();
      var data = jsonDecode(res);
      if (status == 200) {
        return data;
      }
      if (status == 201) {
        return data;
      }
      if (status == 400) {
        return Future.error({});
      }
      if (status == 401) {
        return Future.error({});
      }
      if (status >= 500) {
        return Future.error({});
      }
    } catch (e) {
      redsnackbar("Something went wrong please try again later.");
      return Future.error({});
      // if (e.response != null) {
      //   response = ResponseModal.fromJson(e.response?.data);
      //   await showSnackBar(title: "Alert!", message: "${e.response?.data}");
      // } else {
      //   await showSnackBar(title: "Alert!", message: "${e.message}");
      // }
    }
  }

  Future putRequest(String path, Map<String, String> body,
      {List<http.MultipartFile>? files}) async {
    try {
      var request = http.MultipartRequest("PUT", Uri.parse(path));
      request.headers.addAll(
        Preference.getString(PreferenceConstants.tokenid) == ""
            ? {}
            : {
                "authorization":
                    Preference.getString(PreferenceConstants.tokenid),
              },
      );
      request.fields.addAll(body);
      if (files != null) request.files.addAll(files);
      http.StreamedResponse response = await request.send();
      int status = response.statusCode;
      var res = await response.stream.bytesToString();
      var data = jsonDecode(res);
      if (status == 200) {
        return data;
      }
      if (status == 201) {
        return data;
      }
      if (status == 400) {
        return Future.error({});
      }
      if (status == 401) {
        return Future.error({});
      }
      if (status >= 500) {
        return Future.error({});
      }
    } catch (e) {
      redsnackbar("Something went wrong please try again later.");
      return Future.error({});
      // if (e.response != null) {
      //   response = ResponseModal.fromJson(e.response?.data);
      //   await showSnackBar(title: "Alert!", message: "${e.response?.data}");
      // } else {
      //   await showSnackBar(title: "Alert!", message: "${e.message}");
      // }
    }
    return null;
  }

  Future patchRequest(String path, Map<String, dynamic> body) async {
    try {
      var response = await http.patch(
        Uri.parse(path),
        headers: Preference.getString(PreferenceConstants.tokenid) == ""
            ? {}
            : {
                "authorization":
                    Preference.getString(PreferenceConstants.tokenid),
              },
        body: body,
      );
      int status = response.statusCode;
      var data = jsonDecode(response.body);
      if (status == 200) {
        return data;
      }
      if (status == 201) {
        return data;
      }
      if (status == 401) {
        // return data;
      }
      if (status >= 500) {
        // return data;
      }
      return null;
    } catch (e) {
      redsnackbar("Something went wrong please try again later.");
      // if (e.response != null) {
      //   response = ResponseModal.fromJson(e.response?.data);
      //   await showSnackBar(title: "Alert!", message: "${e.response?.data}");
      // } else {
      //   await showSnackBar(title: "Alert!", message: "${e.message}");
      // }
    }
    return null;
  }
}

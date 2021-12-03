import 'package:connectivity/connectivity.dart';
import 'package:http/http.dart' as http;
import 'package:quadrant_components/src/model/quadrant_info_request.dart';

List<InfoRequests> listaRequest = [];

class RequestsComponents {
  Future getRequests(_url) async {
    listaRequest.clear();
    var _requestGet;
    var _resultConexao;
    try {
      _resultConexao = await resultConexao();
      if (_resultConexao) {
        _requestGet = await http.get(Uri.parse(_url));
        if (_requestGet.statusCode == 200 && _requestGet.body != null) {
          listaRequest.add(InfoRequests(
            "$_url",
            "GET",
            "${_requestGet.statusCode}",
            "$_resultConexao",
            "Sucesso",
            _requestGet.body,
          ));
          return listaRequest;
        } else {
          // NULL SÓ PRA  QUANDO A REQUISIÇÃO NÃO FUNCIONOU
          listaRequest.add(InfoRequests(
            "$_url",
            "GET",
            "${_requestGet.statusCode}",
            "$_resultConexao",
            "1",
            'Não possui',
          ));
          return listaRequest;
        }
      } else {
        listaRequest.add(InfoRequests(
          "$_url",
          "GET",
          'Não possui',
          "$_resultConexao",
          "2",
          'Não possui',
        ));
        // FALSE PARA QUANDO O USUARIO TEVE PROBLEMAS COM CONEXAO OU ALGO DEU ERRADO DURANTE A EXECUÇÃO DO COD
        return listaRequest;
      }
    } on Exception catch (e) {
      print('ERRO> Requisição esta errada ou conexão\n Exception:$e');
      listaRequest.add(InfoRequests(
        "$_url",
        "GET",
        'Não possui',
        "$_resultConexao",
        "3",
        'Não possui',
      ));
      return listaRequest;
    }
  }

  Future getComParametros(_url, _parametros) async {
    listaRequest.clear();
    var _resultConexao, _requestGet;
    try {
      _resultConexao = await resultConexao();
      if (_resultConexao) {
        _requestGet = await http.get(Uri.parse(_url + _parametros));

        if (_requestGet.statusCode == 200 && _requestGet.body != null) {
          listaRequest.add(InfoRequests(
            "$_url",
            "GET",
            "${_requestGet.statusCode}",
            "$_resultConexao",
            "Sucesso",
            _requestGet.body,
          ));
          return listaRequest;
        } else {
          listaRequest.add(InfoRequests(
            "$_url",
            "GET",
            "${_requestGet.statusCode}",
            "$_resultConexao",
            "1",
            'Não possui',
          ));
          return listaRequest;
        }
      } else {
        listaRequest.add(InfoRequests(
          "$_url",
          "GET Com Parametros",
          'Não possui',
          "$_resultConexao",
          "2",
          'Não possui',
        ));
        // FALSE PARA QUANDO O USUARIO TEVE PROBLEMAS COM CONEXAO OU ALGO DEU ERRADO DURANTE A EXECUÇÃO DO COD
        return listaRequest;
      }
    } on Exception catch (e) {
      print('ERRO> Requisição esta errada ou conexão\n Exception:$e');
      listaRequest.add(InfoRequests(
        "$_url",
        "GET",
        'Não possui',
        "$_resultConexao",
        "3",
        'Não possui',
      ));
      return listaRequest;
    }
  }

  Future postRequests(_url, _body) async {
    var _resultConexao, _postRequest;
    try {
      _resultConexao = await resultConexao();
      if (_resultConexao && _body != null && _url != null) {
        _postRequest = await http.post(Uri.parse(_url), body: _body);
        if (_postRequest.statusCode == 200 && _postRequest.body != null) {
          listaRequest.add(InfoRequests(
            "$_url",
            "POST",
            "${_postRequest.statusCode}",
            "$_resultConexao",
            "Sucesso",
            _postRequest.body,
          ));
          return listaRequest;
        } else {
          listaRequest.add(InfoRequests(
            "$_url",
            "POST",
            "${_postRequest.statusCode}",
            "$_resultConexao",
            "1",
            'Não possui',
          ));
          return listaRequest;
        }
      } else {
        listaRequest.add(InfoRequests(
          "$_url",
          "POST Com Parametros",
          'Não possui',
          "$_resultConexao",
          "2",
          'Não possui',
        ));
        // FALSE PARA QUANDO O USUARIO TEVE PROBLEMAS COM CONEXAO OU ALGO DEU ERRADO DURANTE A EXECUÇÃO DO COD
        return listaRequest;
      }
    } on Exception catch (e) {
      listaRequest.add(InfoRequests(
        "$_url",
        "POST",
        'Não possui',
        "$_resultConexao",
        "3",
        'Não possui',
      ));
      return listaRequest;
    }
  }

  Future updateRequests(_url, _body) async {
    var _resultConexao, _postRequest;
    try {
      _resultConexao = await resultConexao();
      if (_resultConexao && _body != null && _url != null) {
        _postRequest = await http.put(Uri.parse(_url), body: _body);
        if (_postRequest.statusCode == 200 && _postRequest.body != null) {
          listaRequest.add(InfoRequests(
            "$_url",
            "UPDATE(PUT)",
            "${_postRequest.statusCode}",
            "$_resultConexao",
            "Sucesso",
            _postRequest.body,
          ));
          return listaRequest;
        } else {
          listaRequest.add(InfoRequests(
            "$_url",
            "UPDATE(PUT)",
            "${_postRequest.statusCode}",
            "$_resultConexao",
            "1",
            'Não possui',
          ));
          return listaRequest;
        }
      } else {
        listaRequest.add(InfoRequests(
          "$_url",
          "UPDATE(PUT) Com Parametros",
          'Não possui',
          "$_resultConexao",
          "2",
          'Não possui',
        ));
        // FALSE PARA QUANDO O USUARIO TEVE PROBLEMAS COM CONEXAO OU ALGO DEU ERRADO DURANTE A EXECUÇÃO DO COD
        return listaRequest;
      }
    } on Exception catch (e) {
      listaRequest.add(InfoRequests(
        "$_url",
        "UPDATE(PUT)",
        'Não possui',
        "$_resultConexao",
        "3",
        'Não possui',
      ));
      return listaRequest;
    }
  }

  Future<bool> resultConexao() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      // nao tem conexao
      return false;
    } else {
      // tem conexao
      return true;
    }
  }
}

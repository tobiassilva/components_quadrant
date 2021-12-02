import 'package:connectivity/connectivity.dart';
import 'package:http/http.dart' as http;

class RequestsComponents {
  Future getRequests(_url) async {
    try {
      var _resultConexao = await resultConexao();
      if (_resultConexao) {
        var _requestGet = await http.get(Uri.parse(_url));
        if (_requestGet.statusCode == 200 && _requestGet.body != null) {
          return _requestGet.body;
        } else {
          // NULL SÓ PRA  QUANDO A REQUISIÇÃO NÃO FUNCIONOU
          return null;
        }
      } else {
        // FALSE PARA QUANDO O USUARIO TEVE PROBLEMAS COM CONEXAO OU ALGO DEU ERRADO DURANTE A EXECUÇÃO DO COD
        return false;
      }
    } on Exception catch (e) {
      print('ERRO> Requisição esta errada ou conexão\n Exception:$e');
      return false;
    }
  }

  Future getComParametros(_url, _parametros) async {
    try {
      var _resultConexao = await resultConexao();
      if (_resultConexao) {
        var _requestGet = await http.get(Uri.parse(_url + _parametros));

        if (_requestGet.statusCode == 200 && _requestGet.body != null) {
          return _requestGet.body;
        } else {
          // NULL SÓ PRA  QUANDO A REQUISIÇÃO NÃO FUNCIONOU

          return null;
        }
      } else {
        // FALSE PARA QUANDO O USUARIO TEVE PROBLEMAS COM CONEXAO OU ALGO DEU ERRADO DURANTE A EXECUÇÃO DO COD

        return false;
      }
    } on Exception catch (e) {
      print('ERRO> Requisição esta errada ou conexão\n Exception:$e');
      return false;
    }
  }

  Future postRequests(_url, _body) async {
    try {
      var _resultadoConexao = await resultConexao();
      if (_resultadoConexao && _body != null && _url != null) {
        var _postRequest = await http.post(Uri.parse(_url), body: _body);
        if (_postRequest.statusCode == 200 && _postRequest.body != null) {
          return _postRequest.body;
        } else {
          // NULL SÓ PRA  QUANDO A REQUISIÇÃO NÃO FUNCIONOU

          return null;
        }
      } else {
        // FALSE PARA QUANDO O USUARIO TEVE PROBLEMAS COM CONEXAO OU ALGO DEU ERRADO DURANTE A EXECUÇÃO DO COD

        return false;
      }
    } on Exception catch (e) {
      return false;
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

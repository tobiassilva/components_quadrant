class InfoRequests {
  String requisicaoUrl = '';
  String tipoRequisicao = '';
  String statusCode = '';
  String conexao = '';
  String retorno = '';
  String erro = '';
  InfoRequests(this.requisicaoUrl, this.tipoRequisicao, this.statusCode,
      this.conexao, this.erro, this.retorno);
  //  ERROS
  /*
  "Erro ao tentar fazer o Get/POST/PUT > Verificar EP"=>1
  "Sem Internet>> Conexao Falhou" => 2
  "Erro ao tentar fazer a função de UPDATE(PUT) (Try catch)" => 3
  */

}

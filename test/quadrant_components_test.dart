import 'package:flutter_test/flutter_test.dart';
import 'package:quadrant_components/quadrant_components.dart';

void main() {
  
  test("teste inicial", (){
    final requestsComponents = ClassTeste();

  expect(requestsComponents.teste1(val: 8), "Passou");
  expect(requestsComponents.teste1(val: 5), "Reprovado");
  expect(requestsComponents.teste1(val: -2), "error");
  //expect(() => requestsComponents.teste1(val: -1), throwsException);
  });
}




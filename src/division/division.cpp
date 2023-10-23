//
// Created by Konstantin Gredeskoul on 5/14/17.
//

#include "division.h"

DivisionResult Division::divide() {
  if (fraction.denominator == 0L) throw DivisionByZero();
  
	std::cout << "hello, this test for parasoft-findings plugin in Jenkins" << std::endl;
  	std::cout << "This is a test for QA" << std::endl;
  
  DivisionResult result = DivisionResult{
    fraction.numerator / fraction.denominator, 
    fraction.numerator % fraction.denominator
  };

  return result;
}

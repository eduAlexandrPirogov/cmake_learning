#include <iostream>
#include "math_lib/math.h"
#include "log.h"


int main()
{
   std::cout << "Hello, world!\n";
   std::cout << "plus result = " << plus(10,20) << '\n';
   std::cout << "minus result = " << minus(20,10) << '\n';

   Logger logger{};
   logger.log_success("everything is fine!");
   logger.log_error("sometning wrong...");
   return 0;
};

#include "hello_world.h"

#include <iostream>

namespace hello_world {
   void HelloWorld::hello() {
       std::cout << "Hello, world!" << std::endl;
   }
} // namespace hello_world
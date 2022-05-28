#include "log.h"

void Logger::log_success(const char* message)
{
   std::cout << "Log success message: " << message << '\n';
};

void Logger::log_error(const char* message)
{
   std::cout << "Log error message: " << message << '\n'; 
};

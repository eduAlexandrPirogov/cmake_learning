#pragma once
#include <iostream>

class Logger
{
   public:
	Logger() = default;
	void log_success(const char* message);
	void log_error(const char* message);
};

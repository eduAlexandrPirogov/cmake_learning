#include <iostream>
#include <string>
#include <pqxx/pqxx>

int main()
{
   try {

      pqxx::connection C("dbname = postgres user = postgres password=postgres \ 
		      hostaddr = 172.20.46.8  port = 5432");
      if(C.is_open())
      {
         std::cout<< "Opened db successfully: " << C.dbname() << std::endl;
	 std::string query = std::string{"insert into test values(default);"};

	 pqxx::work W(C);
	 
	 W.exec(query);
	 W.commit();
      } else {
	 std::cout<< "Can't open db" << std::endl;
         return 1;
      };
   } catch (const std::exception &e) {
      std::cerr << e.what() << std::endl;
   };
   return 0;
};

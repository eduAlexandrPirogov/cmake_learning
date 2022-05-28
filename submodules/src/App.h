#include "wx/wx.h"

class App : public wxApp
{
   public:
      App();
      ~App();

    virtual bool OnInit();
};

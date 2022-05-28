#include "App.h"

wxIMPLEMENT_APP(App);

App::App(){};

bool App::OnInit()
{
   wxFrame* frame = new wxFrame(nullptr, wxID_ANY, "title", wxDefaultPosition, wxSize(600,600));
   frame->Show();
   return true;
};

App::~App(){};

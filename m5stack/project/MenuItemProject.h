#ifndef _MENUITEMPROJECT_H_
#define _MENUITEMPROJECT_H_

#include <MenuItem.h>
#include <Rect16.h>

class MenuItemProject : public MenuItem {
public:
    MenuItemProject(const String& title, TCallBackEnter cb)
    : MenuItem(title, cb), isChild(false) {};
    // MenuItemProject(const String& title)
    // : MenuItem(title), isChild(true) {};
    MenuItemProject(const String& title, String l[])
    : MenuItem(title), isChild(true)
    {
      projectData = l;
      // for(int i = 0; i < 4; i++) {
      //   projectData[i] = l[i];
      // }
    };
    virtual void onEnter();
    virtual void onExit();
    virtual void onAfterDraw();

    virtual int getRightPadding() const { return 18; }

    String *projectData;
    boolean isChild;
private:
    void fetchProjectData();
};


#endif

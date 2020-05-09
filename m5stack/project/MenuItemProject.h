#ifndef _MENUITEMPROJECT_H_
#define _MENUITEMPROJECT_H_

#include <MenuItem.h>
#include <Rect16.h>
#include <vector>

class MenuItemProject : public MenuItem {
public:
    MenuItemProject(const String& title, TCallBackEnter cb, int16_t x, int16_t y, int16_t w, int16_t h)
    : MenuItem(title, cb), isChild(false), x(x), y(y), w(w), h(h) {};
    MenuItemProject(const String& title)
    : MenuItem(title), isChild(true){};
    virtual void onEnter();
    virtual void onExit();
    virtual void onAfterDraw();

    virtual int getRightPadding() const { return 18; }

    std::vector<String> projectData;;
    boolean isChild;
private:
    int16_t x;
    int16_t y;
    int16_t w;
    int16_t h;
    void fetchProjectData();
};


#endif

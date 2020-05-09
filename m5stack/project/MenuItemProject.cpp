#include "MenuItemProject.h"

void MenuItemProject::onEnter() {
  if (!isChild) { fetchProjectData(); }

  MenuItem::onEnter();
}

void MenuItemProject::onExit() {
  deleteItems();
  M5.Lcd.fillRect(x, y, w, h, 0x0000);

  MenuItem::onExit();
}

void MenuItemProject::onAfterDraw() {
  MenuItem::onAfterDraw();
}

void MenuItemProject::fetchProjectData() {
  String list[][4] = {{"School of Computer Science, Electrical and Electronic Engineering, and Engineering Mathematics",
                    "project_name_02",
                    "project_details_02",
                    "Advanced Computer Science student"},
                    { "School of Computer Science",
                      "project_name_04",
                      "project_details_04",
                      "None"}};
  applyFont();
  trimFillRect( rect.x + 1, rect.y + 1, rect.w - 2, rect.h - 2, backColor[1]);
  drawTitle(true, "Project Searching...");

  deleteItems();

  int count = 2;
  // M5.Lcd.drawString(String(x), 202,  10, 1);

  for (int i = 0; i < count; i++) {
    MenuItemProject* mi = new MenuItemProject(list[i][1]);
    mi->x = x;
    mi->y = y;
    mi->w = w;
    mi->h = h;
    for (int j = 0; j < 4; j++) {
      mi->projectData.push_back(list[i][j]);
    }
    addItem(mi);
  }
}

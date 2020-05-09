#include "MenuItemProject.h"

void MenuItemProject::onEnter() {
  if (!isChild) { fetchProjectData(); }

  MenuItem::onEnter();
}

void MenuItemProject::onExit() {
  deleteItems();
  // for (int i = 0; i < 2; i++) {
  //   delete[] projectList[i]; // delete sub array
  // }
  // delete [] projectList; //delete outer array
  // projectList = NULL;

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
  // M5.Lcd.drawString(list[0][1], 202,  20, 1);

  for (int i = 0; i < count; i++) {
    for (int j = 0; j < 4; j++) {
      // projectData[j] = list[i][j];
      // projectData[j] = String("user");
      // projectData[j] = j;
      projectData[j] = "user";
    }
    String s[4] = list[i];
    MenuItemProject* mi = new MenuItemProject(s[1], list[i]);

    addItem(mi);
  }
}

#include <vector>
#include <SD.h>
#include <SPIFFS.h>
#include <M5Stack.h>
#include <M5TreeView.h>         // https://github.com/lovyan03/M5Stack_TreeView
#include <M5OnScreenKeyboard.h> // https://github.com/lovyan03/M5OnScreenKeyboard/
#include <MenuItemSD.h>
#include <MenuItemSPIFFS.h>
#include <MenuItemToggle.h>
#include <MenuItemWiFiClient.h>
#include <M5ButtonDrawer.h>
#include <Preferences.h>

#include "MenuItemProject.h"
#include "Header.h"

M5TreeView treeView;
M5OnScreenKeyboard osk;
Header header;

String user = String("None");
typedef std::vector<MenuItem*> vmi;

void drawFrame() {
  uint16_t sideColor = treeView.fontColor[0];
  Rect16 r = treeView.clientRect;
  r.inflate(1);
  M5.Lcd.drawRect(r.x -1, r.y, r.w +2, r.h, MenuItem::frameColor[1]);
  M5.Lcd.drawRect(r.x, r.y -1, r.w, r.h +2, MenuItem::frameColor[1]);
  M5.Lcd.drawFastHLine(r.x+r.w+5, r.y+13, M5.Lcd.width()-r.x-r.w-6, MenuItem::frameColor[1]);
}

void drawCenterString(String s, int16_t x0, int16_t x1, int16_t y) {
  // font size 1 : 6*6
  int16_t fontSize = 6;
  int16_t x;
  int16_t w = abs(x1-x0);
  int length = fontSize*s.length();
  if (w > length) {  x = (x0+x1)/2-length/2; }
  else {
    x = x0;
    s = s.substring(0, w/fontSize);
  }
  M5.Lcd.drawString(s, x, y, 1);
}

void drawDisplayData(std::vector<String> v, int16_t x, int16_t y, int16_t w, int16_t h) {
  int16_t fontSize = 6;
  int fontW = fontSize;
  int fontH = fontSize+2;
  int row = h/fontH;
  int col = w/fontW;
  int len = v.size();
  int count = 0;
  int i = 0;

  for (int j = 0; i < row && j < len; j++) {

    int size = v[j].length();
    int insec = size/col;
    int start = 0;
    for (int k = 0; k < insec && i < row; k++) {

      M5.Lcd.drawString(v[j].substring(start, start+col), x, y+i*fontH, 1);
      i += 1;
      start += col;
    }
    if (start < size) {
      M5.Lcd.drawString(v[j].substring(start), x, y+i*fontH, 1);
      i += 1;
    }
    if (i < row && j < len) {
      i++;
    }
  }
}

void CallBackProject(MenuItem* sender) {
  MenuItemProject* mi = static_cast<MenuItemProject*>(sender);
  Rect16 r = treeView.clientRect;
  if (!mi) { return; }
  if (!mi->isChild) { return; }

  M5.Lcd.fillRect(r.x+r.w+5, r.y+15, M5.Lcd.width()-r.x-r.w-8, r.h-16, treeView.backColor[0]);
  drawCenterString(user, r.x+r.w+2+2, M5.Lcd.width()-2, r.y+2);
  drawDisplayData(mi->projectData, r.x+r.w+5, r.y+15, M5.Lcd.width()-r.x-r.w-8, r.h-16);
}

void CallBackStyle(MenuItem* sender)
{
  switch (sender->tag) {
  default: return;

  case 1001:
    treeView.fontColor[0]  = 0xFFF0;
    treeView.backColor[0]  = 0x0000;
    treeView.frameColor[0] = 0x0000;
    treeView.fontColor[1]  = 0x0000;
    treeView.backColor[1]  = 0xFFF0;
    treeView.frameColor[1] = 0xFFFF;
    treeView.backgroundColor = 0x0000;
    treeView.itemHeight = 12;
    treeView.setFreeFont(&TomThumb);
    M5ButtonDrawer::setTextFont(1);
    M5ButtonDrawer::height = 14;
    M5ButtonDrawer::width = 64;
    break;

  case 1002:
    treeView.fontColor[0]  = 0xFFE0;
    treeView.backColor[0]  = 0x0100;
    treeView.frameColor[0] = 0x6300;
    treeView.fontColor[1]  = 0x7FE0;
    treeView.backColor[1]  = 0xC400;
    treeView.frameColor[1] = 0xFF00;
    treeView.backgroundColor = 0x1000;
    treeView.itemHeight = 16;
    treeView.setTextFont(1);
    M5ButtonDrawer::setTextFont(1);
    M5ButtonDrawer::height = 14;
    M5ButtonDrawer::width = 64;
    break;

  case 1003:
    treeView.fontColor[0]  = 0xFFFF;
    treeView.backColor[0]  = 0x0000;
    treeView.frameColor[0] = 0xA514;
    treeView.fontColor[1]  = 0x0000;
    treeView.backColor[1]  = 0xFFF8;
    treeView.frameColor[1] = 0xFFFF;
    treeView.backgroundColor = 0x4208;
    treeView.itemHeight = 18;
    treeView.setTextFont(2);
    M5ButtonDrawer::setTextFont(2);
    M5ButtonDrawer::height = 20;
    M5ButtonDrawer::width = 80;
    break;

  case 1004:
    treeView.fontColor[0]  = 0xFFFF;
    treeView.backColor[0]  = 0x6314;
    treeView.frameColor[0] = 0x0118;
    treeView.fontColor[1]  = 0x7FFF;
    treeView.backColor[1]  = 0x441F;
    treeView.frameColor[1] = 0xFFF0;
    treeView.backgroundColor = 0x0008;
    treeView.itemHeight = 20;
    treeView.setFreeFont(&FreeMono9pt7b);
    M5ButtonDrawer::setFreeFont(&FreeMono9pt7b);
    M5ButtonDrawer::height = 20;
    M5ButtonDrawer::width = 106;
    break;

  case 1005:
    treeView.fontColor[0]  = 0xFFFF;
    treeView.backColor[0]  = 0x4302;
    treeView.frameColor[0] = 0x0208;
    treeView.fontColor[1]  = 0xFFFF;
    treeView.backColor[1]  = 0x6704;
    treeView.frameColor[1] = 0xFFFF;
    treeView.backgroundColor = 0x0000;
    treeView.itemHeight = 24;
    treeView.setFreeFont(&FreeSans9pt7b);
    M5ButtonDrawer::setFreeFont(&FreeSans9pt7b);
    M5ButtonDrawer::height = 20;
    M5ButtonDrawer::width = 100;
    break;

  case 1006:
    treeView.fontColor[0]  = 0xFFFF;
    treeView.backColor[0]  = 0x630C;
    treeView.frameColor[0] = 0x0208;
    treeView.fontColor[1]  = 0xFFFF;
    treeView.backColor[1]  = 0x421F;
    treeView.frameColor[1] = 0xFFFF;
    treeView.backgroundColor = 0x0000;
    treeView.itemHeight = 20;
    treeView.setTextFont(1);
    M5ButtonDrawer::setTextFont(1);
    M5ButtonDrawer::height = 16;
    M5ButtonDrawer::width = 64;
    break;
  }
  for (int i = 0; i < 2; ++i) {
    M5ButtonDrawer::fontColor[i] = treeView.fontColor[i];
    M5ButtonDrawer::backColor[i] = treeView.backColor[i];
    M5ButtonDrawer::frameColor[i] = treeView.frameColor[i];
    osk.fontColor[i] = treeView.fontColor[i];
    osk.backColor[i] = treeView.backColor[i];
    osk.frameColor[i]= treeView.frameColor[i];
  }
  M5.Lcd.fillRect(0, 218, M5.Lcd.width(), 22, 0);
}

void setup() {
  M5.begin();
  Wire.begin();

  treeView.clientRect.x = 2;
  treeView.clientRect.y = 16;
  treeView.clientRect.w = 196;
  treeView.clientRect.h = 200;
  treeView.itemWidth = 176;

  treeView.useFACES       = true;
  treeView.useJoyStick    = true;
  treeView.usePLUSEncoder = true;
  treeView.useFACESEncoder= true;
  osk.useTextbox     = true;
  osk.useFACES       = true;
  osk.useCardKB      = true;
  osk.useJoyStick    = true;
  osk.usePLUSEncoder = true;
  osk.useFACESEncoder= true;
  osk.msecHold   = treeView.msecHold;
  osk.msecRepeat = treeView.msecRepeat;

  Rect16 r = treeView.clientRect;
  treeView.setItems(vmi
               { new MenuItem("main 1", 1, vmi
                 { new MenuItem("sub 1-1", 11, vmi
                   { new MenuItem("sub 1-1-1", 111)
                   } )
                 } )
               , new MenuItemProject("ProJect List", CallBackProject, r.x+r.w+5, r.y+15, M5.Lcd.width()-r.x-r.w-8, r.h-16)
               , new MenuItem("Setting", vmi
               {
                 new MenuItem("Style", CallBackStyle, vmi
                 { new MenuItem("Style 1", 1001)
                 , new MenuItem("Style 2", 1002)
                 , new MenuItem("Style 3", 1003)
                 , new MenuItem("Style 4", 1004)
                 , new MenuItem("Style 5", 1005)
                 , new MenuItem("Style 6", 1006)
                 })
               })
               });

  treeView.begin();
  drawFrame();
}

void loop() {
  treeView.update();
  if (treeView.isRedraw()) {
    drawFrame();
  }
}

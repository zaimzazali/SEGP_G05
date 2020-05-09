#ifndef _HEADER_H_
#define _HEADER_H_

#include <M5Stack.h>
#include <WiFi.h>
#include <WiFiType.h>
#include <esp_wifi.h>

class Header {
public:
  Header() {};

  uint16_t colorFill = 0x630C;
  uint16_t colorFont = 0xffff;
  uint8_t font = 0;

  int drawStr(const String& src, int x)
  {
    M5.Lcd.drawString(src, x, 0);
    return x + M5.Lcd.textWidth(src);
  }

  void draw()
    {
      M5.Lcd.setTextFont(0);
      M5.Lcd.setTextFont(font);
      M5.Lcd.setTextSize(1);
      M5.Lcd.setTextColor(colorFont, colorFill);
      M5.Lcd.drawFastHLine(0, 8, M5.Lcd.width(), 0xC618);

      int x = 0;

      x = drawStr("Hello ", x);
      M5.Lcd.setCursor(M5.Lcd.width() - 96, 0);
      M5.Lcd.printf("Free%7d Byte", esp_get_free_heap_size());
      M5.Lcd.fillRect(x, 0, M5.Lcd.width() - 96-x, 8, colorFill);
    }
};

#endif

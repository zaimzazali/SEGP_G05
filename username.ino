#include <M5Stack.h>
#include <M5OnScreenKeyboard.h>


//#include <M5JoyStick.h>
#include <M5ButtonDrawer.h>

M5OnScreenKeyboard m5osk;
int padding = 10;
int fontSize = 26;
int maxlength = 30;
bool flag = true;

void setup() {
    M5.begin();
    Wire.begin();

    m5osk.useFACES = true;       // FACES unit support.
    m5osk.useCardKB = true;      // CardKB unit support.
    m5osk.useJoyStick = true;    // JoyStick unit support.
    m5osk.usePLUSEncoder = true; // PLUS Encoder unit support.
    m5osk.useFACESEncoder = true;// FACES Encoder unit support.

    m5osk.setup();
    int boardHeight = m5osk.getKeyboardHeight();
    int boardWidth = M5.Lcd.width();

    M5.Lcd.fillRect(0, 0, boardWidth, boardHeight, TFT_BLUE);

    M5.Lcd.setCursor(0, padding);
    M5.Lcd.setTextColor(TFT_BLACK, TFT_BLUE);
    M5.Lcd.setTextFont(4);
    M5.Lcd.setTextSize(2);
    M5.Lcd.print("username");

    M5.Lcd.fillRect(0, 2*padding+2*fontSize, boardWidth, boardHeight-3*padding-2*fontSize, TFT_WHITE);

//m5osk.setup("Hello World."); // You can also set default text
}

void loop() {

    if (flag) {
        while (m5osk.loop()) {
          // You can write your code here.
          delay(1);
        }

        // Get input string.
        String text = m5osk.getString();
        m5osk.close();

        M5.Lcd.setCursor(0, 2*padding+2*fontSize);
        M5.Lcd.setTextColor(TFT_BLACK, TFT_WHITE);
        M5.Lcd.setTextFont(4);
        M5.Lcd.setTextSize(2);
        M5.Lcd.print(text);

        delay(2000);
        M5.Lcd.clear(0);
        flag = false;
    }

}

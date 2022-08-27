#include <WiFi.h>
#include <WiFiClient.h>
#include <WiFiServer.h>
#include <WiFiUdp.h>


#define FIREBASE_HOST "example.firebaseio.com"
#define FIREBASE_AUTH "token_or_secret"
#define WIFI_SSID "SSID"
#define WIFI_PASSWORD "PASSWORD"

#include <ArduinoJson.h>
#include <Firebase.h>
#include <FirebaseArduino.h>
#include <FirebaseCloudMessaging.h>
#include <FirebaseError.h>
#include <FirebaseHttpClient.h>
#include <FirebaseObject.h>
#include <ESP8266WiFi.h>

#define r1 13
#define r2 23
#define r3 24
#define r4 25
#define r5 26
#define r6 27
#define r7 28

#define FIREBASE_HOST "example.firebaseio.com"
#define FIREBASE_AUTH "token_or_secret"
#define WIFI_SSID "SSID"
#define WIFI_PASSWORD "PASSWORD"
int a, b, c, d, e, f, g;

void setup() {
  pinMode(r1, OUTPUT);
  pinMode(r2, OUTPUT);
  pinMode(r3, OUTPUT);
  pinMode(r4, OUTPUT);
  pinMode(r5, INPUT);
  pinMode(r6, INPUT);
  pinMode(r7, INPUT);

  digitalWrite(r1, HIGH);
  digitalWrite(r2, HIGH);
  digitalWrite(r3, HIGH);
  digitalWrite(r4, HIGH);

  Serial.begin(9600);
  // connect to wifi.
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
  Serial.print("connecting");
  while (WiFi.status() != WL_CONNECTED) {
    Serial.print(".");
    delay(500);
  }
  Serial.println();
  Serial.print("connected: ");
  Serial.println(WiFi.localIP());
  Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH);
}
socker1_power = (SYS_Voltage * current_sensor1_value);
socker2_power = (SYS_Voltage * current_sensor2_value);
socker3_power = (SYS_Voltage * current_sensor3_value);
socker4_power = (SYS_Voltage * current_sensor4_value);

a = 1;
b = 1;
c = 1;
d = 1;
e = 1;
f = 1;
g = 1;

Serial.begin(9600);
}


void loop() {
  if (Serial.available()) {

    var = Serial.read(); switch (var) {

      case '1':
        {
          if (a != 0) {

            digitalWrite(r1, LOW);
            a = 0;
            break;

          }
          else if {
          a = 1;
          digitalWrite(r1, HIGH);
            break;


          }
          break;
        }


      case '2': {
          if (b != 0) {
            digitalWrite(r2, LOW); b = 0;

            break;
          }


          else {
            b = 1;
            digitalWrite(r2, HIGH); break;
          }

        }


      case '3': {
          if (c != 0)
          { c = 0;
            digitalWrite(r3, LOW); break;
          }
          else
          { c = 1;
            digitalWrite(r3, HIGH); break;
          }
        }
      case '4': {
          if (d != 0)

          { d = 0;
            digitalWrite(r4, LOW); break;
          }
          else
          { d = 1;
            digitalWrite(r4, HIGH); break;

          }
        }
      case '5': {
          float sense1 = analogRead(r5);
          Firebase.setFloat("sensor1", d);
          delay(50000);

        }
    }
  case '6': {
      float sense2 = analogRead(r6);
      Firebase.setFloat("sensor2", sense2);
      delay(50000);

    }
  case '7' : {
      float sense3 = analogRead(r7);
      Firebase.setFloat("sensor3", sense3);
      delay(50000);

    }
  }
}
}
}

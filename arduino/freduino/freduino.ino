#include <Servo.h>

#define NECK_SERVO_PIN 5
#define MOUTH_SERVO_PIN 6
#define BODY_SERVO_PIN 8

Servo neck_servo, mouth_servo, body_servo;
char inByte;
int inNum;

typedef enum {
  WAITING,
  SET,
  READ, 
  NECK,
  BODY,
  MOUTH
} 
State_t;
State_t state;


void setup() {
  neck_servo.attach(NECK_SERVO_PIN);
  mouth_servo.attach(MOUTH_SERVO_PIN);
  body_servo.attach(BODY_SERVO_PIN);

  Serial.begin(57600);

  state = WAITING;
}

void loop() {
  while(Serial.available()) {
    State_t next_state = WAITING; 
    inByte = Serial.read();
    switch(state) {
    case WAITING:
      if(inByte == 'S') {
        next_state = SET;
      } 
      else if (inByte == 'R') {
        next_state = READ;
        inNum = 0;
      } 
      else if (inByte == 'I') {
        Serial.print("iF");
      }
      break;
    case READ:
      if(inByte <= '9' and inByte >= '0') {
        inNum = 10*inNum + (inByte - '0');
        next_state = READ;
      } 
      else if(inByte == '.') {
        next_state = WAITING;
      }
      break;
    case SET:
      if(inByte == 'M') {
        next_state = MOUTH;
        inNum = 0;
      } 
      else if(inByte == 'N') {
        next_state = NECK;
        inNum = 0;
      } 
      else if(inByte == 'B') {
        next_state = BODY;
        inNum = 0;
      }
      break;
    case MOUTH:
    case NECK:
    case BODY:
      if(inByte <= '9' and inByte >= '0') {
        inNum = 10*inNum + (inByte - '0');
        next_state = state;
      } 
      else if(inByte == '.') {
        if(state == MOUTH) {
          mouth_servo.write(inNum+60);
        }
        if(state == BODY) body_servo.write(inNum);
        if(state == NECK) neck_servo.write(inNum);
        next_state = WAITING;
      }
      break;
    }
    state = next_state;
  }
}


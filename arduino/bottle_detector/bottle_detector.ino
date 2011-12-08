//This program is used for obtaining the value of a object at the sensor
//Used for calibration of the bottle sensor.
#define PIN A0
#define LOWERBOUND 120
#define UPPERBOUND 195 //230 - bottle 100%      250 - original  THIS NEEDS TO BE LOWERED!!!!
const int numReadings = 30;
int total = 0;
int readings[numReadings];
int index = 0;
int average=0;
int choking=0; //flag for detecting used in choking detection

//Code for counting bottles
int bottle_count = 0;
int not_bottle_count = 0;
int inactive_count = 0;
int trigger_count = 0;
int untrigger_count = 0;

void setup()
{
  Serial.begin(57600); //Start the serial connection
  pinMode(PIN, INPUT); //For the analog input pin
  for(int thisReading = 0; thisReading < numReadings; thisReading++)
  { 
    readings[thisReading] = 0;
  } //Used to initialise the moving average array to 0
}
char inByte;
void loop()
{
  if(Serial.available()) {
    inByte = Serial.read();
    if('I' == inByte || 'i' == inByte) { // Identify
      Serial.print("iB");
    } 
  }

  average = getAverage();

  if(average > LOWERBOUND){ 
    trigger_count++; 
  }
  else {
    untrigger_count++;
  }

  if(untrigger_count > 20){
    trigger_count = 0; 
    untrigger_count = 0;
  }

  if(trigger_count > 20)
  {
    trigger_count = 0;
    while( (inactive_count < 20) )
    {
      if(Serial.available()) {
        inByte = Serial.read();
        if('I' == inByte || 'i' == inByte) { // Identify
          Serial.print("iB");
        } 
      }

      average = getAverage();
      if( (average > LOWERBOUND) && (average < UPPERBOUND) )
      {
        bottle_count++;
      }
      else if( average > UPPERBOUND)
      {
        not_bottle_count++;
      }
      else
      {
        inactive_count++; 
      }

      if( (bottle_count > 20000) || (not_bottle_count > 20000) )
      {
        Serial.print("C"); 
        delay(1000); //Output that it is choking every second
        inactive_count = 21; //break the loop
        choking = 1;  
      }

    }

    if( choking == 1)
    {
      choking = 0;
    }
    else
    {
      if(bottle_count > 40 || not_bottle_count > 40)
      {
        if(bottle_count > (not_bottle_count/4)){
          Serial.print("B");
        } //Transmits a B if a bottle is detected
        else                               {
          Serial.print("N");
        } //Transmits a N if object detected is not a bottle
      }
    }

    inactive_count=0;
    bottle_count=0;
    not_bottle_count=0;
  }  

}

int getAverage()
{
  total= total - readings[index];         
  readings[index] = analogRead(PIN);
  total= total + readings[index];       
  index = index + 1;                   

  if (index >= numReadings)             
    index = 0;                          

  return total / numReadings;
}



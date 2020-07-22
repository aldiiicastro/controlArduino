#include <Ultrasonic.h>
#define Motor1_1 2 //Pin 2 L293D
#define Motor1_2 3 //Pin 7 L293D
#define Motor2_1 4 //Pin 15 L293D
#define Motor2_2 5 //Pin 12 L293D
Ultrasonic sensor(9,8); //Hay que buscar e instalar la libreria de ultrasonic 
char dato;
long int distancia=0;

void setup() {
  Serial.begin(9600);
  pinMode(Motor1_1, OUTPUT);
  pinMode(Motor1_2, OUTPUT);
  pinMode(Motor2_1, OUTPUT);
  pinMode(Motor2_2, OUTPUT);
}
void loop() {
      distancia=sensor.read(CM);
      if (Serial.available() > 0) {
            dato = Serial.read();
      }

      switch (dato) {
        case 'G':
          if (distancia > 15) { 
              distancia=sensor.read(CM);
              Adelante();
              break;
            }
          else {Alto();}
        case 'H':
          if (distancia > 15) { 
              Derecha();
              break;
              distancia=sensor.read(CM);
           }
          else {Alto();}
        case 'J':
          if (distancia > 15) { 
            Izquierda();
            break;
            distancia=sensor.read(CM);
          }
        else {Alto();}
        case 'I':
          Alto();
          break;
        case 'K':
          Reversa();
          break;
        default:
          Alto();
          break;
      }
}

void Adelante() {
  digitalWrite(Motor1_1, LOW);
  digitalWrite(Motor1_2, HIGH);
  digitalWrite(Motor2_2, HIGH);
  digitalWrite(Motor2_1, LOW);
}

void Derecha() {
  digitalWrite(Motor1_1, LOW);
  digitalWrite(Motor1_2, HIGH);
  digitalWrite(Motor2_2, LOW);
  digitalWrite(Motor2_1, HIGH);
}

void Izquierda() {
  digitalWrite(Motor2_2, HIGH);
  digitalWrite(Motor2_1, LOW);
  digitalWrite(Motor1_1, HIGH);
  digitalWrite(Motor1_2, LOW);
}

void Alto() {
  digitalWrite(Motor2_2, LOW);
  digitalWrite(Motor2_1, LOW);
  digitalWrite(Motor1_1, LOW);
  digitalWrite(Motor1_2, LOW);
}

void Reversa() {
  digitalWrite(Motor1_1, HIGH);
  digitalWrite(Motor1_2, LOW);
  digitalWrite(Motor2_2, LOW);
  digitalWrite(Motor2_1, HIGH);
}

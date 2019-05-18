//This is the Main file
import java.util.Random;
Random Aleatorio = new Random();

Cubo Player;
Cubo[] NPCs;

int dificultad;


void setup(){
Player = new Cubo(width,height,50,width/2,height/2);
NPCs = new Cubo [20];
  for (int i=0; i<20; i++){
    NPCs[i] = new Cubo(width,height, 20,Aleatorio.nextInt(1024-200)+100, Aleatorio.nextInt(768-200)+100);
  }

  size(1024,768);
  

}

void draw(){
  background(0);
  for (int i=0; i<20; i++){
    NPCs[i].Dibujar();
    NPCs[i].CambioTransparencia();
  }

  
  Player.Dibujar();
  Player.CambioTransparencia();

  
}
void keyPressed(){
Player.PlayerMovimiento(key);
}

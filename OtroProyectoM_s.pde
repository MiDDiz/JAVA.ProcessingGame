import java.util.Random;
Random Aleatorio = new Random();
Cubo Player = new Cubo(1024,768,50);

Cubo[] NPCs;

int dificultad;


void setup(){
/* NPCs = new Cubo [20];
  for (int i=0; i<20; i++){
    NPCs[i] = new Cubo(Aleatorio.nextInt(1024-200)+100, Aleatorio.nextInt(768-200)+100, 20);
  }*/

  size(1024,768);
  

}

void draw(){
  background(0);
 /* for (int i=0; i<20; i++){
    NPCs[i].Dibujar();
    NPCs[i].CambioTransparencia();
  }*/

  
  Player.Dibujar();
  Player.CambioTransparencia();

  
}
void keyPressed(){
Player.PlayerMovimiento(key);
}

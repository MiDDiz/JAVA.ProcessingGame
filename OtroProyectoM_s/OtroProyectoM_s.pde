//This is the Main file
import java.util.Random;
import java.util.concurrent.TimeUnit;
Random Aleatorio = new Random();
float ene_vel;

ArrayList<Enemigo> enemigos;
Cubo Jugador;

int dificultad, enemigos_esquivados, diff_a_batir,new_enemigos_esquivados;
color colorGlobal;

void setup(){
  ene_vel=10;
  diff_a_batir=20;
  cambioColor();
  size(1024,768);
  dificultad = 1;
  colorGlobal=color(220,0,0);
  enemigos  = new ArrayList<Enemigo>();
  
  Jugador = new Cubo(width,height,50,width/2,height/2);
}

void draw(){
  
  if(new_enemigos_esquivados > diff_a_batir){
    CambioDificultad();
  }
  noStroke();
  if (!Jugador.estadoVida){
    fill(0,0,0,100);
    rect(0,0,width,height);
    fill(255,255,255,50);
    textSize(15);
    text("Enemigos esquivados: " + enemigos_esquivados, 30,30);
    text("Dificultad: " + dificultad,30,45);
    fill(colorGlobal);
    textSize(30);
    text((new_enemigos_esquivados*100/diff_a_batir) + "%", width-70,height-20);
  for(Enemigo enemy: enemigos){
    enemy.display();
  }
  Jugador.Mover();
  Jugador.Dibujar();
  Jugador.CambioTransparencia();
  
  ArrayList<Enemigo> nextEnemies = new ArrayList<Enemigo>();
  for(Enemigo enemy: enemigos){
    enemy.update();
    if(!enemy.isDead){
      nextEnemies.add(enemy);
     
    }
  }
  enemigos = nextEnemies;
  
  if(random(1) < (0.02 * dificultad)){
    enemigos.add(new Enemigo());
  }
  



  }
  else{
    background(0);
    textSize(32);
    text("            Has muerto xd\nPulsa espacio para volver a jugar.\n             Puntuacion: " + enemigos_esquivados, width/2-250, height/2);
  }
}
void keyPressed(){
Jugador.setMover(keyCode, true);
  if (Jugador.estadoVida && keyCode == ' '){      
      GameReset();
  }
}
void keyReleased(){
Jugador.setMover(keyCode, false);
}

void cambioColor(){
  if (dificultad==1  || dificultad == 2){
    colorGlobal = color(232,0,0);
  }else{
  if (dificultad==3 || dificultad == 4){
    colorGlobal = color(244, 134, 65);
    ene_vel=11;
  }else{
  if (dificultad==5  || dificultad == 6){
    colorGlobal = color(255, 250, 0);
    ene_vel=12;
  }else{
  if (dificultad==7  || dificultad == 8){
    colorGlobal = color(136, 255, 0);
    ene_vel=13;
  }else{
  if (dificultad==9  || dificultad == 10){
    colorGlobal = color(0, 255, 157);
    ene_vel=14;  
}else{
  if (dificultad==11  || dificultad == 12){
    colorGlobal = color(66, 134, 244);
    ene_vel=15;  
}}}}}}
}
void GameReset(){
      Jugador.estadoVida = false;
      dificultad = 1;  
      cambioColor();
      enemigos_esquivados = 0;
      new_enemigos_esquivados = 0;
      diff_a_batir = 20;
      for(Enemigo e: enemigos){
        e.isDead = true;
    }  
}

void CambioDificultad(){
    diff_a_batir+=new_enemigos_esquivados;
    dificultad++;
    cambioColor();
    new_enemigos_esquivados = 0;
    fill(colorGlobal,255);
    rect(10,10,width-70,height-20);
}

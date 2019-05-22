//This is the Main file
import java.util.Random;
import java.util.concurrent.TimeUnit;
Random Aleatorio = new Random();

ArrayList<Enemy> enemies;
Cubo Player;




void setup(){
  size(1024,768);

   enemies = new ArrayList<Enemy>();
  
  Player = new Cubo(width,height,50,width/2,height/2);
}

void draw(){
  noStroke();
  if (!Player.isDead){
  background(0);
  for(Enemy enemy: enemies){
    enemy.display();
  }

  ArrayList<Enemy> nextEnemies = new ArrayList<Enemy>();
  for(Enemy enemy: enemies){
    enemy.update();
    if(!enemy.isDead){
      nextEnemies.add(enemy);
    }
  }
  enemies = nextEnemies;

  if(random(1) < 0.02){
    enemies.add(new Enemy());
  }
  Player.move();
  Player.Dibujar();
  Player.CambioTransparencia();


  }
  else{
  background(0);
  textSize(32);
  text("Has muerto xd", width/2-100, height/2);
  }
}
void keyPressed(){
Player.setMove(keyCode, true);
}
void keyReleased(){
Player.setMove(keyCode, false);
}

class Enemigo{
  
  PVector loc;
  float vel;
  float size;
  int respawn;
  boolean isDead;
  
  Enemigo(){
    size = 25;
    loc = new PVector(random(size, width - size), -size / 2);
    vel = ene_vel;
    respawn = int(random(60));
    isDead = false;
  }
  
  void display(){
    if (dificultad%2!=0){
      noFill();
      stroke(colorGlobal);
      strokeWeight(2);
      rect(loc.x, loc.y, size, size);
    }else{
        fill(colorGlobal);
        rect(loc.x, loc.y, size, size);
      }
  }

  void update(){
    loc.y += vel+(0.25*dificultad);
    if(loc.y > height){
      isDead = true;
      enemigos_esquivados++;
      new_enemigos_esquivados++;
      fill(colorGlobal);
      rect(loc.x-8,height-3,size+16,3);
      fill(colorGlobal,100);
      rect(loc.x-12,height-7,size+24,7);
    }
    respawn++;
    

  }    
}

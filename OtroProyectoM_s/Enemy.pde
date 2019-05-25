class Enemy{
  
  PVector loc;
  float vel;
  float size;
  int respawn;
  boolean isDead;
  
  Enemy(){
    size = 25;
    loc = new PVector(random(size / 2, width - size / 2), -size / 2);
    vel = 10;
    respawn = int(random(60));
    isDead = false;
  }
  
  void display(){
    noFill();
    stroke(255, 0, 0);
    rect(loc.x, loc.y, size, size);
  }

  void update(){
    loc.y += vel;
    if(loc.y > height){
      isDead = true;
    }
    respawn++;
    

  }    
}


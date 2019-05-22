//Random Aleatorio = new Random();//Por si acaso ;)
 class Cubo{
   PVector position;
   PVector velocity;
   PVector direction;


   boolean isDead;
   
   float size; 
  
   boolean arriba,abajo,izda,drcha;
   
   float ancho; //Necesarios para hacer ciertas cosas, toman los valores de la pantalla de juego.
   float alto;

  float transparencia; //Indice de cambio de transparencia, usado para generar defecto de respiracion ene el color del objeto.
  boolean blkToWht; //Necesario para saber la direcion que se toma durante el proceso de respiracion //TODO: Encontrar una mejor manera de hacerlo.
  
  Cubo(float anchoPantalla, float altoPantalla, float tamanyo, float posLargo,float posAncho){
    isDead = false;
    ancho = anchoPantalla;
    alto = altoPantalla;

    
    position = new PVector (posLargo, posAncho);
    //this.posLargo = posLargo; //Posicion inical del objeto TODO: Cambiarlo a una mejor.
    //this.posAlto = posAncho;
    
    velocity = new PVector(5,5);
    size = tamanyo; //Usado para crear varios objetos player sin necesidad de modificar los valores tipo: Objeto.size=xx;
    
    transparencia = 255; //Transparencia default -> Empieza en blanco.
    blkToWht = false; //Estado de respiracion default: El cubo empieza en blanco, asi que tendrá que ir: White -> Black y no Black -> White.
  }
  
  void CambioTransparencia(){
    
    if (!blkToWht && !(transparencia <= 0)){ //El estado de respiracion es: White -> Black y la transparencia ha de seguir bajando.
      transparencia-=10;
    }
    else{
      if(!blkToWht && (transparencia <= 0)){ 
        transparencia=0; 
        blkToWht = true;
      }
      else{
        if(blkToWht && !(transparencia >= 255)){
            transparencia+=10;
        }
        else{
          if(blkToWht && (transparencia >= 255)){
            transparencia=255; 
            blkToWht = false;
          }
        }
      }
    }
 
}
  
  void Dibujar(){
    if (!isDead){
      noStroke();
      fill(0, 153, 255);//(51, 204, 255);
      rect(position.x,position.y,size,size);
      fill(230,230,250,transparencia);
      rect(position.x,position.y,size,size);
    }  
}
  void move(){ 
    /*
    Constrain significa que el parametro se modifica pero siempre que esté entre unos valores. 
    Esta modificacion consiste en añadirle la velocidad a cada componente del vector posicion segun si 
    va a derecha o a izquierda. Hacemos una refundicion de los booleans a int para que si false == 0 y si 
    true == 1, asi podemos controlar la direccion de movimiento.
    */
    position.x = constrain(position.x + velocity.x*(int(izda) - int(drcha)), 0, width - size);
    position.y = constrain(position.y + velocity.y*(int(abajo) -int(arriba)), 0, height - size);
    
    for(Enemy e: enemies){
      if(abs(position.x - e.loc.x) < size / 2 + e.size / 2 && abs(position.y - e.loc.y) < size / 2 + e.size / 2){
        isDead = true;
        e.isDead = true;
        break;
      }
    }

}
  

  
  boolean setMove(int tecla, boolean presion){ //Se usa un int para representar un char debido a que "w" y "W" tienen
    switch(tecla){                             //el mismo KeyCode
    case 'W':
      return arriba = presion;
    case 'S':
      return abajo = presion;
    case 'D':
      return izda = presion;
    case 'A':
      return drcha = presion;
    default:
      return presion;
  }
  }


  
 }

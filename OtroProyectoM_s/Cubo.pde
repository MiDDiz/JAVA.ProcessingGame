//Random Aleatorio = new Random();//Por si acaso ;)
 class Cubo{
  float posLargo;//Sirven para crear varios objetos Cubo.
  float posAlto;
  float size; 
  
  float n=0.02; //Valor de acceleracion en void Movimiento()
  float vel=5; //Valor de base del movimiento;
  String velDirection; //Direccion que llevaba el objeto en el ultimo loop. Se explica su uso en detalle en los comentarios de la funcion Movimiento()
  
  float ancho; //Necesarios para hacer ciertas cosas, toman los valores de la pantalla de juego.
  float alto;

  float transparencia; //Indice de cambio de transparencia, usado para generar defecto de respiracion ene el color del objeto.
  boolean blkToWht; //Necesario para saber la direcion que se toma durante el proceso de respiracion //TODO: Encontrar una mejor manera de hacerlo.
  
  Cubo(float anchoPantalla, float altoPantalla, float tamanyo, float ancho, float alto){
    
    this.ancho = anchoPantalla;
    this.alto = altoPantalla;
    
    velDirection="North"; //Direccion default, sirve para inicializar la variable.
    
    this.posLargo = ancho; //Posicion inical del objeto TODO: Cambiarlo a una mejor.
    this.posAlto = alto;
    
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
    fill(0, 153, 255);//(51, 204, 255);
    rect(posLargo,posAlto,size,size);
    fill(230,230,250,transparencia);
    rect(posLargo,posAlto,size,size);
  }


  void PlayerMovimiento(char tecla){
    String selfVelDirection;
    //Voy a explicarlo todo para un solo case, ya que el resto funcionan igual pero en direccion diferente.
    switch(tecla){  //Desde la funcion keyPressed en Main(), se pasa la tecla que se ha presionado, dependiendo de cual es, el objeto se comporta de manera diferente.
        case 'w':   //Se comparan entre las 4 tipicas teclas de movimiento, en este caso es w asi que tendrá que subir.
        selfVelDirection = "North"; //Direccion que tiene que seguir la variable "velDireccion" para que siga sumando valor: Esto es para conseguir un efecto de acceleracion.
        if(selfVelDirection.equals(velDirection)) {  //Si ambas direcciones coinciden entonces no hay problema, y la velocidad podrá seguir aumentando respecto al valor dado n, que en este caso es nuestra acceleracion.
          if (vel < 10){ //No podemos permitir que la velocidad maxima sea infinita, asi que ponemos unlimitante, en este caso es 10.
            vel=vel+vel*n; //Si no supera el limitante la velocidad podrá aumentar proporcionalmente en "n" o "accel", como la llamará idk xD;
          } else{ //Si la acceleracion superase de algun modo el 10, se reinstauraría en 10 automáticamente.
            vel=10;
          } 
        }else{
          velDirection="North"; //Si, anteriormente la direccion de la velocidad era distinta a selfVelDirection, el momento lineal no se debería consevar si se gira 90º,
          vel=5;                // asi que se resetea la velocidad y se indica que la nueva direccion es la de Norte para que se pueda ganar velocidad.
        }
        if(posAlto > 0){ //Este if controla la posicion, no queremos que nuestro objeto se salga de la pantalla, asi que controlamos que no se salga. Si no hay problema, la posicion varía con el valor "vel".
                        
            posAlto -= vel;
            //print(vel+ " "); //Para debugging
            
          }else{ //Si vemos que ha sobrepasado el 0, lo reseteamos a 0 y no permitimos que vuelva a moverse a esta direccion gracias a que (posAlto == 0) && !(posAlto<0) :)
            posAlto=0;
        }
          break; //break por si acaso, vengo de otros lenguajes de programacion que funcionan un poco distinto y si no lo ponias el programa actuaba raro. En java al parecer no, pero por si acaso xD
        case 'a':
          selfVelDirection = "East";
          if(selfVelDirection.equals(velDirection)) {
            if (vel < 10){
              vel=vel+vel*n;
            }else{
              vel=10;
             } 
          }else{
            velDirection="East"; 
            vel=5;
           }
          if (posLargo > 0){
            posLargo-=vel;
            //print(vel+ " ");//Para debugging
          }else{
            posLargo=0;
           }
          break;
        case 's':
          selfVelDirection = "South";
          if(selfVelDirection.equals(velDirection)) {
            if (vel < 10){
              vel=vel+vel*n;
            }else{
              vel=10;
             } 
           }else{
             velDirection="South"; 
             vel=5;
            }
          if (posAlto < (alto-size)){
            posAlto+=vel;
            //print(vel+ " ");//Para debugging
          }else{
            posAlto=alto-size;
           }
          break;
        case 'd':
          selfVelDirection = "West";
          if(selfVelDirection.equals(velDirection)) { 
            if (vel < 10){
              vel=vel+vel*n;
            }else{
              vel=10;
            } 
           }else{
             velDirection="West"; 
             vel=5;
            }
          if (posLargo < (ancho-size)){
            posLargo +=vel;
          // print(vel+ " ");//Para debugging
          }else{
            posLargo=ancho-size;
           }
          break;
    }
  
}
}

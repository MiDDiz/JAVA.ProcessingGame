class Proyectil{
int puntoAparicionX;
int puntoAparicionY;
color colorProyectil;

Proyectil(int anchoMadre, int altoMadre, byte direccionMadre){

puntoAparicionY=altoMadre/2;
if(direccionMadre == 0){ //Direccion es izquierda.
puntoAparicionX=0;
}else{
puntoAparicionY=anchoMadre;
}


}

void Dibuja(color colorProyectil){
fill(colorProyectil);
line(puntoAparicionX,puntoAparicionY,puntoAparicionX+3,puntoAparicionY);

}

void CambiaColor(){
//
}
}

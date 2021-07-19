float px, py, largbol, altbol, speedX, speedY;
float vertx, verty; 
float farbe1, farbe2, farbe3, vorfarbe1,vorfarbe2, vorfarbe3, qMax, cont; // farbe(cor em alemão)
boolean quad;
boolean up, down;
float spaceBall;
int raqX, raqY, raqW, raqH, raqMove;// para criação inicial das raquetes


void setup() {
  // Inicialização dos dados
  size(600, 300);
  px = width/2;
  py = height/2;
  largbol=30;
  altbol=30;
  speedX = 3;
  speedY = 3;
    
  // raquetes
  rectMode(CENTER);
  raqX = 40; 
  raqY = height/2;
  raqW = 30;
  raqH = 100;
  raqMove =2;
  
  
    
  
  // determina o espaço entre as bolinhas
  //spaceBall = largbol+20;
    //posição da bolinha
  vertx = verty = -100;
    

      
  //cores
  vorfarbe1=vorfarbe2=vorfarbe3= 255;
  farbe1=farbe2=farbe3 = 255;
  qMax = 5;
  cont = 0;
  
  //quadrante
  quad = false;
      
    }

void draw() {
  raquete();
  quadra();
  bola();
  incrementa();
  limites();
  moverRaquete();
  limitesRaquete();
  colisao();
}

void quadra(){
  
  stroke(0);
  line(width/2,0,width/2,height);
  line(0,height/2, width,height/2);
  stroke(255,100,255);
  qMax = 5;
  
}

void bola(){
  fill(vorfarbe1, vorfarbe2, vorfarbe3);
  ellipse(vertx, verty, largbol, altbol);
  
  // Faz a nova bolinha, que se move
  fill(farbe1, farbe2, farbe3);
  ellipse(px, py, largbol, altbol);
  
  
}

void incrementa (){
  
  px = px + speedX;
  py = py + speedY;
  
    
  if(px> width -largbol/2 || px <0 +largbol/2){
    speedX=speedX*-1;
  }
  
  if(py>height -altbol/2 || py<0 +altbol/2){
    speedY= speedY*-1;
  }
}
    
  void limites(){ //Delimita os quadrantes e troca as cores
  
  if(((px<width/2 - largbol) && (py<height/2 - largbol))||
     ((px>width/2 + largbol) && (py<height/2 - largbol))||
     ((px<width/2 - largbol) && (py>height/2 + largbol))||
     ((px>width/2 + largbol) && (py>height/2 + largbol))) {
        if(!quad){
          farbe1 = random(255);
          farbe2 = random(255);
          farbe3 = random(255);
      quad = true;
         }
       }
         else {
    quad = false;  
       }
    }


void mousePressed() {
  speedX = random (-1,4);
  speedY = random (-2,3);
  
    }

void raquete(){
  
  background(255);
  fill(0);
  noStroke();
 rect(raqX, raqY, raqW, raqH); // raquete da esquerda
  
  //fill(0);
  //noStroke();
  //rect(raqX*14.3, raqY, raqW, raqH); // raquete da direita
 }
void moverRaquete(){
  if(up){
    raqY = raqY -raqMove;
  }
  if (down){
    raqY = raqY +raqMove;
  }
    
}

void limitesRaquete(){
  if (raqY - raqH/2 <0) {
      raqY = raqY+ raqMove;
      }
  if (raqY + raqH/2 >height) {
      raqY = raqY- raqMove;
      }
  
}

   void colisao () {
   if (px-largbol/2 <raqX + raqW/2 && py-altbol/2 <raqY + raqH/2 && py+altbol/2 >raqY - raqH/2){
   speedX = -speedX;

}

}

void keyPressed() {
    
  if (key == 'w'|| key =='W'){
    up = true;
  }
if (key == 's'|| key =='S'){
    down = true;
  }
}

void keyReleased (){
  if (key == 'w'|| key =='W'){
    up = false;
  }
if (key == 's'|| key =='S'){
    down = false;
  }
}

//https://github.com/danieleleitedemorais/base-pong/blob/main/README.md

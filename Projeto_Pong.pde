float px, py, largbol, altbol, speedX, speedY;
float vertx, verty; 
float cor1, cor2, cor3, acor1,acor2, acor3, qMax, cont; 
boolean quad;
boolean up, down;
int raqX, raqY, raqW, raqH, raqMove;// raquete


void setup() {
  // Inicialização dos dados
  size(600, 300);
  px = width/2;
  py = height/2;
  largbol=30;
  altbol=30;
  speedX = 3;
  speedY = 3;
    
  // raquete
  rectMode(CENTER);
  raqX = 40; 
  raqY = height/2;
  raqW = 30;
  raqH = 100;
  raqMove =2;
  
  
  //posição da bolinha no canto
  vertx = verty = -100;
    
     
  //cores
  acor1=acor2=acor3= 255;
  cor1=cor2=cor3 = 255;
  cont = 0;
  
  //quadrante
  quad = false;
      
    }

void draw() {
  raquete();
  quadra();
  bola();
  incrementa();
  TrocaCor();
  moverRaquete();
  limitesRaquete();
  colisao();
}

void quadra(){
  
  stroke(0);
  line(width/2,0,width/2,height);
  line(0,height/2, width,height/2);
  stroke(255,100,255);
    
}

void bola(){
  fill(acor1, acor2, acor3);
  ellipse(vertx, verty, largbol, altbol);
  
  // Faz a nova bolinha, que se move
  fill(cor1, cor2, cor3);
  ellipse(px, py, largbol, altbol);
  
  
}

void incrementa (){ // incrementa e quica
  
  px = px + speedX;
  py = py + speedY;
  
    
  if(px> width -largbol/2 || px <0 +largbol/2){
    speedX=speedX*-1;
  }
  
  if(py>height -altbol/2 || py<0 +altbol/2){
    speedY= speedY*-1;
  }
}
    
  void TrocaCor(){ //Delimita os quadrantes e troca as cores
  
  if(((px<width/2 - largbol) && (py<height/2 - largbol))||
     ((px>width/2 + largbol) && (py<height/2 - largbol))||
     ((px<width/2 - largbol) && (py>height/2 + largbol))||
     ((px>width/2 + largbol) && (py>height/2 + largbol))) {
        if(!quad){
          cor1 = random(255);
          cor2 = random(255);
          cor3 = random(255);
      quad = true;
         }
       }
         else {
    quad = false;  
       }
    }

void raquete(){
  background(255, 255, 0);
  fill(0);
  noStroke();
  rect(raqX, raqY, raqW, raqH); // raquete da esquerda
  
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


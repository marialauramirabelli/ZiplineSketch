import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer woohoo, music;

//coordinates for size(2000, 1500);
Place p1 = new Place("BAHÍA DRAKE", "BahiaDrake.JPG", "", 1389, 1111, true, false);
Place p2 = new Place("GANDOCA - MANZANILLO", "GandocaManzanillo.jpg", "", 1793, 757, true, false); 
Place p3 = new Place("JACÓ - HERRADURA", "JacoHerradura.jpg", "", 987, 739, true, false);
Place p4 = new Place("OSTIONAL", "Ostional.png", "", 547, 585, true, false);
Place p5 = new Place("PUERTO JIMÉNEZ", "PuertoJimenez.jpg", "", 1510, 1187, true, false); 
Place p6 = new Place("QUEPOS - MANUEL ANTONIO", "QueposManuelAntonio.jpg", "", 1184, 827, true, false);
Place p7 = new Place("SAN ISIDRO DE EL GENERAL", "SanIsidroDeElGeneral.jpg", "", 1373, 846, true, false);
Place p8 = new Place("BRAULIO CARRILLO", "BraulioCarrillo.jpg", "", 1304, 494, true, false);
Place p9 = new Place("POÁS", "VolcanPoas.jpg", "", 1135, 498, true, false);
Place p10 = new Place("SAN RAMÓN", "SanRamon.jpg", "", 1039, 559, true, false);
Place p11 = new Place("CIUDAD QUESADA", "CiudadQuesada.JPG", "", 1030, 438, true, false);
Place p12 = new Place("ARENAL", "Arenal.jpg", "", 923, 366, true, false);
Place p13 = new Place("MONTEVERDE", "Monteverde.jpg", "", 889, 467, true, false);
Place p14 = new Place("TURRUBARES", "Turrubares.jpg", "", 1010, 628, true, false);

Place p15 = new Place("NOSARA", "BotaderoNosara.jpg", "[error:  nosara_landfill]", 561, 609, false, false);
Place p16 = new Place("LA CARPIO", "LaCarpio.jpg", "[error:  la_carpio_slum]", 1144, 590, false, false);
Place p17 = new Place("CRUCITAS", "MinaCrucitas.jpg", "[error:  crucitas_gold_mining]", 1086, 239, false, false);
Place p18 = new Place("SANTA CLARA", "SantaClara.jpg", "[error:  santa_clara_pineapple_plantation]", 982, 394, false, false);
Place p19 = new Place("ASERRÍ", "RellenoSanitarioEBIAserri.jpg", "[error:  aserrí_landfill]", 1198, 632, false, false);
//Place p20 = new Place("BALSA", "RioVirilla.jpg", "[error: virilla_river]", 1078, 612, false, false);
Place p21 = new Place("TÁRCOLES", "RioTarcoles.jpg", "[error:  tárcoles_river]", 973, 668, false, false);
//Place p22 = new Place("CURRIDABAT", "LaGaleraCurridabat.jpg", "[error: curridabat_traffic_jam]", 1154, 630, false); // , false);
Place p23 = new Place("NICOYA", "TajoPedregalNicoya.jpg", "[error:  nicoya_surface_mining]", 644, 532, false, false);
Place p24 = new Place("SARAPIQUÍ", "RefugioMaquenque.jpeg", "[error:  sarapiquí_protected_wildlife_area]", 1170, 325, false, false); 

Place [] places = {p15, p16, p17, p18, p19, 
//p20, 
p21, 
//p22, 
p23, p24, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14};

String [][] facts = {{"[error:  nosara_landfill]", "open dump created due to municipality's negligence", "contamination of surface water and groundwater", 
"threat to ostional wildlife national refuge, nesting site for olive ridley sea turtles"},
{}
};

StringList person = new StringList("FemaleZipline1.png", "MaleZipline1.png", "FemaleZipline2.png", "MaleZipline2.png"); //, "FemaleZipline3.png", "MaleZipline3.png");
StringList voice = new StringList("FemaleWoohoo.mp3", "MaleWoohoo.mp3");

//loaded images
PImage map, postcard, tourist, placeImg;

PFont font1, font2, font3, font4;

float x1, x, y;
float increment1;
//increment2

int stage, gender, narrativeClicked, opacity;
boolean start, startish, narrativeButton, endButton, placeClicked, postcardShown, errorClicked;

String error;
//String text = "'One of the reasons that Costa Rica is known throughout the world is for its natural beauty. Our national parks and protected areas systems cover around 25.21% of the country’s area, including a great variety of flora and fauna, housing 5% of the world’s biodiversity.'";
StringList narrativeText = new StringList("One of the reasons that Costa Rica is known throughout the world is for its natural beauty.", 
"Our national parks and protected areas systems cover around 25.21% of the country’s area,", 
"including a great variety of flora and fauna, housing 5% of the world’s biodiversity.",
"START VACATION");

void setup() {
  //size(2000, 1000);
    
  fullScreen();
  frameRate(30);
  
  start = true;
  startish = true;
  
  stage = -1;
  gender = 0;
  narrativeClicked = 0;
  narrativeButton = false;
  endButton = false;
  placeClicked = false;
  errorClicked = false;
  opacity = 0;
  
  x1 = 0;
  x = 150;
  increment1 = 1.45;
  //increment2 = 1.8;
  
  font1 = createFont("Louis George Cafe Bold.ttf", 40);
  font2 = createFont("Louis George Cafe Italic.ttf", 32);
  font3 = createFont("Louis George Cafe.ttf", 32);
  font4 = createFont("Retro Gaming.ttf", 32);
  
  minim = new Minim(this);
  woohoo = minim.loadFile(voice.get(gender%2));
  music = minim.loadFile("MiLinda.mp3");
  
  postcard = loadImage("POSTCARD_COSTARICA.png");
  map = loadImage("MAP_COSTARICA.png");
  tourist = loadImage(person.get(gender));
}

void setupish(){
  startish = true;
  
  stage = -1;
  gender = 0;
  narrativeClicked = 0;
  narrativeButton = false;
  endButton = false;
  placeClicked = false;
  errorClicked = false;
  opacity = 0;
  
  x1 = 0;
  x = 150;
  increment1 = 1.45;
  //increment2 = 1.8;
  
  music.pause();
  
  woohoo = minim.loadFile(voice.get(gender%2));
  tourist = loadImage(person.get(gender));
}

void reset(){
  stage = 0;
  placeClicked = false;
  errorClicked = false;
  
  x = 150;
  increment1 = 1.8;
  //increment2 = 1.8;
  
  if(gender < person.size() - 1){
    gender++;
  }
  else{
    gender = 0;
  }
  
  woohoo = minim.loadFile(voice.get(gender%2));
  tourist = loadImage(person.get(gender));
}

class Place { 
  String name, file, description;
  int x, y;
  boolean esencial, chosen;
  int ellipseSize = 40;
  
  Place (String placeName, String placeFile, String placeDescription, int placeX, int placeY, boolean placeEsencial, boolean placeChosen){
    name = placeName; 
    file = placeFile;
    description = placeDescription;
    x = placeX;
    y = placeY;
    esencial = placeEsencial;
    chosen = placeChosen;
  }
  
  void showEllipse(){
    strokeWeight(10);
    if(esencial){
      stroke(0, 137, 58);
      if(sqrt(sq(x - mouseX) + sq(y - mouseY)) < ellipseSize/2 ){
        fill(0, 137, 58);
      }
      else{
        if(chosen){
          fill(0, 117, 0);
        }
        else{
          fill(0, 167, 0);
        }
      }
    }
    else{
      stroke(1, 25, 54, opacity);
      if(sqrt(sq(x - mouseX) + sq(y - mouseY)) < ellipseSize/2 ){
        fill(1, 25, 54, opacity);
      }
      else{
        if(chosen){
          fill(20, 51, 49, opacity);
        }
        else{
          fill(62, 149, 146, opacity);
        }
      }
    }
    ellipse(x, y, ellipseSize, ellipseSize);
  }
  
  void showName(){
    if(sqrt(sq(x - mouseX) + sq(y - mouseY)) < ellipseSize/2 ){
      noStroke();
      if(esencial){
        textFont(font1);
        textSize(40);
        
        float tw = textWidth(name) + 5;
        float heightBox = 60;
        float yBox = mouseY - ellipseSize - heightBox/2;
        
        fill(0, 167, 0);
        rect(mouseX, yBox, tw + 5, heightBox - 10);
         
        fill(255);
        text(name, mouseX + 5, yBox, tw, heightBox);
      }
    }
  }
  
  void setFile(){
    if(sqrt(sq(x - mouseX) + sq(y - mouseY)) < ellipseSize/2 ){
      if((esencial == false && opacity > 0) || esencial){
        placeImg = loadImage(file);
        placeClicked = true;
        chosen = true;
        if(opacity < 100);
        opacity += 15;
        
        if(esencial){
          music.unmute();
          postcardShown = true;
        }
        else{
          music.mute();
          postcardShown = false;
          error = description;
        }
      }
    }
  }
  
  void changeCoordinates(int mapWidth){
    int widthAdjustment = width/2 - mapWidth/2;
    x = (x*mapWidth/2000)+ widthAdjustment;
    y = y*height/1500;
    
    ellipseSize = height/40;
  }
}

void narrative(){
  background(1, 25, 54);
  
  textFont(font2);
  textSize(66);
  fill(255);
  textAlign(CENTER, CENTER);
  if(narrativeClicked == 0){
    text(narrativeText.get(0), width/2, height/2);
  }
  else if(narrativeClicked == 1){
    text(narrativeText.get(1), width/2, height/2);
    text(narrativeText.get(2), width/2, height/2 + 80);
  }
  else if(narrativeClicked == 2){ 
    textFont(font1);
    textSize(90);
    text(narrativeText.get(3), width/2, height/2);
  }
  
  strokeWeight(10);
  stroke(0, 137, 58);
  
  if(sqrt(sq(width/2 - mouseX) + sq(height/5*3.5 - mouseY)) < height/12/2 ){
    fill(0, 137, 58);
    ellipse(width/2, height/5*3.5, height/12, height/12);
    narrativeButton = true;
    fill(225);
  }
  else{
    fill(0, 167, 0);
    ellipse(width/2, height/5*3.5, height/12, height/12);
    narrativeButton = false;
    fill(255);
  }
  
  textFont(font1);
  textSize(140);
  text(">", width/2, height/5*3.5 - 27.5); 
  
  textAlign(LEFT, TOP);
}

float getY(float xCoordinate, float imgWidth){
  float yIntercept = -5;
  float xPoint = imgWidth;
  float yPoint = height/7;
  
  float slope = (yPoint - yIntercept)/xPoint;
  float yCoordinate = (xCoordinate*slope) + yIntercept;
  
  return yCoordinate;
}

void drawEllipses(float imgWidth, boolean esencial){
  float radiusX = 20;
  float radiusY = 0.5;
  
  for(int i=0; i<(width*5); i++){
    if(esencial){
      stroke(1, 25, 54);
      fill(1, 25, 54);
    }
    else{
      stroke(0);
      fill(0);
    }
    float j = (i/4) + x1;
    ellipse(j, getY(j, imgWidth), radiusX, radiusY);
  }
}

void moveTourist(float imgWidth){
  float xImg = 260;
  float yImg = 8;
  float y1 = getY(x1, imgWidth);
  
  x *= increment1;
  //increment1 *= increment2;
  y = getY(x, imgWidth);
  
  imageMode(CORNER);
  image(tourist, x - xImg + x1, y - yImg + y1);
  //imageMode(CORNER);
  
  float wait = imgWidth/14;
  
  if(gender == 1){
    wait = imgWidth/7;
  }
  
  if (x > wait){
   woohoo.play();
  }
  
  if((x - xImg) > width){
    stage++;
    woohoo.unmute();
    music.unmute();
  }
}

void showError(String error){
  textFont(font4);
  textSize(50);
  
  float tw = textWidth(error) + 40;
  
  if(mouseX > (width/2 - tw/2) && mouseX < (width/2 + tw/2) && mouseY > (height/10*9 - 65/2) && mouseY < (height/10*9 + 65/2)){
    errorClicked = true;
    fill(100);
    rectMode(CENTER);
    rect(width/2, height/10*9, tw, 65);
    rectMode(CORNER);
    fill(225);
  }
  else{
    errorClicked = false;
    fill(0);
    rectMode(CENTER);
    rect(width/2, height/10*9, tw, 65);
    rectMode(CORNER);
    fill(255);
  }
  
  textAlign(CENTER, CENTER);
  text(error, width/2, height/10*9 - 7);
  textAlign(LEFT, TOP);
}

void end(){
  strokeWeight(10);
  stroke(0, 137, 58);
  if((mouseX > (width/25*22.5)) && (mouseX < (width/25*24.5)) && (mouseY < (height/25*2.5)) && (mouseY > (height/25))){
    fill(0, 137, 58);
    endButton = true;
  }
  else{
    fill(0, 167, 0);
    endButton = false;
  }
  rectMode(CORNERS);
  rect((width/25*22.5), (height/25*2.5), (width/25*24.5), (height/25));
  rectMode(CORNER);
  
  textFont(font1);
  textSize(30);
  fill(255);
  textAlign(CENTER, CENTER);
  text("END VACATION", ((width/25)*(24.5 - 22.5)/2) + (width/25*22.5), ((height/25)*(2.5)/2) + (height/25)/2);
  textAlign(LEFT, TOP);
}

void mouseClicked(){
  if(stage == -1){
    if(narrativeClicked < 2 && narrativeButton){
      narrativeClicked++;
    }
    else if(narrativeClicked == 2 && narrativeButton){
      stage++;
    }
  }
  else if(stage == 0){
    for(int i=0; i<places.length; i++){
      places[i].setFile();
    }
    if(placeClicked){
      stage++;
    }
    
    if((mouseX > (width/25*22.5)) && (mouseX < (width/25*24.5)) && (mouseY < (height/25*2.5)) && (mouseY > (height/25)) && endButton){
      setupish();
    }
  }
  else if(stage == 1){
    if(postcardShown == false && errorClicked){
      //showInfo();
    }
  }
}

void draw() {
  println(frameRate);
  if(stage == -1){ 
    narrative();
  }
  else if(stage == 0){
    
    if(startish){
      music.loop();
      music.rewind();
      
      if(start){
        map.resize(height*map.width/map.height, height);
        for(int i=0; i<places.length; i++){
          places[i].changeCoordinates(map.width);
        }
      }

      start = false;
      startish = false;
    }
    background(1, 25, 54);
    
    end();
    
    fill(255);
    
    imageMode(CENTER);
    image(map, width/2, height/2);
    imageMode(CORNER);
    
    for(int i=0; i<places.length; i++){
      places[i].showEllipse();
      places[i].showName();
    }
    
  }
  else if(stage == 1){ 
    noStroke();
    
    placeImg.resize(height*placeImg.width/placeImg.height, height);
    postcard.resize(height*postcard.width/postcard.height, height);
    
    imageMode(CENTER);
    image(placeImg, width/2, height/2);
    imageMode(CORNER);
    
    if(postcardShown){
      x1 = width/2 - postcard.width/2;
    }
    else{
      x1 = width/2 - placeImg.width/2;
    }
    
    drawEllipses(width/2 + placeImg.width/2, postcardShown);
    moveTourist(width/2 + placeImg.width/2);
    
    if(postcardShown){
      noStroke();
     
      imageMode(CENTER);
      image(postcard, width/2 - 1, height/2);
      imageMode(CORNER);
      
      fill(241, 236, 202);
      rect(0, 0, (width - postcard.width)/2, height);
      rect(width/2 + postcard.width/2 - 10, 0, (width - postcard.width)/2, height);
    }
    else{
      noStroke();
      
      showError(error);
      
      fill(0);
      rect(0, 0, (width - placeImg.width)/2, height);
      rect(width/2 + placeImg.width/2, 0, (width - placeImg.width)/2, height);
    }
  }
  else if(stage == 2){
    reset();
  }
}

import interfascia.*;
import ddf.minim.*;

AudioPlayer menusong, fightmusic1, notfightmusic ;
Minim minim1;

PImage player, monster, mainpage, menupage, secondfight;
PImage opendoor, fightscene1, winpage, losepage;

GUIController c;
IFTextField t;
IFLabel l;



int pauser=0;
int whichPage=0;
int spotX=120, spotY=375;
int spotX2=120, spotY2=375;
int spotX3=20, spotY3=325;
int life1=5;
int x=(int)random(80, 90);
int y=(int)random(60, 70);
int xR=(int)random(80, 90);
int yR=(int)random(60, 70);
int x2=(int)random(80, 100);
int y2=(int)random(50, 70);
int x3=(int)random(200, 300);
int y3=(int)random(40, 190);
int x3R=(int)random(200, 300);
int y3R=(int)random(40, 190);


String xy=Integer.toString(x-y);
String xyR=Integer.toString(xR-yR);
String xy2=Integer.toString(x2-y2);
String xy3=Integer.toString(x3-y3);
String xy3R=Integer.toString(x3R-y3R);
String xyB=Integer.toString(x*y);
String xyRB=Integer.toString(xR*yR);
String xy2B=Integer.toString(x2*y2);
String xy3B=Integer.toString(x3*y3);
String xy3RB=Integer.toString(x3R*y3R);

int enemylife=3;
int playerlife=3;
String threaten="Solve the following math operations to pass me:";
boolean correct=true;



void setup() {
  size(1021, 640);

  //Images

  player=loadImage("player.png");
  mainpage=loadImage("mainpage.png");
  menupage=loadImage("menupage.png");
  opendoor=loadImage("Second Image.png");
  fightscene1=loadImage("FirstFight.png");
  winpage=loadImage("WinPage.png");
  losepage=loadImage("LosePage.png");
  secondfight=loadImage("SecondFight.png");
  //Audio

  minim1=new Minim(this);
  menusong=minim1.loadFile("menusong.mp3");
  fightmusic1=minim1.loadFile("fightmusic1.mp3");
  notfightmusic=minim1.loadFile("notfightmusic.mp3");

  c = new GUIController(this);
  t = new IFTextField("Text Field", (width/2)-75, 500, 150);
  l = new IFLabel("", 25, 70);

  c.add(t);
  c.add(l);

  t.addActionListener(this);
}

void draw() {
  System.out.println("x = " +x+"; "+"y = "+y+"; "+"x*y = "+xyB);
  if (whichPage==0) //<>//
  {
    startPage();
  }
  if (whichPage==1)
  {
    levelOneStage();
  }
  if (whichPage==2)
  {
    levelOneFight();
  }
  if (whichPage==3)
  {
    losePage();
  }
  if (whichPage==4)
  {
    level2();
  }
  if (whichPage == 5)
  {
   level2fight(); 
  }
  
  if (whichPage == 6)
   {
     winPage();
   }
  if (whichPage==7)
  {
    pauseScreen();
  }
  if (whichPage==8)
  {
    pauseScreen();
  }
}

void startPage() {
  menusong.pause();
  fightmusic1.pause();
  notfightmusic.pause();
  background(mainpage);
  imageMode(CENTER);
  if (whichPage==0&&pauser%2==0) {
    menusong.play();
  }
}

void levelOneStage() {
  background(opendoor);
  image(player, spotX, spotY);
  if (spotX>575 && spotX< 700)
  {
    whichPage=2;
  }

  if (spotX3>width )
  {
    spotX3=0;
  }
  if (spotX3<width)
  {
    spotX3=640;
  }
}

void level2() {
  background(opendoor);
  image(player, spotX2, spotY2);
  text("The fight continues!!!", 200, 100);
  if (spotX2>575 && spotX2< 700)
  {
    whichPage=5;
  }
}


//THIS IS TO POINT OUT THE LEVEL 2 FIGHT
//ITS RIGHT OVER HERE VVVVVV
//HEY BUD, ITS RIGHT BELOW ME!

void level2fight() {
  //Reinitializing numbers for the equation
  
  //int x=(int)random(80, 90);
  //int y=(int)random(60, 70);
  //int xR=(int)random(80, 90);
  //int yR=(int)random(60, 70);
  //int x2=(int)random(80, 100);
  //int y2=(int)random(50, 70);
  //int x3=(int)random(200, 300);
  //int y3=(int)random(40, 190);
  //int x3R=(int)random(200, 300);
  //int y3R=(int)random(40, 190);
  background(secondfight);
  textSize(26);
  fill(0, 250, 0);
  menusong.pause();
  fightmusic1.play();
  enemylife=3;
  playerlife=3;

  text(threaten, 120, 50 );
  text(x+"*"+y+"=", 350, 100);

  //players green life bars
  rect(120, 570, 100, 45);
  rect(220, 570, 100, 45);
  rect(320, 570, 100, 45);

  //monsters green life bars
  rect(670, 570, 100, 42);
  rect(770, 570, 100, 42);
  rect(870, 570, 110, 42);

  if (enemylife==2 && correct && playerlife==3) {
    threaten="You will never win!";
    fill(250, 0, 0);
    rect(870, 570, 110, 42);
    fill(0, 250, 0);
    x=x2;
    y=y2;
  }

  if (enemylife==2 && correct && playerlife==2) {
    threaten="Haha, you fool!";
    fill(250, 0, 0);
    rect(870, 570, 110, 42);
    rect(320, 570, 100, 45);
    fill(0, 250, 0);
    x=x2;
    y=y2;
  }

  if (enemylife==2 && correct && playerlife==1) {
    threaten="The end is neat for you!";
    fill(250, 0, 0);
    rect(870, 570, 110, 42);
    rect(320, 570, 100, 45);
    rect(220, 570, 100, 45);
    x=x2;
    y=y2;
  }

  if (enemylife==1 && correct&&playerlife==3) {
    threaten="Mercy, please, you are too smart!";
    fill(250, 0, 0);
    rect(870, 570, 110, 42);
    rect(770, 570, 100, 42);
    x=x3;
    y=y3;
  }

  if (enemylife==1 && correct && playerlife==2) {
    threaten="I have a chance of defeating you!!";
    fill(250, 0, 0);
    rect(870, 570, 110, 42);
    rect(770, 570, 100, 42);
    rect(320, 570, 100, 45);
    x=x3;
    y=y3;
  }
  rect(770, 570, 100, 42);
  if (enemylife==1 && correct && playerlife==1) {
    threaten="The tides will turn in my favor!!";
    fill(250, 0, 0);
    rect(870, 570, 110, 42);
    rect(770, 570, 100, 42);
    rect(320, 570, 100, 45);
    rect(220, 570, 100, 45);
    x=x3;
    y=y3;
  }

  if (enemylife==0 && correct) {
    whichPage=0;
  }

  if (playerlife==2 && !correct &&enemylife==3) {
    threaten="Haha, you will never succeed!!";
    fill(250, 0, 0);
    rect(320, 570, 100, 45);
    x=xR;
    y=yR;
  }

  if (playerlife==2 && !correct && enemylife==2) {
    threaten="I refuse to lose, harder math for you!";
    fill(250, 0, 0);
    rect(320, 570, 100, 45);
    rect(870, 570, 110, 42);
    fill(0, 250, 0);
    x=xR;
    y=yR;
  }

  if (playerlife==2 && !correct && enemylife==1) {
    threaten="NO, I REFUSE TO BE KILLED.";
    fill(250, 0, 0);
    rect(320, 570, 100, 45);
    rect(770, 570, 100, 42);
    rect(870, 570, 110, 42);
    x=xR;
    y=yR;
  }

  if (playerlife==1 && !correct &&enemylife==3) {
    threaten="Look who's in power now!!";
    fill(250, 0, 0);
    rect(320, 570, 100, 45);
    rect(220, 570, 100, 45);
    x=x3R;
    y=y3R;
  }

  if (playerlife==1 && !correct &&enemylife==2) {
    threaten="Victory shall be mine!!";
    fill(250, 0, 0);
    rect(870, 570, 110, 42);
    rect(320, 570, 100, 45);
    rect(220, 570, 100, 45);
    x=x3R;
    y=y3R;
  }

  if (playerlife==1 && !correct&& enemylife==1) {
    threaten="This will be a close battle!!";
    fill(250, 0, 0);
    rect(870, 570, 110, 42);
    rect(770, 570, 100, 42);
    rect(320, 570, 100, 45);
    rect(220, 570, 100, 45);
    x=x3R;
    y=y3R;
  }
  if (playerlife==0 && !correct) {
    whichPage=3;
  }
}

//YOU MISSED IT, STYUBID


void levelOneFight() {
  textSize(26);
  background(fightscene1);
  fill(0, 250, 0);
  menusong.pause();
  fightmusic1.play();

  text(threaten, 120, 50 );
  text(x+"-"+y+"=", 350, 100);

  //players green life bars
  rect(120, 570, 100, 45);
  rect(220, 570, 100, 45);
  rect(320, 570, 100, 45);

  //monsters green life bars
  rect(670, 570, 100, 42);
  rect(770, 570, 100, 42);
  rect(870, 570, 110, 42);

  if (enemylife==2 && correct && playerlife==3) {
    threaten="You will never win!";
    fill(250, 0, 0);
    rect(870, 570, 110, 42);
    fill(0, 250, 0);
    x=x2;
    y=y2;
  }

  if (enemylife==2 && correct && playerlife==2) {
    threaten="Haha, you fool!";
    fill(250, 0, 0);
    rect(870, 570, 110, 42);
    rect(320, 570, 100, 45);
    fill(0, 250, 0);
    x=x2;
    y=y2;
  }

  if (enemylife==2 && correct && playerlife==1) {
    threaten="The end is neat for you!";
    fill(250, 0, 0);
    rect(870, 570, 110, 42);
    rect(320, 570, 100, 45);
    rect(220, 570, 100, 45);
    x=x2;
    y=y2;
  }

  if (enemylife==1 && correct&&playerlife==3) {
    threaten="Mercy, please, you are too smart!";
    fill(250, 0, 0);
    rect(870, 570, 110, 42);
    rect(770, 570, 100, 42);
    x=x3;
    y=y3;
  }

  if (enemylife==1 && correct && playerlife==2) {
    threaten="I have a chance of defeating you!!";
    fill(250, 0, 0);
    rect(870, 570, 110, 42);
    rect(770, 570, 100, 42);
    rect(320, 570, 100, 45);
    x=x3;
    y=y3;
  }
  rect(770, 570, 100, 42);
  if (enemylife==1 && correct && playerlife==1) {
    threaten="The tides will turn in my favor!!";
    fill(250, 0, 0);
    rect(870, 570, 110, 42);
    rect(770, 570, 100, 42);
    rect(320, 570, 100, 45);
    rect(220, 570, 100, 45);
    x=x3;
    y=y3;
  }

  if (enemylife==0 && correct) {
    whichPage=4;
  }

  if (playerlife==2 && !correct &&enemylife==3) {
    threaten="Haha, you will never succeed!!";
    fill(250, 0, 0);
    rect(320, 570, 100, 45);
    x=xR;
    y=yR;
  }

  if (playerlife==2 && !correct && enemylife==2) {
    threaten="I refuse to lose, harder math for you!";
    fill(250, 0, 0);
    rect(320, 570, 100, 45);
    rect(870, 570, 110, 42);
    fill(0, 250, 0);
    x=xR;
    y=yR;
  }

  if (playerlife==2 && !correct && enemylife==1) {
    threaten="NO, I REFUSE TO BE KILLED.";
    fill(250, 0, 0);
    rect(320, 570, 100, 45);
    rect(770, 570, 100, 42);
    rect(870, 570, 110, 42);
    x=xR;
    y=yR;
  }

  if (playerlife==1 && !correct &&enemylife==3) {
    threaten="Look who's in power now!!";
    fill(250, 0, 0);
    rect(320, 570, 100, 45);
    rect(220, 570, 100, 45);
    x=x3R;
    y=y3R;
  }

  if (playerlife==1 && !correct &&enemylife==2) {
    threaten="Victory shall be mine!!";
    fill(250, 0, 0);
    rect(870, 570, 110, 42);
    rect(320, 570, 100, 45);
    rect(220, 570, 100, 45);
    x=x3R;
    y=y3R;
  }

  if (playerlife==1 && !correct&& enemylife==1) {
    threaten="This will be a close battle!!";
    fill(250, 0, 0);
    rect(870, 570, 110, 42);
    rect(770, 570, 100, 42);
    rect(320, 570, 100, 45);
    rect(220, 570, 100, 45);
    x=x3R;
    y=y3R;
  }
  if (playerlife==0 && !correct) {
    whichPage=3;
  }
}

void levelOneCorrectCheck() {
  if (t.getValue().equals(xy)||t.getValue().equals(xy2)||t.getValue().equals(xyR)||t.getValue().equals(xy3)||t.getValue().equals(xy3R))
  {
    enemylife--;
    correct=true;
  } else
  {
    playerlife--;
    correct=false;
  }
}

void levelTwoCorrectCheck() {
  if (t.getValue().equals(xyB)||t.getValue().equals(xy2B)||t.getValue().equals(xyRB)||t.getValue().equals(xy3B)||t.getValue().equals(xy3RB))
  {
    enemylife--;
    correct=true;
  } else
  {
    playerlife--;
    correct=false;
  }
}


void losePage() {
  background(losepage);
}

void winPage() {
  background(winpage);
}


void pauseScreen() {
  background(menupage);
}




void mousePressed()
{
  if (whichPage==0)
  {
    if (mouseX>0 && mouseX<300 && mouseY>0 && mouseY<100) {

      exit();
    }

    if (mouseX>700 && mouseX<1024 && mouseY>0 && mouseY<100) {

      whichPage=7;
    }

    if (mouseX>459.5 && mouseX<564.5 && mouseY>574 && mouseY<626)
    {
      whichPage=1;
    }
  }

  if (whichPage==2)
  {
    if (mouseX>700 && mouseX<1024 && mouseY>0 && mouseY<100) {

      whichPage=8;
    }
  }


  if (whichPage==3)
  {
    if (mouseX>350 && mouseX<700 && mouseY>200 && mouseY<600) {

      whichPage=0;
    }
  }

  if (whichPage==6)
  {
    if (mouseX>350 && mouseX<700 && mouseY>200 && mouseY<600) {

      whichPage=0;
      pauser=0;
      whichPage=0;
      spotX=120;
      spotY=375;
      spotX2=120;
      spotY2=375;
      spotX3=20;
      spotY3=325;
      life1=5;
      x=(int)random(80, 90);
      y=(int)random(60, 70);
      xR=(int)random(80, 90);
      yR=(int)random(60, 70);
      x2=(int)random(80, 100);
      y2=(int)random(50, 70);
      x3=(int)random(200, 300);
      y3=(int)random(40, 190);
      x3R=(int)random(200, 300);
      y3R=(int)random(40, 190);
      xy=Integer.toString(x-y);
      xyR=Integer.toString(xR-yR);
      xy2=Integer.toString(x2-y2);
      xy3=Integer.toString(x3-y3);
      xy3R=Integer.toString(x3R-y3R);
      enemylife=3;
      playerlife=3;
      threaten="Solve the following math operations to pass me:";
      correct=true;
    }
  }


  if (whichPage==7) {

    if (mouseX>60 && mouseX<235 && mouseY>225 && mouseY<280) {

      whichPage=0;
    }

    if (mouseX>350 && mouseX<700 && mouseY>200 && mouseY<300) {

      whichPage=0;
    }

    if (mouseX>760 && mouseX<1000 && mouseY>200 && mouseY<300) {

      pauser++;
      if (pauser%2==1) {
        menusong.pause();

        //ADD ALL SONGS IN GAME TO HERE AND TAKE OUT OF COMMENT MODE WHEN YOU USE THEM
        fightmusic1.pause();
        notfightmusic.pause();
      } else if (whichPage-10==0 && pauser%2==0) { //SPECIFIC TO EACH PAGE

        menusong.play();
      }
    }
  }
  
    if (whichPage==8) {

    if (mouseX>60 && mouseX<235 && mouseY>225 && mouseY<280) {

      whichPage=0;
    }

    if (mouseX>350 && mouseX<700 && mouseY>200 && mouseY<300) {

      whichPage=2;
    }

    if (mouseX>760 && mouseX<1000 && mouseY>200 && mouseY<300) {

      pauser++;
      if (pauser%2==1) {
        menusong.pause();

        //ADD ALL SONGS IN GAME TO HERE AND TAKE OUT OF COMMENT MODE WHEN YOU USE THEM
        fightmusic1.pause();
        notfightmusic.pause();
      } else if (whichPage-10==0 && pauser%2==0) { //SPECIFIC TO EACH PAGE

        menusong.play();
      }
    }
  }
}


void keyPressed() {
  if (whichPage==1) {
    if (key == CODED) {
      if (keyCode == RIGHT) {
        spotX+=10;
      } else if (keyCode == LEFT) {
        spotX-=10;
      }
    }
  } else if (whichPage==2) {
    if (key == CODED) {
      if (keyCode == SHIFT) {
        levelOneCorrectCheck();
      }
    }
  }
   if (whichPage==5) {
    if (key == CODED) {
      if (keyCode == SHIFT) {
        levelTwoCorrectCheck();
      }
    }
  }
  
    if (whichPage==4) {
    if (key == CODED) {
      if (keyCode == RIGHT) {
        spotX2+=10;
      } else if (keyCode == LEFT) {
        spotX2-=10;
      }
    }
  }
}

void actionPerformed(GUIEvent e) {
  if (e.getMessage().equals("Completed")) {
    l.setLabel(t.getValue());
  }
}

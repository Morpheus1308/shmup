class Level extends ScreenObject {

  //PImage background;
  BackgroundScreen background;

  float scroll;

  PImage minion;
  PImage boss;

  Ship player1; 
  Ship finalBoss;
  boolean levelComplete;
  ArrayList<GameObject> shipObjects;
  ArrayList<GameObject> gameObjects;

  Level() {
  }
  
  Level(Ship refPlayer1, ArrayList<GameObject> refShipObjects, ArrayList<GameObject> refGameObjects){
    background = new BackgroundScreen();
    //background = loadImage("level1.bmp");

    player1 = refPlayer1;
    levelComplete = false;
    shipObjects = refShipObjects;
    gameObjects = refGameObjects;
    minion = loadImage("Minion.png");
    boss = loadImage("BossLv.png");
  }

  void update(float dt) {
    scroll++;
    
    
    for(int i = 0;i <= 30;i++){
      
    }
    if (scroll == 600){
      Ship bar = new BasicEnemy(new BasicEnemyController(player1.getPos()), width-101, 0, minion); //new Ship(new BasicEnemyController(player1.getPos()), 0, 0);
      Ship foo = new BasicEnemy(new BasicEnemyController(player1.getPos()), width-101, 0, minion);
      shipObjects.add(bar);
      shipObjects.add(foo);
    }

    if (scroll == 1200){
      finalBoss = new BasicEnemy(new BasicEnemyController(player1.getPos()), width/2, 0, boss );


      //finalBoss = new MakeBig(finalBoss);
      shipObjects.add(finalBoss);
    }

    //win level condition
    if (finalBoss != null && finalBoss.remove) {
      levelComplete = true;
      
    }
    
    background.update(dt, 1);
  }

  void render() {
    //image(background, background.width/2, scroll); //For alle andre...
    //image(background, background.width*1.5, scroll);
    //image(background, background.width*2.5, scroll);
    //image(background, background.width/2, scroll);
    background.render(random(255));
  }

  Level nextLevel(Ship refPlayer1, ArrayList<GameObject> refShipObjects, ArrayList<GameObject> refGameObjects) {
   

    refPlayer1.pos.x = width/2;
    refPlayer1.pos.y = height-100;

    //bug when changing level... can you figure out why? ;)
    //refPlayer1.pos = new PVector(width/2, height-100);
    return new Level2(refPlayer1, refShipObjects, refGameObjects);
  }
}


class Level2 extends Level{
  
  Level2(Ship refPlayer1, ArrayList<GameObject> refShipObjects, ArrayList<GameObject> refGameObjects){
    //background = loadImage("level2.bmp");
    background = new BackgroundScreen();


    player1 = refPlayer1;
    shipObjects = refShipObjects;
    gameObjects = refGameObjects;
    
    minion = loadImage("Minion.png");
  }

  void update(float dt){
    scroll++;
    background.update(dt, 2);
    if (scroll == 100){
      PowerUp foo = new FullHP(new PVector(width/2, 1), 5);
      gameObjects.add(foo);
    }
    if (scroll == 600){
      Ship bar = new BasicEnemy(new BasicEnemyController(player1.getPos()), 0, 0, minion);
      Ship foo = new BasicEnemy(new BasicEnemyController(player1.getPos()), width, 0, minion);
      shipObjects.add(bar);
      shipObjects.add(foo);
      
      Ship baar = new BasicEnemy(new BasicEnemyController(player1.getPos()), width/2, 0, minion);
      Ship fooo = new BasicEnemy(new BasicEnemyController(player1.getPos()), width/2, -100, minion);
      shipObjects.add(baar);
      shipObjects.add(fooo);
    }
    if (scroll == 1200){
      Ship bar = new BasicEnemy(new BasicEnemyController(player1.getPos()), width/2, 0, minion);

      bar = new MakeBig(bar);
      bar = new MakeBig(bar);
      shipObjects.add(bar);
      
      background.update(dt,2000+scroll);
    }   
  }
}
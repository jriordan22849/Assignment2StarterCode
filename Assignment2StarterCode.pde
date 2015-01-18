/* this is a test
    DIT OOP Assignment 2 Starter Code
    =================================
    
    Loads player properties from an xml file
    See: https://github.com/skooter500/DT228-OOP 
*/

ArrayList<Player> players = new ArrayList<Player>();
boolean[] keys = new boolean[526];
boolean[] alive = new boolean[6];
boolean start_screen = true;

void setup()
{
  size(500, 500);
  setUpPlayerControllers();
  fleet = new Fleet(80, 30, 0, 6);
}

void draw()
{
  if(start_screen == false)
  {
    background(0);
  
    for(Player player:players)
    {
      player.update();
      player.display();
    }
    fleet.display();
    fleet.move();

  }
  else if(start_screen == true)
  {
    main_menu.display();
    main_menu.keyPressed();
  }
  
}

void keyPressed()
{
  keys[keyCode] = true;
}

void keyReleased()
{
  keys[keyCode] = false;
}

boolean checkKey(char theKey)
{
  return keys[Character.toUpperCase(theKey)];
}

char buttonNameToKey(XML xml, String buttonName)
{
  String value =  xml.getChild(buttonName).getContent();
  if ("LEFT".equalsIgnoreCase(value))
  {
    return LEFT;
  }
  if ("RIGHT".equalsIgnoreCase(value))
  {
    return RIGHT;
  }
  if ("UP".equalsIgnoreCase(value))
  {
    return UP;
  }
  if ("DOWN".equalsIgnoreCase(value))
  {
    return DOWN;
  }
  //.. Others to follow
  return value.charAt(0);  
}

void setUpPlayerControllers()
{
  XML xml = loadXML("arcade.xml");
  XML[] children = xml.getChildren("player");
  int gap = width / (children.length + 1);
  
  for(int i = 0 ; i < children.length ; i ++)  
  {
    XML playerXML = children[i];
    Player p = new Player(i, color(255), playerXML);
    int x = (i + 1) * gap;
    // x = 250 at begining so is y
    p.pos.x = x;
    p.pos.y = 450;
    players.add(p);         
  }
}

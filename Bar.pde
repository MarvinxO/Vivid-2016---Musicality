class Bar {
  float x; //moving X value
  float y; //moving Y value
  float innerX; //Starting x value
  float innerY; //Starting y value
  float targetX; //Ending x value
  float targetY; //Ending y value
  float iniX; //initial X value
  float iniY; //initial Y value
  float easing = 0.2; //easing speed
  boolean reset = true; //Reset the object's behaviour
  boolean activate = false; //Activate the object's behaviour
  
  Bar (float _x, float _y, float _targetX, float _targetY) {
    x = _x;
    y = _y;
    targetX = _targetX;
    targetY = _targetY;
    iniX = _x;
    iniY = _y;
  }
  
  void display() {
    
    //Ease the Inner point to the moving point
    //else - reset the values to allow it to activate again
    if (dist(innerX, innerY, x, y) > 1.0) {
      innerX += (x - innerX) * easing;
      innerY += (y - innerY) * easing;
    } else {
      x = iniX;
      y = iniY;
      innerX = x;
      innerY = y;
      reset = true;
    }
    
    //Ease the moving point to the Ending point
    //Inner points remain stationary until moving point is less than the distance
    //Sets the 'reset' to false to complete its animation
    if (activate) {
        if (dist(x, y, targetX, targetY) > 1.0) {
          x += (targetX - x) * easing;
          y += (targetY - y) * easing;
        } else {
          activate = false;
        }
      innerX = iniX;
      innerY = iniY; 
      reset = false;
    }
    
    line(innerX, innerY, x , y);
  }
  
  //depending on the audio levels, run the bar
  void level(float level) {
    if (reset) {
      if (level >= 0.6) {
        activate = true;
      }
    }
  }
  
}

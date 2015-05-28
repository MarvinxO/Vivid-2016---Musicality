class Bar {
  float x; //moving X value
  float y; //moving Y value
  float innerX;
  float innerY;
  float targetX;
  float targetY;
  float iniX; //return X value
  float iniY; //return Y value
  float easing = 0.2;
  boolean reset = true;
  boolean activate = false;
  
  Bar (float _x, float _y, float _targetX, float _targetY) {
    x = _x;
    y = _y;
    targetX = _targetX;
    targetY = _targetY;
    iniX = _x;
    iniY = _y;
  }
  
  void display() {
    
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
    
    //Ease the line out to the max value
    //will stop when 
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
  
  //depending on the audio levels, display the Bar
  void level(float level) {
    
    if (reset) {
      if (level >= 0.6) {
        activate = true;
      }
    }
  }
  
}

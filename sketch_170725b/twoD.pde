void hiLightPoint(int x, int y, int[] fauxrigin){
  noFill();
  stroke(204, 102, 0, 255/2);
  strokeWeight(1);
  ellipse(x * scale + fauxrigin[0] , -y * scale + fauxrigin[1], 10, 10);
}

void scanConvert(int x1, int y1, int x2, int y2, int[] fauxrigin){
  //detect octant
  int octant = 0, temp;

  if((x2 - x1) >= 0){
    if((y2 - y1) >= 0){
      if(abs(x2 - x1) >= abs(y2 - y1)){
        octant = 1;
      } else{
        octant = 2;
        
        temp = x1;
        x1 = y1;
        y1 = temp;
        
        temp = x2;
        x2 = y2;
        y2 = temp;
      }
    } else {
      if(abs(x2 - x1) >= abs(y2 - y1)){
        octant = 8;
        
        y1 = -y1;
        y2 = -y2
      } else{
        octant = 7;
        
        temp = x1;
        x1 = y1;
        y1 = temp;
        
        temp = x2;
        x2 = y2;
        y2 = temp;
        
        y1 = -y1;
        y2 = -y2;
      }
    }
  } else {
    if((y2 - y1) >= 0){
      if(abs(x2 - x1) >= abs(y2 - y1)){
        octant = 4;
    
        x1 = -x1;
        x2 = -x2;
        
      } else{

        
        octant = 3;
    
        temp = x1;
        x1 = y1;
        y1 = temp;
        
        temp = x2;
        x2 = y2;
        y2 = temp;
        
        y1 = -y1;
        y2 = -y2;
      }
    } else {
      if(abs(x2 - x1) >= abs(y2 - y1)){
        octant = 5;
        
        x1 = -x1;
        x2 = -x2;
        y1 = -y1;
        y2 = -y2;
      } else{
        octant = 6;
        
        temp = x1;
        x1 = y1;
        y1 = temp;
        
        temp = x2;
        x2 = y2;
        y2 = temp;
        
        x1 = -x1;
        x2 = -x2;
        y1 = -y1;
        y2 = -y2;
      }
    }
  }


  
  println(octant, x1, y1, x2, y2);
  
  //set up the bounding rectangle
  int choice = 0;
  int x_delta = x2 - x1;
  int y_delta = y2 - y1;
  int current_x = x1;
  int current_y = y1;
  
  if (octant == 2){
    hiLightPoint(current_y, current_x, fauxrigin);
  } else if (octant == 1){
    hiLightPoint(current_x, current_y, fauxrigin);
  } else if (octant == 4) {
    hiLightPoint(-current_x, current_y, fauxrigin);
  } else if (octant == 3) {
    hiLightPoint(-current_y, current_x, fauxrigin);
  } else if (octant == 5) {
    hiLightPoint(-current_x, -current_y, fauxrigin);
  } else if (octant == 6) {
    hiLightPoint(-current_y, -current_x, fauxrigin);
  } else if (octant == 7){
    hiLightPoint(current_y, -current_x, fauxrigin);
  }
  
  int d = 2 * y_delta - x_delta;
  if(d <= 0){
    choice = 0;
  }
  if (d > 0){
    choice = 1;
  }
  current_x++;
  current_y = current_y + choice;
  
  if (octant == 2){
    hiLightPoint(current_y, current_x, fauxrigin);
  } else if (octant == 1){
    hiLightPoint(current_x, current_y, fauxrigin);
  } else if (octant == 4) {
    hiLightPoint(-current_x, current_y, fauxrigin);
  } else if (octant == 3) {
    hiLightPoint(-current_y, current_x, fauxrigin);
  } else if (octant == 5) {
    hiLightPoint(-current_x, -current_y, fauxrigin);
  } else if (octant == 6) {
    hiLightPoint(-current_y, -current_x, fauxrigin);
  }
  
  
  for(int i = 1; i < x_delta; i++){
    if(choice == 0){
      d = d + y_delta * 2;
    }
    
    if(choice == 1){
      d = d + (y_delta - x_delta) * 2;
    }
    
    if(d <= 0){
      choice = 0;
    }
    if (d > 0){
      choice = 1;
    }
    
    current_x++;
    current_y = current_y + choice;
    
    if (octant == 2){
      hiLightPoint(current_y, current_x, fauxrigin);
    } else if (octant == 1){
      hiLightPoint(current_x, current_y, fauxrigin);
    } else if (octant == 4) {
      hiLightPoint(-current_x, current_y, fauxrigin);
    } else if (octant == 3) {
      hiLightPoint(-current_y, current_x, fauxrigin);
    } else if (octant == 5) {
      hiLightPoint(-current_x, -current_y, fauxrigin);
    } else if (octant == 6) {
      hiLightPoint(-current_y, -current_x, fauxrigin);
    }
  }
}

void scanConvertCirc(int x, int y, int x_dia, int y_dia, int[] fauxrigin){
  //set up the bounding rectangle
  int choice = 0;
  int r = x_dia / 2;
  int delta_x = x;
  int delta_y = y;
  int current_x = 0;
  int current_y = r;
  int deltaE = 3;
  int deltaSE = -2 * r + 5;
  hiLightPoint(current_x + delta_x, current_y + delta_y, fauxrigin);
  int d = 5/4 - r;
  
  if(d < 0){
    choice = 0;
  }
  if (d >= 0){
    choice = 1;
  }
 
  
  current_x++;
  current_y = current_y - choice;
  
  hiLightPoint(current_x + delta_x, current_y + delta_y, fauxrigin);
  
  while(current_y > current_x){
    if(choice == 0){
      d += deltaE;
      deltaE += 2;
      deltaSE += 2;
    }
    
    if(choice == 1){
      d += deltaSE;
      deltaE += 2;
      deltaSE += 4;
    }
    if(d < 0){
      choice = 0;
    }
    if (d >= 0){
      choice = 1;
    }
    
    current_x++;
    current_y = current_y - choice;
    
    hiLightPoint(current_x + delta_x, current_y + delta_y, fauxrigin);
  }
}

void scanConvertEllipse(int x, int y, int a_2, int b_2, int[] fauxrigin){
  //set up the bounding rectangle
  int a = a_2 / 2;
  int b = b_2 / 2;
  int choice = 0;
  int delta_x = x;
  int delta_y = y;
  int current_x = 0;
  int current_y = b;
  int prev_x;
  int prev_y;
  hiLightPoint(current_x + delta_x, current_y + delta_y, fauxrigin);
  double d = b * b + a * a * (-b + 0.25);
  if(d < 0){
    choice = 0;
  }
  if (d >= 0){
    choice = 1;
  }
 
  prev_x = current_x;
  prev_y = current_y;
  current_x++;
  current_y = current_y - choice;
  
  hiLightPoint(current_x + delta_x, current_y + delta_y, fauxrigin);
  
  while((a * a) * (current_y - 1/2) > b * b * (current_x + 1)){
    if(choice == 0){
      d = d + b * b * (2 * prev_x + 3);
    }
    
    if(choice == 1){
      d = d + b * b * (2 * prev_x + 3) + a * a * (-2 * prev_y + 2);
    }
    
    if(d < 0){
      choice = 0;
    }
    if (d >= 0){
      choice = 1;
    }
    
    prev_x = current_x;
    prev_y = current_y;
    current_x++;
    current_y = current_y - choice;
    
    hiLightPoint(current_x + delta_x, current_y + delta_y, fauxrigin);
  }
  
  double d2 = pow(b, 2) * pow((current_x + 0.5), 2) + pow(a, 2) * pow((current_y - 1), 2) - pow(a, 2) * pow(b, 2);
  
  
  if(d2 < 0){
    choice = 1;
  }
  if (d2 >= 0){
    choice = 0;
  }
 
  prev_x = current_x;
  prev_y = current_y;
  current_x += choice;
  current_y--;
  
  hiLightPoint(current_x + delta_x, current_y + delta_y, fauxrigin);
  
  while(current_y > 0){
    if(choice == 0){
      d2 = d2 + pow(a, 2) * (-2 * prev_y + 3);
    }
    
    if(choice == 1){
      d2 = d2 + pow(b, 2) * (2 * prev_x + 2) + pow(a, 2) * (-2 * prev_y + 3);
    }
    
    if(d2 < 0){
      choice = 1;
    }
    if (d2 >= 0){
      choice = 0;
    }
    
    prev_x = current_x;
    prev_y = current_y;
    current_x += choice;
    current_y--;
    
    hiLightPoint(current_x + delta_x, current_y + delta_y, fauxrigin);
  }
}




void cartLine(int x1, int y1, int x2, int y2, int[] fauxrigin){
  int delta_y = y2 - y1;
  x1 = x1 * scale + fauxrigin[0];
  y1 = -y1 * scale + fauxrigin[1];
  x2 = x2 * scale + fauxrigin[0];
  y2 = -y2 * scale + fauxrigin[1] ;
  strokeWeight(3);
  stroke(0);
  line(x1, y1, x2, y2);
}

void cartEllipse(int x1, int y1, int x2, int y2, int[] fauxrigin){
  x1 = x1 * scale + fauxrigin[0];
  y1 = -y1 * scale + fauxrigin[1];
  x2 = x2 * scale;
  y2 = y2 * scale;
  
  noFill();
  ellipse(x1, y1, x2, y2);
  
}


void cartRect(int x1, int y1, int x2, int y2, int[] fauxrigin){
  noFill();
  strokeWeight(3);
  y1 = -y1;
  x1 = x1 * scale + fauxrigin[0];
  y1 = y1 * scale + fauxrigin[1];
  x2 = x2 * scale;
  y2 = -y2 * scale;
  println(x1, y1, x2, y2);
  rect(x1, y1, x2, y2);
}

void cartPoly(int[] poly, int[] fauxrigin){
  noFill();
  strokeWeight(3);
  beginShape();
    for(int i = 0; i < poly.length; i += 2){
      vertex((poly[i] * scale + fauxrigin[0]), (-poly[i + 1] * scale + fauxrigin[1]));
    }
  endShape(CLOSE);
}
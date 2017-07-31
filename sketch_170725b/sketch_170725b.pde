int scale = 20;

void hiLightPoint(int x, int y, int[] fauxrigin){
  noFill();
  stroke(204, 102, 0);
  ellipse(x * scale + fauxrigin[0] , -y * scale + fauxrigin[1], 10, 10);
}

void scanConvert(int x1, int y1, int x2, int y2, int[] fauxrigin){
  //set up the bounding rectangle
  int choice = 0;
  int x_delta = x2 - x1;
  int y_delta = y2 - y1;
  int current_x = x1;
  int current_y = y1;
  hiLightPoint(current_x, current_y, fauxrigin);
  int d = 2 * y_delta - x_delta;
  if(d <= 0){
    choice = 0;
  }
  if (d > 0){
    choice = 1;
  }
  current_x++;
  current_y = current_y + choice;
  hiLightPoint(current_x, current_y, fauxrigin);
  
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
    
    hiLightPoint(current_x, current_y, fauxrigin);
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
  y1 = y1 * scale + fauxrigin[1];
  x2 = x2 * scale + fauxrigin[0];
  y2 = (y2 - 2 * delta_y) * scale + fauxrigin[1] ; //<>//
  
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

void setup(){
  noSmooth();
  size(800, 800);
  
  for(int i = 0; i <= width / scale; i++){
    line(0, i * scale, width, i * scale);
    line(i * scale, 0, i * scale, height );
  }
  
  int faux_x = width / 2;
  int faux_y = width / 2;
  
  fill(0);
  ellipse(faux_x, faux_y, 7, 7); //the origin dot
  
  int[] fauxrigin = {faux_x, faux_y};
  
  //cartLine(0, 0, 15, 6, fauxrigin);
  //scanConvert(0, 0, 15, 6, fauxrigin);
    
  //cartEllipse(0, 0, 40, 40, fauxrigin);
  //scanConvertCirc(0, 0, 40, 40, fauxrigin);
  
  
  cartEllipse(0, 0, 30, 30, fauxrigin);
  scanConvertEllipse(0, 0, 30, 30, fauxrigin);

  

}
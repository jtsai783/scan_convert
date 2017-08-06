int scale = 20;
 //<>//
void setup(){
  noSmooth();
  size(800, 800);
  
  for(int i = 0; i <= width / scale; i++){
    line(0, i * scale, width, i * scale);
    line(i * scale, 0, i * scale, height );
  }
  
  int faux_x = 80;
  int faux_y = height - 80;
  
  fill(0);
  ellipse(faux_x, faux_y, 7, 7); //the origin dot
  
  int[] fauxrigin = {faux_x, faux_y};
  
  //cartLine(2, 0, 10, 0, fauxrigin);
  //scanConvert(2, 0, 10, 0, fauxrigin);
  
  //cartLine(2, 2, 10, 3, fauxrigin);
  //scanConvert(2, 2, 10, 3, fauxrigin);
  
  //cartLine(2, 2, 10, 10, fauxrigin);
  //scanConvert(2, 2, 10, 10, fauxrigin);
  
  //cartLine(2, 2, 3, 10, fauxrigin);
  //scanConvert(2, 2, 3, 10, fauxrigin);
  
  //cartLine(0, 2, 0, 10, fauxrigin);
  //scanConvert(0, 2, 0, 10, fauxrigin);
  
  //cartLine(-2, 2, -3, 10, fauxrigin);
  //scanConvert(-2, 2, -3, 10, fauxrigin);
  
  //cartLine(-2, 2, -10, 10, fauxrigin);
  //scanConvert(-2, 2, -10, 10, fauxrigin);
  
  //cartLine(-2, 2, -10, 3, fauxrigin);
  //scanConvert(-2, 2, -10, 3, fauxrigin);
  
  //cartLine(-2,0 , -10, 0, fauxrigin);
  //scanConvert(-2, 0, -10, 0, fauxrigin);
  
  //cartLine(-2, -2, -10, -3, fauxrigin);
  //scanConvert(-2, -2, -10, -3, fauxrigin);
  
  //cartLine(-2, -2, -10, -10, fauxrigin);
  //scanConvert(-2, -2, -10, -10, fauxrigin);
  
  //cartLine(-2, -2, -3, -10, fauxrigin);
  //scanConvert(-2, -2, -3, -10, fauxrigin);
  
  //cartLine(0, -2, 0, -10, fauxrigin);
  //scanConvert(0, -2, 0, -10, fauxrigin);
  
  //cartLine(2, -2, 3, -10, fauxrigin);
  //scanConvert(2, -2, 3, -10, fauxrigin);
  
  //cartLine(2, -2, 10, -10, fauxrigin);
  //scanConvert(2, -2, 10, -10, fauxrigin);
  
  //cartLine(2, -2, 10, -3, fauxrigin);
  //scanConvert(2, -2, 10, -3, fauxrigin);
 
    
  //cartEllipse(0, 0, 40, 40, fauxrigin);
  //scanConvertCirc(0, 0, 40, 40, fauxrigin);
  
  //cartEllipse(0, 0, 20, 30, fauxrigin);
  //scanConvertEllipse(0, 0, 20, 30, fauxrigin);

  //cartRect(2, 2, 7, 7, fauxrigin);
  //rectFill(2, 2, 7, 7, fauxrigin);
  
  int poly[] = new int[22];
  poly[0] = 2;
  poly[1] = 3;
  poly[2] = 7;
  poly[3] = 1;
  poly[4] = 13;
  poly[5] = 5;
  poly[6] = 23;
  poly[7] = 3;
  poly[8] = 28;
  poly[9] = 17;
  poly[10] = 21;
  poly[11] = 28;
  poly[12] = 12;
  poly[13] = 21;
  poly[14] = 16;
  poly[15] = 16;
  poly[16] = 13;
  poly[17] = 11;
  poly[18] = 7;
  poly[19] = 7;
  poly[20] = 2;
  poly[21] = 9;
  
  cartPoly(poly, fauxrigin);
  polyFill(poly, fauxrigin);
}
int scale = 20;
 //<>//
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
  
  int poly[] = new int[12];
  poly[0] = 2;
  poly[1] = 3;
  poly[2] = 7;
  poly[3] = 1;
  poly[4] = 13;
  poly[5] = 5;
  poly[6] = 13;
  poly[7] = 11;
  poly[8] = 7;
  poly[9] = 7;
  poly[10] = 2;
  poly[11] = 9;
  
  
  cartPoly(poly, fauxrigin);
  polyFill(poly, fauxrigin);
}
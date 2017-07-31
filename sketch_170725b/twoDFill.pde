void rectFill(int x1, int y1, int x2, int y2, int[] fauxrigin){
  for(int i = x1; i < x1 + x2; i++){
    for(int j = y1; j < y1 + y2; j++){
      hiLightPoint(i, j, fauxrigin);
    }
  }
}

void polyFill(int[] poly, int[] fauxrigin){
    for(int i = 0; i < poly.length - 2; i += 2){
      println(poly[i], poly[i+1], poly[i+2], poly[i+3]);
      scanConvert(poly[i], poly[i + 1], poly[i + 2], poly[i + 3], fauxrigin);
    }
}
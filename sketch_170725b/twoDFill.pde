import java.util.Map;
import java.util.Collections;

void rectFill(int x1, int y1, int x2, int y2, int[] fauxrigin){
  for(int i = x1; i < x1 + x2; i++){
    for(int j = y1; j < y1 + y2; j++){
      hiLightPoint(i, j, fauxrigin);
    }
  }
}

class Point{
  int x, y;
  Point(int a, int b){
    x = a;
    y = b;
  }
}

class Edge implements Comparable<Edge> {
  Point start, end;
  int x_min, y_min;
  int dx, dy, sum, current_x, sign = 1;
  Edge(Point point_1, Point point_2){
    start = point_1;
    end = point_2;
    sum = 0;
    dx = end.x - start.x;
    dy = end.y - start.y;
    if(dx < 0){
      sign = sign * -1;
    }
    
    if(dy < 0){
      sign = sign * -1;
    }
  }
  
  int compareTo(Edge e){
    int result = 0;
    if(current_x > e.current_x){
      result = 1;
    } else if(current_x == e.current_x){
      result = 0;
    } else if(current_x < e.current_x){
      result = -1;
    }
    return result;
  }
}

void polyFill(int[] poly, int[] fauxrigin){
//build the ET
//first, determine how many scanlines this will take up
//loop through all of them, find the max and min of y
  int scan_lines;
  int y_max = poly[1];
  int y_min = poly[1];
  for(int i = 0; i < poly.length; i += 2){
    if(poly[i + 1] > y_max){
      y_max = poly[i + 1];
    }
    
    if(poly[i + 1] < y_min){
      y_min = poly[i + 1];
    }
  }
  scan_lines = y_max - y_min + 1;

//construct edges
int num_edges = poly.length / 2;
Edge[] edges = new Edge[num_edges];


for(int i = 0; i < poly.length - 2; i += 2){
  Point start_p = new Point(poly[i], poly[i + 1]);
  Point end_p = new Point(poly[i + 2], poly[i + 3]);
  Edge temp_edge = new Edge(start_p, end_p);
  edges[i/2] = temp_edge;
}
Point start_p = new Point(poly[poly.length - 2], poly[poly.length - 1]);
Point end_p = new Point(poly[0], poly[1]);
Edge temp_edge = new Edge(start_p, end_p);
edges[edges.length - 1] = temp_edge;

//construct ET

ArrayList<ArrayList<Edge>> edge_table = new ArrayList<ArrayList<Edge>>(scan_lines);

//init edge_table
for(int i = 0; i < scan_lines; i++){
  edge_table.add(new ArrayList<Edge>());
}


for(int i = 0; i < edges.length; i++){
  Edge edge = edges[i];
  //check for the y_min
  y_min = edge.start.y;
  int x_min = edge.start.x;
  if(edge.end.y < y_min){
    y_min = edge.end.y;
    x_min = edge.end.x;
  }
  
  edge.x_min = x_min;
  edge.y_min = y_min;
  edge.current_x = x_min;
  edge_table.get(edge.y_min - 1).add(edge);
  Collections.sort(edge_table.get(edge.y_min - 1));
}

//init AET
ArrayList<Edge> AET = new ArrayList<Edge>();

int edge_processed = 0;
int edge_processing = 0;
int current_scan_line = 0;

while(edge_processed < edges.length){
  ArrayList<Edge> scan_line_edges = edge_table.get(current_scan_line);
  //entering edges
  if(scan_line_edges.size() != 0){
    edge_processing += scan_line_edges.size();
    for(int i = 0; i < scan_line_edges.size(); i++){
      Edge temp_e = scan_line_edges.get(i);
      temp_e.current_x = temp_e.x_min;
      AET.add(scan_line_edges.get(i));
    }
  }
  
  Collections.sort(AET);
  
  //draw pixels
  for(int i = 0; i < AET.size(); i += 2){
    Edge start = AET.get(i);
    Edge end = AET.get(i+1);
    hiLightPoint(start.current_x, current_scan_line, fauxrigin, color(255,255,0));
    for(int j = start.current_x; j < end.current_x; j++){
      hiLightPoint(j, current_scan_line, fauxrigin, color(255,255,0));
    }
  }
  
  //update the x value
  for(int i = 0; i < AET.size(); i++){
    Edge e = AET.get(i);
    e.sum += abs(e.dx);
    while(e.sum > abs(e.dy)){ //<>//
      e.sum -= abs(e.dy);
      e.current_x += 1 * e.sign;
    }
  }
  Collections.sort(AET);
  
  current_scan_line += 1;
  int i = 0;
  while(i != AET.size()-1){
    if(AET.get(i).end.y == current_scan_line){
      AET.remove(i);
    } else {
      i++;
    }
    
  }
}


  
}
int size = 10;
int sq_size = 500;
int r = 300;
float weight = 0.5;
float pi = 3.14159265;
float angle_off = radians(10);
int l = 20;

float maxWeight = 20;

int show_tri = 0;

int nNodes = 30;
void setup() {
  int[] a = {};
  int j = 0;
  while (j < nNodes*nNodes){
    int r = round(random(0,maxWeight));
    a = append(a, r);
    j++;
  }
  size(1400,800);
  background(0);
  
  translate(0.7*width,height/2);
  
  int s_x = -900;
  int s_y = -(sq_size/2);
  
  //rect(s_x,s_y,sq_size,sq_size);
  for (int i=0;i<nNodes;i++){
    float x = r*cos(2*pi*i/nNodes);
    float y = r*sin(2*pi*i/nNodes);
    fill(0,200+50*sin(2*pi*i/nNodes),200+50*cos(2*pi*i/nNodes));
    ellipse(x,y,size,size);
     
    textSize(20);
    text(str(i),(r+50)*cos(2*pi*i/nNodes),(r+50)*sin(2*pi*i/nNodes));
  }
  
  int i = 0;
  while (i < nNodes*nNodes){
    int col = i % nNodes;
    int row = (i - col)/nNodes;
    float g_x = s_x + col*(sq_size)/nNodes - a[i]/(maxWeight*2);
    float g_y = s_y + row*(sq_size)/nNodes - a[i]/(maxWeight*2);
      
    //calculate the row and column
    //col:
    
    float x1 = r*cos(2*pi*row/nNodes);
    float y1 = r*sin(2*pi*row/nNodes);
    float x2 = r*cos(2*pi*col/nNodes);
    float y2 = r*sin(2*pi*col/nNodes);
    
    //goes from row->col therefore its P1->P2
    
    //fill(0,200+50*sin(2*pi*i/nNodes),200+50*cos(2*pi*i/nNodes));
    stroke(0,200+50*sin(2*pi*i/nNodes),200+50*cos(2*pi*i/nNodes));
    //fill(0,200+50*sin(2*pi*i/nNodes),200+50*cos(2*pi*i/nNodes));
    fill(0,200+50*sin(a[i]/maxWeight),200+50*cos(a[i]/maxWeight));
    //triangle(x2,y2,x2-10*cos(2*pi*i/nNodes),y2-10*sin(2*pi*i/nNodes),x2-10,y2-10);
    //print(weight*a[i]/maxWeight," ");
    print(weight*maxWeight/(a[i]+1)," ");
    //strokeWeight(weight*a[i]/maxWeight);
    strokeWeight(weight*maxWeight/(a[i]+1));
    float m = (y2-y1)/(x2-x1);
    float main_angle = atan(m);
    
    line(x1,y1,x2,y2);
    
    if (show_tri == 1){
      //breaks on a straight line
      if ((x2-x1 == 0 && (y2 > y1))|| (y2-y1 == 0 && (x2 > x1))){
        main_angle += pi;
      }
      
      float check_x = cos(main_angle)/abs(cos(main_angle));
      float check_y = sin(main_angle)/abs(sin(main_angle));
      
      float dir_x = (x2-x1)/abs(x2-x1);
      float dir_y = (y2-y1)/abs(y2-y1);
      
      if (check_x*dir_x > 0 && check_y*dir_y > 0) {
        main_angle += pi;
      }
      //strokeWeight(3);
      //line(x2,y2,x2+l*cos(main_angle),y2+l*sin(main_angle));
      //line(x2,y2,x2+l*cos(main_angle+angle_off),y2+l*sin(main_angle+angle_off));
      //line(x2,y2,x2+l*cos(main_angle-angle_off),y2+l*sin(main_angle-angle_off));
      stroke(255);
      strokeWeight(1);
      triangle(x2,y2,x2+l*cos(main_angle+angle_off),y2+l*sin(main_angle+angle_off),x2+l*cos(main_angle-angle_off),y2+l*sin(main_angle-angle_off));
    }
    fill(0,200+50*sin(PI/2*a[i]/maxWeight),200+50*cos(PI/2*a[i]/maxWeight));
    rect(g_x,g_y,a[i]/maxWeight*(sq_size)/nNodes,a[i]/maxWeight*(sq_size)/nNodes);
    i++;
  }
}
void draw() {
  
}
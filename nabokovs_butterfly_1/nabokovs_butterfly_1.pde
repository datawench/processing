float  radius = 100;
float scaler = 0.3;
float t = 0;
int angleinc = 1;
 
void setup() {
  size(400,400);
  background(204);
  frameRate(30);
}
 
void draw() {
  t += .001;
  //println(t);
  background(204);
  butterfly(t);
}
 
void butterfly(float t){
float magi;
float lastmag = 0;
int lastangle = 0;
 
  for(int angle=0; angle<361; angle+=angleinc){
    magi = exp(sin(t)) - 2*cos(angle*t) + (sin(1/2*(angle*t-PI)));
    polarLinePlot(lastangle,angle,lastmag,magi);
    lastmag = magi;
    lastangle = angle;
  }
}
 
void polarLinePlot(int angle1,int angle2,float mag1,float mag2){
  float x_offset = width/2;
  float y_offset = height/2;
 
  float px1 = x_offset + cos(radians(angle1))*radius*mag1*scaler;
  float py1 = y_offset + sin(radians(angle1))*radius*mag1*scaler;
  float px2 = x_offset + cos(radians(angle2))*radius*mag2*scaler;
  float py2 = y_offset + sin(radians(angle2))*radius*mag2*scaler;
  line(px1,py1,px2,py2);
}

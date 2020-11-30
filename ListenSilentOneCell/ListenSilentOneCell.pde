Tracker myTracker;
Cell cell1;
PImage imgBackground;
PImage imgForeground;
PImage imgLightBleed;

int frameRateSpeed = 30;           // change cell jiggle speed separately 
int chromaticStrokeA = 20;    // alpha channel for chromatic aberration stroke transparency (max. 255)
int chromaticFillA = 20;    // alpha channel for chromatic aberration fill transpare (max. 255)

int cellColorR = 108;
int cellColorG = 255;
int cellColorB = 158;
int cellColorA = 200;              // alpha channel for cell fill transparency (max. 255)

int cellBorderR = 124;
int cellBorderG = 201;
int cellBorderB = 150;
int cellBorderA = 255;              // alpha channel for cell border transparency (max. 255)

float cellCoordinateX = 400;
float cellCoordinateY = 400;
float cellSizeX = random(14, 18);
float cellSizeY = random(14, 18);
float cellJiggleSpeed = 0.5;
float cellJiggleStrength = random(-0.5, 0.5);

// change factor with screen size
float chromaticOffsetR = 1.015;      // offset for red chromatic aberration from cell
float chromaticOffsetB = 0.985;      // offset for red chromatic aberration from cell
float chromaticSizeR = 1.2;      // offset for red  chromatic aberration from cell
float chromaticSizeB = 0.98;      // offset for red chromatic aberration from cell

void setup() {
  fullScreen(FX2D);  // actual screen size 1080*1920*2;
  // fullScreen(FX2D, SPAN); use this for displaying on multiple screens
  ScreenSetup screen = new ScreenSetup(); // important for scaling the screen for the correct aspect ratio
  myTracker = new Tracker();// important for getting the tracking information from an external application
  frameRate(frameRateSpeed);      // framerate of TV (probably 60) should be divisable by framaRate
  blendMode(BLEND);    // addition of colors should be white

  imgBackground = loadImage("background.PNG");
  imgForeground = loadImage("foreground.PNG");
  imgLightBleed = loadImage("lightBleed.PNG");
  cell1 = new Cell();
};

void draw() {
  PVector Pos = myTracker.getTarget(); // the getTarget returns the position of the target
  pushStyle();
  strokeWeight(2);
  stroke(0, 0, 0);
  line(width/2, 0, width/2, height);
  popStyle();

  background(255);
  tint(255, 255);
  image(imgBackground, 0, 0, width, height);

  cell1.paint();
  cell1.chromaticAberrationRed();
  cell1.chromaticAberrationBlue();

  tint(255, 80);
  image(imgForeground, 0, 0, width, height);
  image(imgLightBleed, 0, 0, width, height);
}

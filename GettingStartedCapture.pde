/**
 * Getting Started with Capture.
 * 
 * Reading and displaying an image from an attached Capture device. 
 */

import processing.video.*;

Capture cam;

int threshold=127;

void setup() {
  size(640, 480);
  String[] cameras = Capture.list();
  println(Capture.list());
    cam = new Capture(this, cameras[18]);
    cam.start();
}

void draw() {
  if (cam.available() == true) {
    cam.read();
    cam.loadPixels();
  }
  
  for(int i=0;i<cam.width*cam.height;i++)
  {  
    float brightNum = brightness(cam.pixels[i]);
    if (brightNum>threshold)
    {
      cam.pixels[i]=color(255);
    }
    else
    {
      cam.pixels[i]=color(0);
    }    
  }
  
  cam.updatePixels();
  image(cam, 0, 0);
}

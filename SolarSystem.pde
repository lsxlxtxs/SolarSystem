//
//  Author: Laura Seletos
//  Adapted from Dr. Michael Branton
//  Date: 12/9/2011
//  Version 1
//  Android Solar System
//

import processing.opengl.*;

Viewpoint myViewpoint;
float eye[];

float mercRotangle, mercRevangle, earthRotangle, earthRevangle, venRotangle, venRevangle, marsRotangle, marsRevangle;
float moonOneRotangle, moonOneRevangle, moonTwoRotangle, moonTwoRevangle, moonThreeRotangle, moonThreeRevangle;

//Planets:
GLTexturedSphere myEarth, myMercury, myVenus, myMars;

//Sun & Moons:
GLTexturedSphere mySun, myEarthMoon, myMarsPhobos, myMarsDeimo;


void setup()
{
  //for android tablet
  orientation(LANDSCAPE);
  size(960,540, OPENGL);

  // set starting view
  eye=new float[3];
  eye[0]=0;
  eye[1]=0;
  eye[2]=200;
  myViewpoint=new Viewpoint();
  myViewpoint.setCamera(eye, 90, 180);

  // prespective projection
  perspective(45, float(width)/float(height), 1, 500);

  // angle for sphere motion for each planet and moon
  mercRotangle=0.0f;
  mercRevangle=0.0f;
  
  earthRotangle=0.0f;
  earthRevangle=0.0f;
  
  venRotangle=0.0f;
  venRevangle=0.0f;
 
  marsRotangle=0.0f;
  marsRevangle= 0.0f;
  
  moonOneRotangle= 0.0f;
  moonOneRevangle= 0.0f;
  
  moonTwoRotangle= 0.0f;
  moonTwoRevangle= 0.0f;
  
  moonThreeRotangle= 0.0f;
  moonThreeRevangle= 0.0f;
  
  
  //Sun
  mySun=new GLTexturedSphere(15,15);
  mySun.setTexture("sun.jpg");
  
  //Mercury
  myMercury=new GLTexturedSphere(15,15);
  myMercury.setTexture("mercury.jpg");
  
  //Venus  
  myVenus=new GLTexturedSphere(15,15);
  myVenus.setTexture("venus.jpg");
  
  //Earth
  myEarth=new GLTexturedSphere(15,15);
  myEarth.setTexture("earth.jpg");
    //Moon
    myEarthMoon=new GLTexturedSphere(15,15);
    myEarthMoon.setTexture("moon.jpg");
    
  //Mars
  myMars=new GLTexturedSphere(15,15);
  myMars.setTexture("mars.jpg");
    //Mars Moon - Phobos
    myMarsPhobos=new GLTexturedSphere(15,15);
    myMarsPhobos.setTexture("moon.jpg");  
    //Mars Moon - Deimo
    myMarsDeimo=new GLTexturedSphere(15,15);
    myMarsDeimo.setTexture("moon.jpg");    

   
}

void draw()
{
  camera(   myViewpoint.eye[0], myViewpoint.eye[1], myViewpoint.eye[2], 
            myViewpoint.look[0], myViewpoint.look[1], myViewpoint.look[2], 
            myViewpoint.up[0], myViewpoint.up[01], myViewpoint.up[2]);

  background(0);
  
  //Sun's light
  pointLight(255, 255, 224, 0, 0, 0);
  
  ambientLight(35, 35, 35);
    
   //SUN:

          //scale sun 
          scale(20, 20, 20);
          
          //rotate sun
          rotateY(90);
          
          //set sun so light comes through
          emissive(200, 200, 200);
          
          // draw sun 
          mySun.display();

          //set sun so light comes through
          emissive(0, 0, 0);
          
  //MERCURY:
  pushMatrix();

          // revolve around the origin
          rotateY(mercRevangle);
          mercRevangle+=0.03f;
          translate(2, 0, 0);
          
          // rotate on axis
          rotateY(mercRotangle);
          mercRotangle+=0.005f;
          
          // point the north pole up
          rotateX(radians(-90));
          
          //scale  
          scale(0.1, 0.1, 0.1);
          
          // draw mercury
          myMercury.display();
          
  popMatrix();
  
  //VENUS
    pushMatrix();
          // revolve around the origin
          rotateY(venRevangle);
          venRevangle+=0.04f;
          
          translate(3.5, 0, 0);
          
          // rotate on axis
          rotateY(venRotangle);
          venRotangle+=0.005f;
          
          // point the north pole up
          rotateX(radians(-90));
          
          //scale  
          scale(0.3, 0.3, 0.3);
          
          // draw venus
          myVenus.display();
    popMatrix();
  
   //EARTH:   
          pushMatrix();
          
          // revolve around the origin
          rotateY(earthRevangle);
          earthRevangle+=0.02f;
          translate(5.5, 0, 0);
          
          pushMatrix();
          
          // rotate on axis
          rotateY(earthRotangle);
          earthRotangle+=0.005f;
          
          // point the north pole up
          rotateX(radians(-90));
          
          //scale  
          scale(0.3, 0.3, 0.3);
          
          // draw earth
          myEarth.display();
          popMatrix();
  

               //EARTH'S MOON:
                            pushMatrix();
                            // revolve around the origin
                            rotateY(moonOneRevangle);
                            moonOneRevangle+=0.03f;
                            
                            translate(0.5, 0, 0);
                            
                            //scale moon
                            scale(0.1, 0.1, 0.1);

                            // rotate on axis
                            rotateY(moonOneRotangle);
                            moonOneRotangle+=0.05f;
                            
                            // point the north pole up
                            rotateX(radians(-90));
                                                          
                            // draw earth's moon
                            myEarthMoon.display();
                            popMatrix();        
                            popMatrix();           
   
           
  //MARS:
          pushMatrix();
          // revolve around the origin
          rotateY(marsRevangle);
          marsRevangle+=0.015f;
          translate(7, 0, 0);
          
          pushMatrix();
          // rotate on axis
          rotateY(marsRotangle);
          marsRotangle+=0.0005f;
          
          // point the north pole up
          rotateX(radians(-90));
          
          //scale  
          scale(0.1, 0.1, 0.1);
          
          // draw mars
          myMars.display();
          popMatrix();
          
               //MARS MOON - Phobos
                            
                            pushMatrix();
                            // revolve around the origin
                            rotateY(moonTwoRevangle);
                            moonTwoRevangle+=0.035f;
                            
                            //scale moon
                            scale(0.05, 0.05, 0.05);
                            translate(5, 0, 0);

                            // rotate on axis
                            rotateY(moonTwoRotangle);
                            moonTwoRotangle+=0.05f;
                            
                            // point the north pole up
                            rotateX(radians(-90));
                              
                            // draw earth's moon
                            myMarsPhobos.display();  
                             
                            popMatrix();
                             
               //MARS MOON - Deimo:
                             pushMatrix();
                          
                            //revolve around the origin
                            rotateY(moonThreeRevangle);
                            moonThreeRevangle+=0.03f;
                            
                            //scale moon
                            scale(0.05, 0.05, 0.05);
                            translate(5, 0, 0);
                            
                            // rotate on axis
                            rotateY(moonThreeRotangle);
                            moonThreeRotangle+=0.05f;
                            
                            // point the north pole up
                            rotateX(radians(-90));
                              
                            // draw earth's moon
                            myMarsDeimo.display();                           

      popMatrix();
      popMatrix();     
  
}

void mouseDragged()
{
   if(mouseX>pmouseX)
   {
     myViewpoint.lookLeft();
   }
   else if(mouseX<pmouseX)
   {
     myViewpoint.lookRight();
   }
   
   if(mouseY>pmouseY)
   {
     myViewpoint.lookUp();
   }
   else if(mouseY<pmouseY)
   {
     myViewpoint.lookDown();
   }
}

void mousePressed()
{
  // reset view
  eye[0]=0;
  eye[1]=0;
  eye[2]=200;
  myViewpoint.setCamera(eye, 90, 180);
}


public String sketchRenderer()
{
  return OPENGL;
}


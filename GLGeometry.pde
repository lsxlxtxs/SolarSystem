/**
 * @author mbranton
 *
 * created: 26 July, 2011
 * 
 * purpose: base class for implementing "GL" aspects of geometry
 * 
 * Revised: 31 July, 2011
 * 			Added material properites for color
 * 			Added display method to account for additional attributes
 * 
 * Revised: 12 Aug, 2011
 * 			Added texture coordinates
 * 			Changed display to accept a ShaderControl object, rather
 * 			than just the attribute ids. Attribute ids are now handled 
 * 			locally within the display method.
 *
 * Revised: 20 Nov, 2011
 *                     Added modified display and added texture image to support 
 *                     support processing environment
 * 
 */

public abstract class GLGeometry extends Geometry 
{
  /////////////////////////////////////////////
  //                  properties             //
  /////////////////////////////////////////////

  //	drawing mode; default to triangle_fan.
  //	some other possibilities are GL.GL_LINES
  //	or GL.GL_POINTS, etc
  
  private static final int NORM=0; // replaces NORMALIZED
  
  int	mode;

  // color of the object
  int[] my_color;
  int[] colors;
  boolean stroked;
  
  // material properties
  int[] ambient;

  int[] diffuse;

  int[] specular;

  int shininess;

  // texture coordinates
  float[] texcoordinates;
  
  // image for texturing;
  PImage img; 

  ////////////////////////////////////////////
  //              methods                   //
  ////////////////////////////////////////////

  public GLGeometry()
  {
    // default display mode
    this.setMode(POINTS);

    // default color
    this.my_color=new int[4];
    this.setColor(255,255,255);

    this.vertices=null;
    this.normals=null;
    this.colors=null;
    this.stroked=false;
    this.texcoordinates=null;
    this.img=null;
  }


  public void setMode(int mode)
  {
    this.mode=mode;
  }

  public int getMode()
  {
    return this.mode;
  }

  public void setColor(int red, int green, int blue)
  {
    this.my_color[0]=red;
    this.my_color[1]=green;
    this.my_color[2]=blue;
    this.my_color[3]=255;
  }

  public void setColor(int red, int green, int blue, int a)
  {
    this.my_color[0]=red;
    this.my_color[1]=green;
    this.my_color[2]=blue;
    this.my_color[3]=a;
  }

  public void setColors(int[] colors)
  {
    this.colors=colors;
  }

  public int[] getColor()
  {
    return this.my_color;
  }

  public int[] getColors()
  {
    return this.colors;
  }
  
  public void setStroked(boolean stroked)
  {
    this.stroked=stroked;
  }

  public void setAmbient(int red, int green, int blue, int a)
  {
    this.ambient[0]=red;
    this.ambient[1]=green;
    this.ambient[2]=blue;
    this.ambient[3]=a;
  }

  public int[] getAmbient()
  {
    return this.ambient;
  }

  public void setDiffuse(int red, int green, int blue, int a)
  {
    this.diffuse[0]=red;
    this.diffuse[1]=green;
    this.diffuse[2]=blue;
    this.diffuse[3]=a;
  }

  public int[] getDiffuse()
  {
    return this.diffuse;
  }

  public void setSpecular(int red, int green, int blue, int a)
  {
    this.specular[0]=red;
    this.specular[1]=green;
    this.specular[2]=blue;
    this.specular[3]=a;
  }

  public int[] getSpecular()
  {
    return this.specular;
  }

  public void setShininess(int s)
  {
    this.shininess=s;
  }

  public int getShininess()
  {
    return this.shininess;
  }
  
  public void setTexture(String tex)
  {
      this.img = loadImage(tex);
  }
  
  public void display()
  {
      if(this.stroked)
      {
        stroke(my_color[0],my_color[1],my_color[2]);
      }
      else
      {
          noStroke();
      }
      fill(my_color[0],my_color[1],my_color[2]);
      beginShape(this.mode);
      if(normals==null)
      {
            for(int i=0;i<vertices.length;i=i+4)
            {
              vertex(vertices[i],vertices[i+1],vertices[i+2]);
            }
      }
      else if(texcoordinates==null)
      {
          int j=0;
          for(int i=0;i<vertices.length;i=i+4)
            {
              normal(normals[j++],normals[j++],normals[j++]);
              vertex(vertices[i],vertices[i+1],vertices[i+2]);
            }
      }
      else
      {
          texture(this.img);
          textureMode(NORM);   // should really make thi settable
          
          int j=0;
          int k=0;

          for(int i=0;i<vertices.length;i=i+4)
          {   normal(normals[j++],normals[j++],normals[j++]);
              vertex(vertices[i],vertices[i+1],vertices[i+2],texcoordinates[k++],texcoordinates[k++]);
          }
      }
      endShape();
  }
}

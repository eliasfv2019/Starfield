//Starfield Assignment by Elias Finamore-Velasco
//11/23/18

Particle[] particles = new Particle[1000];
//your code here

void setup()
{
  size(300, 300);
  particles[0] = new OddballParticle();
  particles[1] = new JumboParticle(width/2, height/2);
  for (int i=2; i < particles.length; i++) {
    particles[i] = new NormalParticle(width / 2, height / 2);
  }
  //your code here
}
void draw()
{
  background(0);
  for (int i = 1; i < particles.length; i++) {
    particles[i].show();
    particles[i].move();
  }
  //your code here
}

class NormalParticle implements Particle {
  double x, y;
  color c = color(random(255), random(255), random(255));
  double speed = (Math.random()*(2*PI));
  double angle = (float)(Math.random()*(2 * PI));

  NormalParticle(int x, int y) {
    this.x = x; 
    this.y = y;
    this.speed = ((Math.random()*6)+2)+Math.cos(2.03) * 8.25;
    this.angle = ((Math.random()*9)+2)+ Math.sin(2.03) * 8.25;
    //your code here
  }
  public void show() {
    fill(c);
    ellipse((float)x, (float)y, 5, 5);
  }
  public void move() {
    x = x + Math.sin(angle)*speed;
    y = y + Math.cos(angle)*speed;
  }
}

interface Particle
{
  public void move();
  public void show();
  //your code here
}

class OddballParticle implements Particle//uses an interface
{
  int x, y;
  //your code here
  public void show() {
    fill(255, 255, 0);
    ellipse((float)x, (float)y, 30, 30);
  }

  public void move() {
  }
}

class JumboParticle extends NormalParticle//uses inheritance
{
  JumboParticle(int x, int y) {
    super(x, y);
  }
  public void show() {
    fill(c); 
    ellipse((float)x, (float)y, 20, 20);
  }

  public void move() {
    x = x + Math.cos(angle)*speed;
    y = y + Math.sin(angle)*speed;
  }
}

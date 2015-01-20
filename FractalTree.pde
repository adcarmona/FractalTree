private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = .2;  
public void setup() 
{   
	size(640,480);    
	noLoop(); 
} 
public void draw() 
{   
	background(0);   
	stroke((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));   
	line(320,480,320,380);   
	stroke((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));   
	line(240,480,240,380); 
	stroke((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));     
	line(400,480,400,380);  
	stroke((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));    
	line(160,480,160,380);   
	stroke((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));   
	line(480,480,480,380); 
	drawBranches(320,380,100,3*Math.PI/2);  //will add later 
	drawBranches(240,380,100,3*Math.PI/2);
	drawBranches(400,380,100,3*Math.PI/2);
	drawBranches(160,380,100,3*Math.PI/2);
	drawBranches(480,380,100,3*Math.PI/2);
} 
public void keyTyped()
{
	if(key == 'q')
	{
		fractionLength = fractionLength + .01;
	}
	if(key == 'a')
	{
		fractionLength = fractionLength - .01;
	}
	if(key == 'w')
	{
		branchAngle = branchAngle + 0.01;
	}
	if(key == 's')
	{
		branchAngle = branchAngle - 0.01;
	}
	redraw();
}
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
	//your code here   
	double angle1 = angle + branchAngle;
	double angle2 = angle - branchAngle; 
	branchLength = branchLength * fractionLength;
	int endX1 = (int)(branchLength*Math.cos(angle1) + x);
	int endY1 = (int)(branchLength*Math.sin(angle1) + y);
	int endX2 = (int)(branchLength*Math.cos(angle2) + x);
	int endY2 = (int)(branchLength*Math.sin(angle2) + y);
	stroke((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));   
	line(x, y, endX1, endY1);
	line(x, y, endX2, endY2);
	if(branchLength > smallestBranch)
	{
		drawBranches(endX1, endY1, branchLength, angle1);
		drawBranches(endX2, endY2, branchLength, angle2);
	}
} 

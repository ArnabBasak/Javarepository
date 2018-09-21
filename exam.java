import java.io.*;
class area
{
	public static void main(String args[])throws Exception
	{
		DataInputStream s = new DataInputStream(System.in);
		System.out.println("enter base of the triangle");
		float b= Float.parseFloat(s.readLine());
		System.out.println("enter height of the trinagle");
		float h = Float.parseFloat(s.readLine());
		float area =0.5f*b*h;
		System.out.println("area of triangle :"+area);
	}
}
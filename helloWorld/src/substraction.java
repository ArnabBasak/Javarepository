import java.util.Scanner;
public class substraction {
	Scanner in = new Scanner(System.in);
	public double a,b,c;
	public void getNumbersofSubtract()
	{
		System.out.println("enter a");
		a = in.nextDouble();
		System.out.println("enter b");
		b = in.nextDouble();
	}
	public void subNumbers()
	{
		c = a-b;
		System.out.println("substraction of "+a+" and "+b+" is " +c);
	}
	

}

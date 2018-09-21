import java.util.Scanner;
public class addition{
	public double a,b,c;
	
	public void getNumbersforAddition() 
	{
		Scanner in = new Scanner(System.in);
		System.out.println("enter a: ");
				a = in.nextDouble();
		System.out.println("enter b");
			b = in.nextDouble();	
	}
	public void addNumbers()
	{
		c = a+b;
		System.out.println("addition of the entered number "+a+" and "+b+" is "+c);
		
	}

}

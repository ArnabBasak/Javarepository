public class exptdemo
{
	public static void main(String[] args)
	{
		int ans1,ans2;
		int a=2,b=2,c=0;
		try
		{
			ans1=a/b;
			System.out.println("a/b=" +ans1);
			ans2=a/c;
			System.out.println("a/c=" +ans2);
		}
		catch(ArithmeticException e)
		{
			System.out.println("Arithmatic Exception!");
		}
		System.out.println("demo is over");
	}
}
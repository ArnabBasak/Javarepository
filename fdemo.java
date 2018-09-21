public class fdemo
{
	public static void main(String args[])
	{
		try
		{
			System.out.println("try block before the error");
			System.out.println(1/0);
			System.out.println("try block after error");
			return;
		}
		catch(java.lang.ArithmeticException e)
		{
			System.out.println("catch block");
			System.out.println("A stack trace of the error");
			e.printStackTrace();
			System.out.println("the operation is not possible");
		}
		finally
		{
			System.out.println("finally block");
			System.out.println("demo is over");
		}
	}
}

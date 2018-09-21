class multicatchdemo
{
	public static void main(String args[])
	{
		int A[]=new int[5];
	try
	{	
		for(int c=0;c<5;c++)
		{
			//do nothing
		}
		for(int c=0;c<=5;c++)
		{
			A[c]=c/c;
		}
	}

	catch(ArrayIndexOutOfBoundsException e)
	{
		System.out.println("Array out of bound");
	}
	catch(ArithmeticException e)
	{
		System.out.println("zero divide error");
	}
	}
}
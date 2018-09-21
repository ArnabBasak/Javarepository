class calc
{
	void sum(int a,int b,int c)
	{
		System.out.println("addition is"+(a+b+c));
	}
	void sum(int a,int b)
	{
		System.out.println("addition is"+(a+b));
	}
	public static void main(String args[])
	{
		calc c= new calc();
		c.sum(10,10,10);
		c.sum(12,13);
	}
}

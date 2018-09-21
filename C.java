interface fact
{
	void calculate(int n);
}
class C implements fact
{
	public void calculate(int num)
	{
		int x=1;
		int i;
		for(i=1;i<=num;i++)
		x=x*i;
		System.out.println("factorial is" +x);
	}
	public static void main(String args[])
	{
		C obj = new C();
		obj.calculate(5);
	}
}
	
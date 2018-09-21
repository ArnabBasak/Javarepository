class demo
{
	int n,n2,sum;
	public void take(int x,int y)
	{
		n=x;
		n2=y;
	}
	public void sum()
	{
		sum=n+n2;
	}
	public void print()
	{
		System.out.println("the sum is "+sum);
	}
}
class parapass
{
	public static void main(String args[])
	{
		demo obj = new demo();
		obj.take(10,15);
		obj.sum();
		obj.print();
	}
}
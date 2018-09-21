class demo
{
	int n1,n2;
	public void take(int x,int y)
	{
		n1=x;
		n1=y;
	}
	public int process()
	{
		return(n1+n2);
	}
}
class valuereturn
{
	public static void main(String args[])
	{
		int sum;
		demo obj = new demo();
		obj.take(15,25);
		sum=obj.process();
		System.out.println("the sum is" +sum);
	}
}
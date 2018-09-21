class large
{

	int compare(int a,int b)
	{
		if(a==b)
		return 0;
		else if(a>b)
		return 1;
		else
		return -1;
	}
	public static void main(String args[])
	{
		large obj = new large();
		int a=2,b=3;
		int c=obj.compare(a,b);
		if(c==1)
		System.out.println("a is largest");
		else if(c==0)

		System.out.println("Both no are equal");
		else
		System.out.println("B is largest");
	}
}	
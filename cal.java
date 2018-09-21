class cal
{
	void area(int s)
	{
		System.out.println("area of square is: "+(s*s));
	}
	void area(int l,int b,int h)
	{
		System.out.println("area of rectangle is: "+(l*b*h));
	}
	public static void main(String args[])
	{
		cal obj = new cal();
		obj.area(10);
		obj.area(20,20,20);
	}
}	
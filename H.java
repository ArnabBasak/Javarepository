class first
{
	int x=10,y=20;
	void display()
	{
		System.out.println("this is the method in class one");
		System.out.println("value of X="+x);
		System.out.println("value of y = "+y);
	}
}
class two extends first
{
	void add()
	{
		System.out.println("the method of class two");
		System.out.println("X+Y"+(x+y));
	}
}
class three extends first
{
	void mul()
	{
		System.out.println("this is the method of class three");
		System.out.println("X*Y"+(x+y));
	}
}
class H 
{
	public static void main(String args[])
	{
		two t1 = new two();
		three t2 = new three();
		t1.display();
		t1.add();
		t2.mul();
	}
}
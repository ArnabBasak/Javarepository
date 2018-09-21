class statmethod
{
	int rollno;
	String name;
	static String college="RKNEC";
	static void change()
	{
		college="ROCEM";
	}
	statmethod(int r,String n)
	{
		rollno=r;
		name=n;
	}
	void display()
	{
		System.out.println(rollno+""+name+""+college);
	}
	public static void main(String args[])
	{
		statmethod.change();
		statmethod s1 = new statmethod(111,"karan");
		statmethod s2 = new statmethod(222,"aryan");
		statmethod s3 = new statmethod(333,"suraj");
		s1.display();
		s2.display();
		s3.display();
	}
}
	
			
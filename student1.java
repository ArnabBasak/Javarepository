class student1
{
	int id;
	String name;
	student1(int i,String n)
	{
		id=i;
		name=n;
	}
	void display()
	{
		System.out.println(id+" "+name);
	}
	public static void main(String args[])
	{
		student1 s1 = new student1(111, "karan");
		student1 s2 = new student1(222, "aryan");
		s1.display();
		s2.display();
	}
}
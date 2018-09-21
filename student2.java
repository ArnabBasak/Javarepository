class student2
{
	int id;
	String name;
	student2(int i,String n)
	{
		id=i;
		name=n;
	}
	student2(student2 S)
	{
		id=S.id;
		name = S.name;
	}
	void display()
	{
		System.out.println(id+" "+name);
	}
	public static void main(String args[])
	{
		student2 s1 = new student2(111,"karan");
		student2 s2 = new student2(s1);
		s1.display();
		s2.display();
	}
}
	
	
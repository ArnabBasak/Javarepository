interface printlable
{
	void print();
}
interface showable
{
	void show();
}
class B implements printable,showable
{
	public void print()
	{
		System.out.println("Hello");
	}
	public void show()
	{
		System.out.println("welcome");	

	}
	public static void main(String args[])
	{
		B obj = new B();
		obj.print();
		obj.show();
	}
}
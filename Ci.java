interface printlable
{
	void print();
}
interface showable extends printable
{
	void show();
}
class Ci implements showable
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
		Ci obj = new Ci();
		obj.print();
		obj.show();
	}
}
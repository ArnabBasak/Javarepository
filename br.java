interface printable
{
	void print();
}
interface showable
{
	void show();
}
class br implements printable,showable
{
	public void print()
	{
		System.out.println("hello");
	}
	public void show()
	{
		System.out.println("welcome");
	}
	public static void main(String args[])	
	{
		br obj = new br();
		obj.print();
		obj.show();
	}
} 
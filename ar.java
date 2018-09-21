interface printable
{
	void print();
}
class ar implements printable
{
	public void print()
	{
		System.out.println("hello");
	}
	public static void main(String args[])
	{
		ar obj = new ar();
		obj.print();
	}
}
	
interface printable
{
	void print();
}
class D implements printable
{
	public void print()
	{
		System.out.println("Hello");
	}
	public static void main(String args[])
	{
		D obj = new D();
		obj.print();	
	}
}
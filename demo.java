class demo
{
	private int x,y,z;
	public void input()
	{
		x=10;
		y=15;
	}
	public void sum()
	{
		z=x+y;
	}
	public void print_data()
	{
		System.out.println("Answer is ="+z);
	}
	public static void main(String args[])
	{
		demo object =new demo();
		object.input();
		object.sum();
		object.print_data();
	}
}


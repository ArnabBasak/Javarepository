class dem
{
	private int x,y,z;
	public void input()
	{
		x=10;
		y=20;
	}
	public void solve()
	{
		z=x+y;
	}
	public void display()
	{
		System.out.println("addition of two nos is:" +z);
	}
}
class s_dem
{
	public static void main(String args[])
	{
		dem obj = new dem();
		obj.input();
		obj.solve();
		obj.display();
	}
}
		
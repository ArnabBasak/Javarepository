abstract class shape
{
	abstract void draw();
}
class rectangle extends shape
{
	void draw()
	{
		System.out.println("drawing rectangle");
	}
}
class circle extends shape
{
	void draw()
	{
		System.out.println("drawing circle");
	}
}
class abstract_test
{
	public static void main(String args[])
	{
		shape s = new circle();
		s.draw();
		rectangle s1=new rectangle();
		s1.draw();
	}
}
		
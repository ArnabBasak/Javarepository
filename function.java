class Vechile
{
	void run()
	{
		System.out.println("vechile is running");
	}
}
class bike extends Vechile
{
	void run()
	{
		System.out.println("bike is running");
	}
public static void main(String args[])
{
	bike b = new bike();
	//Vechile v  = new Vechile();
	b.run();
	//v.run();
}
} 
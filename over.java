class vehicle
{
	void run()
	{
		System.out.println("vehicle is running");
	}
}
class Bike extends vehicle
{
	void run()
	{
		System.out.println("Bike is running safely");
	}
}
class over
{
public static void main(String args[])
{
	Bike obj = new Bike();
	obj.run();
}

}

	
class vehicle
{
	void run()
	{
		System.out.println("vehicle is running");
	}

class bike extends vehicle
{
	void run()
	{
		System.out.println("Bike is running safely");
	}
}
public static void main(String args[])
{
	bike obj = new bike();
	obj.run();
}

	
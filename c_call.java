class A
{
	A()
	{
		System.out.println("constructor of class A has been called");
	}
}
class B extends A
{
	B()
	{
		
		System.out.println("constructor of class B has been called");
	}
}
class C extends B
{
	C()
	{
		System.out.println("constructor of class C has been called");
	}
}
class c_call
{
	public static void main(String args[])
	{
		System.out.println("welcome to the constructor demo");
		C obj = new C();
	}
}
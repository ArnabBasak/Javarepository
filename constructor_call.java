class A
{
	A()
	{
		System.out.println("constructor of class A has been called");
	}

	class B extends A;
	
	B()
	{
		Super();
		System.out.println("constructor of class B has been called");
	}
	class C extend B;
	C()
	{
		Super();
		System.out.println("constructor of class C has been called");
	}
}
class constructor_call
{
	public static void main(String args[])
	{
		System.out.println("welcome to constructor call demo");
		c obj = new c();
	}
}
		
	
	

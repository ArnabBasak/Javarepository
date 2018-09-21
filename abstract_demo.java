abstract class A
{
	abstract void method1();
	void method2()
	{
		System.out.println("this is real number");
	}
}
class B extends A
{
	void method1()
	{
		System.out.println("B is execution of method1");
	}
}
class  abstract_demo
{
	public static void main(String args[])
	{
		B b=new B();
		b.method1();
		b.method2();
	}
}

	
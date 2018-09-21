class first
{
	int x = 10;
	int y = 20;
	void display()
	{
		System.out.println("this is the method of class one");
		System.out.println("value of x=" +x);
		System.out.println("value of y="+y);
	}
	class two extends first
	{
		void add()
		{
			System.out.println("this is the method in class two");
			System.out.println("x+y"+(x+y));
		}
	}
	class three extends first
	{
		void mul()
		{
			System.out.println("this is the method in class three");
			System.out.println("x*y= " +(x*y));
		}
	}

	class hier
	{
		public static void main(String args[])
		{
			two t1 = new two();
			three t2 = new three();
			t1.display();
			t1.add();
			t2.mul();
		}
	}

}			
	
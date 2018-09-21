class num_to_word
{
	public void convert(int x)
	{
		int num=x;
		int rev=0;
		byte d;
		while(num!=0)
		{
			d=num%10;
			rev=rev*10+d;
			num=num/10;
		}
		while(rev!=0)
		{
			d=rev%10;
			digit_to_word(d);
			rev/=10;
		}
	}
	public void digit_to_word(byte x)
	{
		d=x;
		switch(x)
		{
			case 0:
			System.out.print("zero");
			break;
			case 1:
			System.out.print("one");
			case 2:
			System.out.print("two");
			case 3:
			System.out.print("three");
			case 4:
			System.out.print("four");
			case 5:
			System.out.print("five");
			case 6:
			System.out.print("six");
			case 7:
			System.out.print("seven");
			case 8:
			System.out.print("eight");
			case 9:
			System.out.print("nine");
		}

	}

	public static void main(String args[])
	{
		num_to_word n = new num_to_word(byte x);
		n.convert(Integer.parseInt(args[0]));
		n.digit_to_word();
	}
}

			
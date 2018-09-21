class demonumtoword
{
	public void convert(int x)
	{
	   int num=x;
	   int rev=0;
	   int d;

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
		rev /=10;
	     }		
	}
	public void digit_to_word(int x)
	 {
	     
	    switch(x)
	     {
		case 0:
			System.out.print("ZERO ");
			break;

		case 1:
			System.out.print("ONE ");
			break;

		case 2:
			System.out.print("TWO ");
			break;

		case 3:
			System.out.print("THREE ");
			break;

		case 4:
			System.out.print("FOUR ");
			break;

		case 5:
			System.out.print("FIVE ");
			break;

		case 6:
			System.out.print("SIX ");
			break;

		case 7:
			System.out.print("SEVEN ");
			break;

		case 8:
			System.out.print("EIGHT ");
			break;

		case 9:
			System.out.print("NINE ");

		
	     }	
	 }
}
class numtoword
{
	public static void main(String args[])
	{
	   demonumtoword nw=new demonumtoword();
	   nw.convert(Integer.parseInt(args[0]));
	}	
}
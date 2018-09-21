class user_input
{
	public static void main(String args[])
	{
		DataInputStream n = new DataInputStream(System.in);
		int m1,m2,m3,avg;
		byte roll_no;
		String name;
		System.out.println("enter name");
		name = n.readLine();
		System.out.println("enter the 1st number");
		m1= Integer.parse.Int(n.readLine());
		System.in.println("enter the 2nd number");
		m2= Integer.parseInt(n.readLine());
		System.out.println("enter the 3rd number");
		m3= Integer.parseInt(n.readLine());
		avg = m1+m2+m3;
		System.out.println("marks are"+m1,+m2,+m3);
		System.out.println("average is "+avg);
	}
}
		
		
		



		
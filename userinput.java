import java.io.DataInputStream;
class userinput
{
	public static void main(String args[])throws Exception
	{
		DataInputStream s1 = new DataInputStream(System.in);
		byte roll_no;
		int m1,m2,m3;
		float avg;
		System.out.println("enter roll number");
		roll_no=Byte.parseByte(s1.readLine());
		System.out.println("enter marks");
		m1=Integer.parseInt(s1.readLine());
		m2=Integer.parseInt(s1.readLine());
		m3=Integer.parseInt(s1.readLine());
		avg=(m1+m2+m3)/3.0f;
		System.out.println("Roll no =" +roll_no);
		System.out.println("Average is =" +avg);
		if(m1>=35&&m2>=35&&m3>=35)
			System.out.println("Result = PASS");
		else
			System.out.println("Result = FAIL");
		
	}
}	
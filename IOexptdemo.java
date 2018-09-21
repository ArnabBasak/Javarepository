import java.io.IOException;
public class IOexptdemo
{
	public static void main(String[] args)
	{
		int num=0;
		//num=System.in.read();
		try
		{
			num=System.in.read();
			System.out.println("you entered" +(char)num);
		}
		catch(IOException e)
		{
			System.out.println("IO Exception occured");
		}
	}
}
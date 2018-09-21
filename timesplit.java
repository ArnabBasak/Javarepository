class time
{
	int hr,min,sec;
	public void input (int x)
	{
		sec=x;
	}
	public void split()
	{
		min=sec/60;
		sec=sec%60;
		hr=min/60;
		min=min%60;
	}
	public void show_data()
	{
		System.out.println("Hours="+hr+"minutes"+min+"seconds"+sec);
	}
}
	class timesplit
	{
		public static void main(String args[])
		{
			time t=new time();
			t.input(360);
			t.split();
			t.show_data();
		}
	}

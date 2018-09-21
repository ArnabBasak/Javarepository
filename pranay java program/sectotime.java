 class demosectotime
{
	int hr,mi,se;
	public void input(int s)
	{
	   se=s;
	}
	public void calc()
	{
	   mi=se/60;
	   se=se%60;
	   hr=hr/60;
  	   mi=mi%60;		 
	}
	public void display()
	{
	   System.out.println("Hours:="+hr +"Minutes:="+mi +"Seconds:="+se );	
	}	
}
class sectotime
{
	public static void main(String args[])
	{
	   demosectotime st=new demosectotime();
	   st.input(360);
	   st.calc();
	   st.display();
	}
}
class thrwdemo
{
	static void tdemo()
	{
		try
		{
			throw new IllegalStateException();
		}
		Catch(NullPointerException e)
		{
			System.out.println("not caught by the catch block inside tdemo(). ");
		}
	}
	public static void main(String args[])
	{
		try
		{
			tdemo();
		}
		Catch(IllegalStateException e)
		{
			System.out.println("Exception caught in: "+e);
		}
	}
}	
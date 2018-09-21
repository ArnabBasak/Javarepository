class StaticMember
{  
   int rollno;  
   String name;  
   static String college =“RCOEM";  
     
    StaticMember(int r, String n)
    {	  
   	rollno = r;  
   	name = n;  
    }
 	void display ()
	{
    	System.out.println(rollno + “ “ + name + “ “ + college);
    	}  
public static void main(String args[])
{  
StaticMember  s1 = new  StaticMember (111,"Karan");  
StaticMember s2 = new  StaticMember (222,"Aryan");  
s1.display();  
s2.display();  
 }  
}   

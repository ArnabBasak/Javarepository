class employee
{
	float salary = 40000;
}
class program extends employee
{
	float bonus = 10000;
public static void main(String args[])
{
	program p = new program();
	System.out.println("programmers salary is:"+p.salary);
	System.out.println("programmers bonus is:"+p.bonus);
}  
}
import java.util.*;
public class cidemo
{
	public static void main(String args[])
	{
		List al = new ArrayList();
		al.add("arnab");
		al.add("mohan");
		al.add("sachin");
		System.out.println("array list element");
		System.out.print("\t"+al);
		
		List ll = new LinkedList();
		ll.add("rahul");
		ll.add("rohit");
		System.out.println("linked list element");
		System.out.print("\t"+ll);
		
		Map hm = new HashMap();
		hm.put("mahesh","36");
		hm.put("mohit","23");
		System.out.println("map elements are");
		System.out.print("\t"+hm);
	}
}   
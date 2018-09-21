import java.util.*;
public class CollectionInterfaceDemo 
{
      public static void main(String[] args) 
      {
      	List al = new ArrayList();
      	al.add("Dhara");
      	al.add("Mahesh");
      	al.add("Aryan");
      	System.out.println(" Array List Elements");
      	System.out.print("\t" + al);

      	System.out.println("\n Array List size : "+ al.size());

      	String s="Mahesh";
      	al.remove(s);
      	System.out.println("\n Array List Elements after remove");
      	System.out.print("\t" + al);

      	al.clear();
      	System.out.println("\n Array List Elements after clear ");
      	System.out.print("\t" + al);
   }
} 

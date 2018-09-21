import java.util.*;
public class ListInterfaceDemo 
{
      public static void main(String[] args)
      {
      	List LL = new LinkedList();
      	LL.add("Dhara");
      	LL.add("Mahesh");
     	LL.add("Aryan");
      	System.out.println(" Array List Elements");
      	System.out.print("\t" + LL);

      	System.out.println("\n Array List size : "+ LL.size());

      	String s="Pravin";
      	LL.add(2,s);
      	System.out.println("\n Array List Elements after add at index 2 ");
      	System.out.print("\t" + LL);    

      	LL.remove(1);
      	System.out.println("\n Array List Elements after remove element at index 1");
      	System.out.print("\t" + LL);

      	System.out.println("\n Element at index 2 : "+ LL.get(2));
      }
} 

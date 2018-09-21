import java.util.*;

public class SortedSetTest 
{
   public static void main(String[] args) 
   {
      // Create the sorted set
      SortedSet set = new TreeSet(); 

      // Add elements to the set
      set.add("b");
      set.add("c");
      set.add("a");

      // Iterating over the elements in the set
      Iterator it = set.iterator();
      while (it.hasNext()) 
      {
         Object element = it.next(); // Get element
         System.out.println(element.toString());
      }
   }
}

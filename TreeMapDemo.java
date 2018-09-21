import java.util.*;

public class TreeMapDemo 
{
      public static void main(String args[]) 
      {
      	// Create a hash map
      	TreeMap tm = new TreeMap();
      	// Put elements to the map
      	tm.put("Dhara", new Double(3434.34));
      	tm.put("Mahesh", new Double(123.22));
      	tm.put("Aryan", new Double(1378.00));
      	tm.put("Daisy", new Double(99.22));
      	tm.put("Qadir", new Double(-19.08));
       
      	Set set = tm.entrySet();    // Get a set of the entries

      	Iterator i = set.iterator();       // Get an iterator
      	// Display elements
      	while(i.hasNext()) 
	{
         	Map.Entry me = (Map.Entry)i.next();
         	System.out.print(me.getKey() + ": ");
         	System.out.println(me.getValue());
        }
      System.out.println();
 	// Deposit 1000 into Dhara's account
      double balance = ((Double)tm.get("Dhara")).doubleValue();
      tm.put("Dhara", new Double(balance + 1000));
      System.out.println("Dhara's new balance: " + tm.get("Dhara"));
   }
}

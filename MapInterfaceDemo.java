import java.util.*;
public class MapInterfaceDemo 
{
      public static void main(String[] args) 
      {

      	Map HM = new HashMap(); 
      	HM.put("Dhara", "8");
      	HM.put("Mahesh", "31");
      	HM.put("Aryan", "12");
      	HM.put("Daisy", "14");
      	System.out.println("Map Elements");
      	System.out.print("\t" + HM);

      	System.out.println("\nMap size:"+ HM.size());

      	HM.remove("Aryan");
      	System.out.println("\nMap Elements after removal");
      	System.out.print("\t" + HM);

      	System.out.println("\nMap keys :");
      	System.out.print("\t" + HM.keySet());
      }
} 

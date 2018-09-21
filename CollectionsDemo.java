import java.util.*;
public class CollectionsDemo 
{
   public static void main(String[] args) 
   { 
      List AL = new ArrayList();
      AL.add("Dhara");
      AL.add("Aryan");
      System.out.println(" ArrayList Elements");
      System.out.print("\t" + AL);

      List LL = new LinkedList();
      LL.add("Mahesh");
      LL.add("Aryan");
      System.out.println("\n LinkedList Elements");
      System.out.print("\t" + LL);

      Map HM = new HashMap(); 
      HM.put("Dhara", "8");
      HM.put("Mahesh", "31");
      HM.put("Aryan", "12");
      HM.put("Daisy", "14");
      System.out.println("\n Map Elements");
      System.out.print("\t" + HM);
   }
} 

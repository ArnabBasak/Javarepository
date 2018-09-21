import java.util.*;

public class SetDemo 
{
     public static void main(String args[]) 
     { 
     	int count[] = {34, 22, 10, 60, 10, 22};
     	Set<Integer> hset = new HashSet<Integer>();
     	try
	{
           for(int i = 0; i<5; i++){
           hset.add(count[i]);
        }
        System.out.println(hset);

        TreeSet sortedSet = new TreeSet<Integer>(hset);
        System.out.println("The sorted list is:");
        System.out.println(sortedSet);

        System.out.println("The First element of the set is:"+ (Integer)sortedSet.first());
        System.out.println("The last element of the set is:"+(Integer)sortedSet.last());
     }
     catch(Exception e){}
  }
} 

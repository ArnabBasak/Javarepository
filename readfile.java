import java.io.*; 
public class readfile
{ 
   public static void main(String[] args) throws IOException
   { 
     File f; 
     f=new File("myfile.txt"); 
     if(!f.exists()&& f.length()<0) 
           System.out.println("The specified file is not exist");
    else
    { 
       FileInputStream finp=new FileInputStream(f); 
       byte b; 
      b=(byte)finp.read(); 
      while(b!=-1)
       { 
           System.out.print((char)b);
            b=(byte)finp.read();
       }
      finp.close();
    }
  }
}

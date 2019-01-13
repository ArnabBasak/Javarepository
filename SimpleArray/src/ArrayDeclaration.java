import java.util.Scanner;;
public class ArrayDeclaration {

	public static void main(String[] args) {
		int n;
		Scanner in = new Scanner(System.in);
		System.out.println("enter the size of the array");
		n = in.nextInt();
		int arr[] = new int[n];
		System.out.println("entering the values in the array.......");
		for(int i = 0;i<n;i++)
		{
			arr[i] = in.nextInt();
		}
		System.out.println("printing the values of the arra..y");
		for(int i = 0;i<n;i++)
		{
			System.out.println(arr[i]);
		}

	}

}

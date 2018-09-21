import java.util.Scanner;
public class mainFile {

	public static void main(String[] args) {
	//System.out.println("hello world");
		Scanner in = new Scanner(System.in);
		System.out.println("enter your choice\n 1.Addition\n 2.Substraction");
		int choice = in.nextInt();
		switch(choice)
		{
		case 1:
			addition add = new addition();
			add.getNumbersforAddition();
			add.addNumbers();
		break;
		case 2:
			substraction sub = new substraction();
			sub.getNumbersofSubtract();
			sub.subNumbers();
		break;
		case 3:
			System.out.println("invalid input");
		}

	}

}

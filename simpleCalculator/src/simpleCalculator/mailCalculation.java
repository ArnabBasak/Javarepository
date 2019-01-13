package simpleCalculator;

import java.util.Scanner;

public class mailCalculation {

	public static void main(String[] args) {
		Scanner in = new Scanner(System.in);
		System.out.println("enter your choice\n1.Addition\n2.Substractionn3.multiplication\n4.division");
		int choice = in.nextInt();
		switch(choice)
		{
		case 1:
			additionClass ac = new additionClass();
			break;
		case 2:
			substractionClass sc = new substractionClass();
			break;
		case 3:
			multiplicationClass mc = new multiplicationClass();
			break;
		case 4:
			divisionClass dc = new divisionClass();
			break;
		default:
			System.out.println("invalid option");
			
		}

	}

}

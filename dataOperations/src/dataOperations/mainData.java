package dataOperations;

import java.util.Scanner;

public class mainData {

	public static void main(String[] args)
	{
	Scanner in = new Scanner(System.in);
	System.out.println("press 1 to insert data: ");
	System.out.println("press 2 to update data: ");
	System.out.println("press 3 to select data: ");
	System.out.println("press 4 to delete all data: ");
	System.out.println("press 0 to exit");
	System.out.println("enter your option");
    int option = in.nextInt();
	while(option!=0)
	{
	//Scanner in = new Scanner(System.in);
		switch (option) {
		case 1:
			insertData id = new insertData();
		break;
		case 2:
			updateData ud = new updateData();
		break;
		case 3:
			selectData sd = new selectData();
		break;
		case 4: 
			deleteData dd = new deleteData();
		break;
		default:
			System.out.println("invalid option");
		break;
		}
		System.out.println("press 1 to insert data: ");
		System.out.println("press 2 to update data: ");
		System.out.println("press 3 to select data: ");
		System.out.println("press 4 to delete all data: ");
		System.out.println("press 0 to exit");
		System.out.println("enter your option");
		option = in.nextInt();
	}
	}
}

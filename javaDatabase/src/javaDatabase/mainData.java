package javaDatabase;

import java.util.Scanner;

public class mainData {

	public static void main(String[] args) {
		Scanner in = new Scanner(System.in);
		System.out.println("enter your choice\n1.insert\n2.delete\n3.searchn\n4.update");
		int choice = in.nextInt();
		switch (choice) {
		case 1:
			simpleInsert si = new simpleInsert();
			break;
		case 2:
			deleteData dd = new deleteData();
			break;
		case 3:
			searchData sd = new searchData();
			break;
		case 4:
			Dataupdate du = new Dataupdate();
			break;
		default:
			System.out.println("invalid option");
			break;
		}
	}

}

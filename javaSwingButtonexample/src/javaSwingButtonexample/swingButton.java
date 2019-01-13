package javaSwingButtonexample;

import java.awt.BorderLayout;
import java.awt.Container;

import javax.swing.JButton;
import javax.swing.JFrame;

public class swingButton {

	public static void main(String[] args) {
		JFrame myframe = new JFrame("Button Frame");
		myframe.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		Container container = myframe.getContentPane();
		container.add(new JButton("PAGE_START"),BorderLayout.PAGE_START);
		container.add(new JButton("PAGE END"),BorderLayout.PAGE_END);
		container.add(new JButton("LINE START"),BorderLayout.LINE_START);
		container.add(new JButton("LINE END"),BorderLayout.LINE_END);
		container.add(new JButton("CENTER"),BorderLayout.CENTER);
		myframe.pack();
		myframe.setVisible(true);

	}

}

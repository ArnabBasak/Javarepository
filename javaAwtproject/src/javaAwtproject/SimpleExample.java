/*creating frame by extending frame class*/
package javaAwtproject;

import java.awt.*;
public class SimpleExample extends Frame {
	SimpleExample()
	{
		Button b = new Button("My Button");
		b.setBounds(50, 50, 50, 50);
		add(b);
		setSize(500,300);
		setTitle("this is my AWT window");
		setLayout(new FlowLayout());
		setVisible(true);
		
	}
	

}

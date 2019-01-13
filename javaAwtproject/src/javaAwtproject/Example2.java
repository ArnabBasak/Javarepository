/*creating the frame by creating instance of the frame class*/
package javaAwtproject;
import java.awt.*;
public class Example2 {
public Example2() {
	Frame fr = new Frame();
	Label lb = new Label("Username");
	fr.add(lb);
	TextField tf = new TextField();
	fr.add(tf);
	fr.setSize(500,300);
	fr.setLayout(new FlowLayout());
	fr.setVisible(true);
}
}

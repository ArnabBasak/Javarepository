import java.awt.*;
public class FlowLayoutDemo extends Frame {
	public FlowLayoutDemo(String title){
		super(title);
		setLayout(new FlowLayout());
		Button b1 = new Button("Button 1");
		add(b1);
		Button b2 = new Button("Button 2");
		add(b2);
		Button b3 = new Button("Button 3");
		add(b3);
		Button b4 = new Button("Button 4");
		add(b4);
		Button b5 = new Button("Button 5");
		add(b5);
		Button b6 = new Button("Button 6");
		add(b6);
		Button b7 = new Button("Button 7");
		add(b7);
		Button b8 = new Button("Button 8");
		add(b8);
		//setComponentOrientation(ComponentOrientation.RIGHT_TO_LEFT);
	}

}

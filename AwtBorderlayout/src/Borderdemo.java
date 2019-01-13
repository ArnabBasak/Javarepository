import java.awt.*;
public class Borderdemo extends Frame {

	public Borderdemo(String title)
	{
		super(title);
		setLayout(new BorderLayout());
		Button b1 = new Button("PAGE START");
		add(b1,BorderLayout.PAGE_START);
		Button b2 = new Button("PAGE END");
		add(b2,BorderLayout.PAGE_END);
		Button b3 = new Button("LINE START");
		add(b3,BorderLayout.LINE_START);
		Button b4 = new Button("LINE END");
		add(b4,BorderLayout.LINE_END);
		Button b5 = new Button("CENTER");
		add(b5,BorderLayout.CENTER);
	}
	public static void main(String[] args) {
		//rderdemo bd = new Borderdemo("Border demo for me");
	//d.setSize(500,50);
	//d.setVisible(true);
		FlowLayoutDemo f = new FlowLayoutDemo("this is the new layout window");
		f.setSize(400,150);
		f.setVisible(true);
		
	}

}

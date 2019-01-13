package javaSwingui;
import javax.swing.*;
public class mainSwingui {

	public static void main(String[] args) {
		JFrame myframe = new JFrame("Login Form");
		myframe.setSize(350,200);
		myframe.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		JPanel panel = new JPanel();
		myframe.add(panel);
		placeComponents(panel);
		myframe.setVisible(true);
		
	}
	private static void placeComponents(JPanel panel)
	{
		panel.setLayout(null);
		JLabel userlabel = new JLabel("username");
		userlabel.setBounds(10,20,80,25);
		panel.add(userlabel);
		JTextField usertext = new JTextField(20);
		usertext.setBounds(100,20,165,25);
		panel.add(usertext);
		JLabel passwordlabel = new JLabel("password");
		passwordlabel.setBounds(10,50,80,25);
		panel.add(passwordlabel);
		JPasswordField passwordfeild = new JPasswordField(20);
		passwordfeild.setBounds(100, 50, 165, 25);
		panel.add(passwordfeild);
		JButton loginbutton = new JButton("Login");
		loginbutton.setBounds(10, 80, 80, 25);
		panel.add(loginbutton);
		
		
	}

}

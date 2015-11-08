import java.util.Scanner;


public class Ascii {
	
	public static void main(String[] args){
		Scanner scan = new Scanner(System.in);
		
		System.out.println("Enter coords");
		
		String ascii = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ !\"#$%&'()*+,-./0123456789:;<=>?@[\\]^_`{|}~«±–—˜™•”“’‘Œ‹‰ˆ‡†…ƒ€¶²³·¸¹º»¼½¾¿÷";
		Scanner s2;
		
		while(scan.hasNextLine()){
			String t = scan.nextLine();
			s2 = new Scanner(t);
			while(s2.hasNextInt()){
				System.out.print(ascii.charAt(s2.nextInt()-1));
			}
			s2.close();
			System.out.println();
		}
	}
}

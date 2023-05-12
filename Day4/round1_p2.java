// 2022 IUSB Programming Competition
// Round 1 Problem 2
// Credit Card Number
// Solution by Liguo Yu

import java.util.Scanner;

public class round1_p2
{	
    public static void main(String[] args)
    {
    	Scanner input = new Scanner(System.in);
        
        int total = 0;
        String s = input.nextLine();
    	
        for(int i=0; i<16; i++)
        {
            char c = s.charAt(i);
            total = total + Integer.parseInt(String.valueOf(c)); 
        }
        
        if(total%29 ==5) System.out.println("valid");
        else  System.out.println("not valid");	
    }
}
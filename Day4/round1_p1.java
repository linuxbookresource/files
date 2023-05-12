// 2022 IUSB Programming Competition
// Round 1 Problem 1
// Julian Day Number
// Solution by Liguo Yu

import java.util.Scanner;

public class round1_p1
{
    public static void main(String[] args)
    {
        Scanner input = new Scanner(System.in);
        int month = input.nextInt();
        int day = input.nextInt();
        int year = input.nextInt();
        
        int today = Julian(04, 23, 2022); // 2459693
        int result = today - Julian(month, day, year);
        System.out.println(result);
    }
    
    public static int Julian(int month, int day, int year)
    {
        int a = (14-month)/12;
        int y = year + 4800 - a;
        int m = month + 12*a - 3;
        int JDN = day + (153*m+2)/5 + 365*y + y/4 -y/100 + y/400 - 32045;
        
        return JDN;
    }
}


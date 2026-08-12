package poweroffour;


public class Main{
    public static void main (String[] Args){
        int n = 128;
        System.out.println();
       if (isPowerFour(n) == true){
           System.out.println(n + " is power of four");
       }
       else{
           System.out.println(n + " is NOT power of four");
       }
    }

    static boolean isPowerFour(int n){

        // edge cases
        if (n <= 0) return false;
        if (n == 1) return true;

        while (n % 4 == 0){
            n = n /4;
        }

        // if n is 1 we return true
        return n ==1;

    }
}

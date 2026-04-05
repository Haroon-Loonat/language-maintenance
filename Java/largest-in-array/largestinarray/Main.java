package largestinarray;

public class Main {

    public static void main (String[] args){

        int[] arr = {-5, 12, -16, 7, 3};

        int temp = arr[0];

        System.out.println("The values in the araay are as follows:");
        for (int i = 0; i < arr.length; i++){
            System.out.print("Value at index " + i + " is: ");
            System.out.println(arr[i]);
        }

        for (int i = 1; i < arr.length; i++){
            if (arr[i] > temp){
                temp = arr[i];
            }
        }

        System.out.println("The largest value in the array is: " + temp);
    }
}
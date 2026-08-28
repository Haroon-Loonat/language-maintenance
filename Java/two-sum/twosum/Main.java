package twosum;

import java.util.List;
import java.util.ArrayList;

class Main {

public static void main (String[] args){
    // Test

    int[] nums = {2, 3, 3, 4};
    int target = 7;

    int[] test = twoSum(nums, target);
    for (int i = 0; i < test.length; i++){

        System.out.println(test[i]);
    }


}
    public static int[] twoSum(int[] nums, int target) {

        List<Integer> tempL = new ArrayList<>();


        for(int i = 0; i < nums.length; i++) {

            for (int j = i +1; j < nums.length; j++) {
                if (nums[i] + nums[j] == target) {
                    tempL.add(i);
                    tempL.add(j);
                }
            }

        }

        int[] temp = new int[2];
        temp[0] = tempL.get(0);
        temp[1] = tempL.get(1);

        return temp;
    }



}



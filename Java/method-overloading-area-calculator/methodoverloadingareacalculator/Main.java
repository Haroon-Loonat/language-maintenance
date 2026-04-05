package methodoverloadingareacalculator;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {

        System.out.println("Select the shape to calculate area for, 1: Rectangle, 2: Circle, 3: Triangle.");

        Scanner input = new Scanner(System.in);
        int menuRaw = input.nextInt();
        String menuStr = input.nextLine();

        if(menuRaw == 1 ) {
            menuStr = "Rectangle";
        }
        else if (menuRaw == 2) {
            menuStr = "Circle";
        } else if (menuRaw == 3) {
            menuStr = "Triangle";
        }

        System.out.println("You have selected '" + menuStr + "' as the shape to calculate area for.");

        switch(menuRaw){
            case 1:
                input = new Scanner(System.in);
                System.out.println("Enter the length of the Rectangle as a integer.");
                int length = input.nextInt();
                System.out.println("Enter the width of the Rectangle as a integer.");
                int width = input.nextInt();
                System.out.println("The area of the Rectangle is " + area(length, width));
                break;
            case 2:
                input = new Scanner(System.in);
                System.out.println("Enter the radius of the Circle as a double.");
                double radius = input.nextDouble();
                System.out.println("The area of the Circle is " + area(radius));
                break;
            case 3:

            input = new Scanner(System.in);
            System.out.println("Enter the base of the Triangle as an double.");
            double base = input.nextDouble();
            System.out.println("Enter the height of the Triangle as an double.");
            double height = input.nextDouble();
            System.out.println("The area of the Triangle is " + area(base, height));
            break;
            default:
                System.out.println("Invalid input.");

        }

    }

    public static int area(int length, int width){
        return length*width;
    }
    public static double area(double base, double height){
        return (0.5*base*height);
    }
    public static double area(double radius){
        return (Math.PI*radius*radius);
    }
}
using System;
using System.Collections.Generic;

class Program
{
    static void Main()
    {
        string[] strArray = { "Todd", "Susan", "David", "Chezoroth the Bold", "Lucy" };
        Console.WriteLine("Please select the index of the name you'd like to retrieve.");
        int strChoice = Convert.ToInt16(Console.ReadLine());

        bool strAnswer = false;

        for (int i = 0; i < strArray.Length; i++)
        {
            if (strChoice == i)
            {
                strAnswer = true;
                Console.WriteLine(strArray[strChoice]);
            }

        }

        if (strAnswer == false)
        {
            Console.WriteLine("Sorry, that is not a valid index.");
        }

        int[] numArray = { 0, 8, 10, 17, 73, 12 };
        Console.WriteLine("Please select the index of the number you'd like to retrieve.");
        int numChoice = Convert.ToInt16(Console.ReadLine());

        bool numAnswer = false;

        for (int i = 0; i < numArray.Length; i++)
        {
            if (numChoice == i)
            {
                numAnswer = true;
                Console.WriteLine(numArray[numChoice]);
            }

        }

        if (numAnswer == false)
        {
            Console.WriteLine("Sorry, that is not a valid index.");
        }

        List<string> strList = new List<string>();
        strList.Add("Touch");
        strList.Add("Smell");
        strList.Add("Taste");
        strList.Add("Sight");
        strList.Add("Hearing");
        Console.WriteLine("Please select the index of the sense you'd like to retrieve.");
        int listChoice = Convert.ToInt16(Console.ReadLine());

        bool listAnswer = false;

        for (int i = 0; i < strList.Capacity; i++)
        {
            if (listChoice == i)
            {
                listAnswer = true;
                Console.WriteLine(strList[listChoice]);
            }

        }

        if (listAnswer == false)
        {
            Console.WriteLine("Sorry, that is not a valid index.");
        }

        Console.ReadLine();
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UserAge
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello user! Would you be so kind as to tell us your age?");

            bool validAnswer = false;
            int age = 0;
            while (!validAnswer)
            {
                try
                {
                    validAnswer = int.TryParse(Console.ReadLine(), out age);
                    if (age == 0) throw new ZeroException();
                    if (age < 0) throw new NegativeException();
                    else
                    {
                        DateTime currentDateTime = DateTime.Now;
                        int currentYear = currentDateTime.Year;
                        int yearOfBirth = currentYear - age;
                        Console.WriteLine("Thank you for your information!  Incidentally, you were born in {0}.", yearOfBirth);
                        Console.ReadLine();
                    }
                }
                catch (ZeroException)
                {
                    Console.WriteLine("...I don't believe that you're zero years old, sorry. Please try again.");
                    validAnswer = false;
                }
                catch (NegativeException)
                {
                    Console.WriteLine("It's not possible that you're negative years old, please try again.");
                    validAnswer = false;
                }
                catch (Exception)
                {
                    Console.WriteLine("Something you entered caused an error.");
                    Console.WriteLine("Please make sure you've entered an integer that is above zero, with no decimals.");
                    validAnswer = false;
                }
            }
        }
    }
}

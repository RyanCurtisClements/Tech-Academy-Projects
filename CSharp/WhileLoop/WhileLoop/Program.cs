using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WhileLoop
{
    class Program
    {
        static void Main()
        {
            string longWord = "sesquipedalianism";
            Console.WriteLine("Is your favorite word longer than my favorite word, \"sesquipedalianism?\"");

            string userWord = Console.ReadLine();
            bool userLonger = userWord.Length > longWord.Length;

            do
            {

                if (userWord.Length > longWord.Length)
                {
                    Console.WriteLine("Welp, looks like you found a longer word than sesquipedalianism!  Congratulations!");
                    userLonger = true;
                }

                else if (userWord.Length == longWord.Length)
                {
                    Console.WriteLine("Hey, your word is exactly as long as sesquipedialianism.  Unfortunately, it's not longer, please try again!");
                    userWord = Console.ReadLine();
                }

                else if (userWord.Length < longWord.Length)
                {
                    Console.WriteLine("Yeah, that word isn't longer than sesquipedalianism, sorry, try again.");
                    userWord = Console.ReadLine();
                }

            }
            while (!userLonger);

            Console.WriteLine("Oh, by the way, is the first letter of your word also \"s\"? Let's find out.");
            char givenFirst = longWord.ElementAt(0);
            char userFirst = userWord.ElementAt(0);
            bool letterMatch = false;

            while (!letterMatch)
            {
                if (givenFirst != userFirst)
                {
                    Console.WriteLine("Well, looks like our letters don't match.  Ah well.");
                    break;
                }

                else if (givenFirst == userFirst)
                {
                    Console.WriteLine("Hey, look, your word starts with \"s\" too, great!");
                    letterMatch = true;
                }
            }
            Console.ReadLine();
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassesAndMethods
{
    class Program
    {
        static void Main(string[] args)
        {
            Vehicle nissanSentra = new Vehicle();

            Console.WriteLine("Today we're going on a road-trip.  Please enter our average speed " +
                "in miles per hour to discover how far we'll travel today.");
            int speed = Convert.ToInt32(Console.ReadLine());
            int distance = nissanSentra.DistanceFinder(speed);

            Console.WriteLine("With an average speed of " + speed + "mph we will end up traveling " + distance + " miles today!");

            Console.WriteLine("It's important to keep track of our fuel!  If our Nissan Sentra gets " +
                "33 miles to the gallon, how many gallons of gas will we need for our trip?");
            int fuelNeeded = nissanSentra.FuelCalculator(distance);

            Console.WriteLine("In total, our trip will require roughly " + fuelNeeded + " gallons of fuel.");

            Console.WriteLine("Finally, before we set off we should make sure that we've budgeted for " +
                "the fuel we need.  If we know that a gallon of gasoline is $3, how much will we end up paying overall?");
            int fuelCost = nissanSentra.CostFinder(fuelNeeded);

            Console.WriteLine("In total, we will end up spending $" + fuelCost + " on gas.");

            Console.ReadLine();
        }
    }
}

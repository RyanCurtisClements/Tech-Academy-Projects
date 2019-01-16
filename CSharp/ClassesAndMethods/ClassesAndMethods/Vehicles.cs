using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassesAndMethods
{
    public class Vehicle
    {

        public int DistanceFinder(int speed)
        {
            int distance = speed * 8;
            return distance;
        }

        public int FuelCalculator(int distance)
        {
            int fuelNeeded = distance / 33;
            return fuelNeeded;
        }

        public int CostFinder(int fuelNeeded)
        {
            int fuelCost = fuelNeeded * 3;
            return fuelCost;
        }
    }


}

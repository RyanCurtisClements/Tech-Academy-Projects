using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CarlsCarQuotes.Models
{
    public class CarQuote
    {
        public int currentPrice { get; set; }
        public int totalPrice { get; set; }

        public static void CalculateQuote(CarSeeker carSeeker, out int totalPrice)
        {
            int currentPrice = 50;

            if (DateTime.Now.Year - carSeeker.DateOfBirth.Value.Year < 25 && DateTime.Now.Year - carSeeker.DateOfBirth.Value.Year > 18
                && DateTime.Now.Year - carSeeker.DateOfBirth.Value.Year < 100)
            {
                currentPrice += 25;
            }
            if (DateTime.Now.Year - carSeeker.DateOfBirth.Value.Year < 18)
            {
                currentPrice += 100;
            }
            if (DateTime.Now.Year - carSeeker.DateOfBirth.Value.Year > 100)
            {
                currentPrice += 25;
            }

            if (carSeeker.CarYear.Value.Year < 2000)
            {
                currentPrice += 25;
            }
            if (carSeeker.CarYear.Value.Year > 2015)
            {
                currentPrice += 25;
            }

            string lowerCarMake = carSeeker.CarMake.ToLower();
            string lowerCarModel = carSeeker.CarModel.ToLower();
            if (lowerCarMake == "porsche" && lowerCarModel != "911 carrera")
            {
                currentPrice += 25;
            }
            if (lowerCarMake == "porsche" && lowerCarModel == "911 carrera")
            {
                currentPrice += 50;
            }

            for (int i = 0; i < carSeeker.SpeedingTickets; i++)
            {
                if (i != carSeeker.SpeedingTickets)
                {
                    currentPrice += 10;
                }
            }

            if (carSeeker.HasHadDUI == true)
            {
                currentPrice += (currentPrice / 4);
            }

            if (carSeeker.CoverageVsLiability == true)
            {
                currentPrice += (currentPrice / 2);
            }

            totalPrice = currentPrice;
        }
    }
}
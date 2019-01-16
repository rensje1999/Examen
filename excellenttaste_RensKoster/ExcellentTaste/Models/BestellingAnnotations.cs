using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ExcellentTaste.Models
{
    [MetadataType(typeof(BestellingMetaData))]
    public partial class Bestelling
    {


    }

    public class BestellingMetaData
    {
        [Display(Name ="Bestelling")]
        public int bestellingId { get; set; }

        [Display(Name ="Reservering")]
        public int reserveringId { get; set; }

        [Display(Name ="Consumptie")]
        public string consumptieItemCode { get; set; }

        [Display(Name ="Aantal")]
        public int aantal { get; set; }

        [Display(Name = "Prijs")]
        [DataType(DataType.Currency)]
        public decimal prijs { get; set; }

        [Display(Name ="Tijdstip bereiding")]
        public Nullable<System.DateTime> dateTimeBereidingConsumptie { get; set; }

    }

}
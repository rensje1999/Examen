using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ExcellentTaste.Models
{
    [MetadataType(typeof(ConsumptieItemMetaData))]
    public partial class ConsumptieItem
    {

    }

    public class ConsumptieItemMetaData
    {
        [Display(Name="Code")]
        public string consumptieItemCode { get; set; }

        [Display(Name ="Groep")]
        public string consumptieGroepCode { get; set; }

        [Display(Name ="Consumptie naam")]
        public string consumptieItemNaam { get; set; }

        [Display(Name ="Prijs")]
        [DataType(DataType.Currency)]
        public decimal prijs { get; set; }

    }
}
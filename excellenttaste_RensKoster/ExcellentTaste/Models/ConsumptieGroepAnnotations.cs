using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ExcellentTaste.Models
{
    [MetadataType(typeof(ConsumptieGroepMetaData))]
    public partial class ConsumptieGroep
    {

    }

    public class ConsumptieGroepMetaData
    {
        [Display(Name ="Code")]
        public string consumptieGroepCode { get; set; }
        [Display(Name = "Categorie")]
        public string consumptieCode { get; set; }
        [Display(Name ="Groep")]
        public string consumptieGroepNaam { get; set; }

    }
}
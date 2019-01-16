using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ExcellentTaste.Models
{
    [MetadataType(typeof(ConsumptieMetaData))]
    public partial class Consumptie
    {

    }

    public class ConsumptieMetaData
    {
        [Display(Name ="Code")]
        public string consumptieCode { get; set; }
        [Display(Name ="Naam")]
        public string consumptieNaam { get; set; }



        //...
    }

}
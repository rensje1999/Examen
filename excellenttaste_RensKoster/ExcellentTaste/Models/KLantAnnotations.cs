using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ExcellentTaste.Models
{
    [MetadataType(typeof(KlantMetaData))]
    public partial class Klant
    {

        //[Display(Name = "Actief")]
        public bool Actief
        {
            get { return status == 1 ? true : false; }
        }
    }

    public class KlantMetaData
    {
        [Required]
        [Display(Name = "Klant")]
        public string klantNaam { get; set; }

        [Display(Name = "Telefoon")]
        [StringLength(14, MinimumLength = 10)]
        public string telefoon { get; set; }

        [Display(Name = "Aktief")]
        public int status { get; set; }

    }
}
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ExcellentTaste.Models
{
    public class VMReservering
    {
        public List<ExcellentTaste.Models.Klant> klantenLijst { get; }
        public entities2 db = new entities2();
        public VMReservering()
        {
            klantenLijst = db.Klant.OrderBy(k => k.klantNaam).ToList();
        }

        public int klantId { get; set; }
        [Display(Name = "Reserveringsdatum")]
        [DataType(DataType.Date)]
        public System.DateTime datum { get; set; }

        [Display(Name = "Reserveringstijd")]
        [DataType(DataType.Time)]
        public System.TimeSpan tijd { get; set; }
        
        [Display(Name = "Tafel nummer")]
        public int tafel { get; set; }
        
        [Display(Name = "Aantal personen")]
        public int aantalPersonen { get; set; }

    }
}

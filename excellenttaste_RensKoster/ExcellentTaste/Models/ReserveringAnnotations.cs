using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ExcellentTaste.Models
{
    [MetadataType(typeof(GET_TODAYS_RESERVATIONS_ResultMetaData))]
    public partial class GET_TODAYS_RESERVATIONS_Result    {


    }

    public class GET_TODAYS_RESERVATIONS_ResultMetaData
    {
        [Display(Name="Naam klant")]
        public string klantNaam { get; set; }
        [Display(Name = "Telefoon klant")]
        public string telefoon { get; set; }

        [Display(Name = "Tijd")]
        public System.TimeSpan tijd { get; set; }

        [Display(Name = "Tafelnummer")]
        public int tafel { get; set; }
        
        [Display(Name = "Aantal personen")]
        
        public int aantalPersonen { get; set; }
        
        [Display(Name = "Datum toegevoegd")]
        
        public System.DateTime datumToegevoegd { get; set; }

        //...
    }

    [MetadataType(typeof(ReserveringMetaData))]
    public partial class Reservering
    {
        [Display(Name = "Actief")]
        public bool Actief
        {
            get { return status == 1 ? true : false; }
        }

    }

    public class ReserveringMetaData
    {
        [Required]
        [Display(Name ="Klant ID")]
        public int klantId { get; set; }

        public int reserveringId { get; set; }

        [Display(Name ="Datum")]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public System.DateTime datum { get; set; }

        [Display(Name = "Tijd")]
        [DataType(DataType.Time)]
        public System.TimeSpan tijd { get; set; }

        [Display(Name = "Tafelnummer")]
        public int tafel { get; set; }

        [Display(Name = "Aantal personen")]
        public int aantalPersonen { get; set; }

        public int status { get; set; }

        [Display(Name = "Datum toegevoegd")]
        public System.DateTime datumToegevoegd { get; set; }
        public System.DateTime bonDatum { get; set; }

        [Display(Name = "Betaalwijze")]
        public string betalingswijze { get; set; }

        //...
    }
}
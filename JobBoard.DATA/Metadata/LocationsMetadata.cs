using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobBoard.DATA
{
    public class LocationsMetadata
    {
        [Display(Name = "Location ID")]
        public int LocationId { get; set; }

        [Required]
        [Display(Name = "Store Number")]
        [StringLength(10, ErrorMessage = "Maximum length is 10 characters.")]
        public string StoreNumber { get; set; }

        [Required]
        [StringLength(50, ErrorMessage = "Maximum length is 50 characters.")]
        public string City { get; set; }

        [Required]
        [StringLength(2, ErrorMessage = "Maximum length is 2 characters.")]
        public string State { get; set; }

        [Display(Name = "Manager ID")]
        [StringLength(128, ErrorMessage = "Maximum length is 128 characters.")]
        public string ManagerId { get; set; }
    }

    [MetadataType(typeof(LocationsMetadata))]
    public partial class Locations { }
}

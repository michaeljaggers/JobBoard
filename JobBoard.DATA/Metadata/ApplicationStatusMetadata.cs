using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobBoard.DATA
{
    public class ApplicationStatusMetadata
    {
        [Display(Name = "Application Status ID")]
        public int ApplicationStatusId { get; set; }

        [Required]
        [Display(Name = "Status Name")]
        [StringLength(50, ErrorMessage = "Maximum length is 50 characters.")]
        public string StatusName { get; set; }

        [Display(Name = "Status Description")]
        [StringLength(250, ErrorMessage = "Maximum length is 250 characters.")]
        public string StatusDescription { get; set; }
    }

    [MetadataType(typeof(ApplicationStatusMetadata))]
    public partial class ApplicationStatus { }
}

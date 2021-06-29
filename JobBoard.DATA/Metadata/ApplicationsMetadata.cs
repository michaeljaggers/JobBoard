using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobBoard.DATA
{
    public class ApplicationsMetadata
    {
        [Display(Name = "Application ID")]
        public int ApplicationId { get; set; }

        [Required]
        [Display(Name = "Open Position ID")]
        public int OpenPositionId { get; set; }

        [Required]
        [Display(Name = "User ID")]
        public string UserId { get; set; }

        [Required]
        [Display(Name = "Application Date")]
        public System.DateTime ApplicationDate { get; set; }

        [Display(Name = "Manager Notes")]
        [StringLength(2000, ErrorMessage = "Maximum length is 2000 characters.")]
        public string ManagerNotes { get; set; }

        [Required]
        [Display(Name = "Application Status")]
        public int ApplicationStatus { get; set; }

        [Required]
        [Display(Name = "Resume")]
        public string ResumeFilename { get; set; }
    }

    [MetadataType(typeof(ApplicationsMetadata))]
    public partial class Applications { }
}

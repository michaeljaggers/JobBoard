using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobBoard.DATA
{
    public class UserDetailsMetadata
    {
        [Required]
        [Display(Name = "User ID")]
        public string UserId { get; set; }

        [Required]
        [Display(Name = "First Name")]
        public string FirstName { get; set; }

        [Required]
        [Display(Name = "Last Name")]
        public string LastName { get; set; }

        [Display(Name = "Resume")]
        public string ResumeFilename { get; set; }
    }

    [MetadataType(typeof(UserDetailsMetadata))]
    public partial class UserDetails { } 
}

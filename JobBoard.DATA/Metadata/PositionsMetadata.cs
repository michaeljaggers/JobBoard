using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobBoard.DATA
{
    public class PositionsMetadata
    {
        [Display(Name = "Position ID")]
        public int PositionId { get; set; }

        [Required]
        [StringLength(50, ErrorMessage = "Maximum length is 50 characters.")]
        public string Title { get; set; }

        [Display(Name = "Job Description")]
        [UIHint("MultilineText")]
        public string JobDescription { get; set; }
    }

    [MetadataType(typeof(PositionsMetadata))]
    public partial class Positions { }
}

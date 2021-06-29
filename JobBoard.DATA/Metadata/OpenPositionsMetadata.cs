using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobBoard.DATA
{
    public class OpenPositionsMetadata
    {
        [Display(Name = "Open Position ID")]
        public int OpenPositionId { get; set; }

        [Required]
        [Display(Name = "Position ID")]
        public int PositionId { get; set; }

        [Required]
        [Display(Name = "Location ID")]
        public int LocationId { get; set; }
    }

    [MetadataType(typeof(OpenPositionsMetadata))]
    public partial class OpenPositions { }
}

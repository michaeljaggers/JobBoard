using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobBoard.DATA
{
    class AspNetUserMetadata
    {
        [Display(Name = "Username")]
        public string UserName { get; set; }
    }

    [MetadataType(typeof(AspNetUserMetadata))]
    public partial class AspNetUser { }
}

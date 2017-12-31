using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SunScopeBOL.Entities
{
   public class EmailTemplate
    {                
        public EmailTemplate()
        {
            this.Mail_To = new List<string>();
            this.Mail_bcc = new List<string>();
            this.Mail_Cc = new List<string>();
        }
        public string Mail_Purpose { get; set; }        
        public string Mail_Subject { get; set; }        
        public string Mail_Content { get; set; }        
        public string Mail_From { get; set; }        
        public List<string> Mail_To { get; set; }        
        public List<string> Mail_bcc { get; set; }        
        public List<string> Mail_Cc { get; set; }  
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SunScopeBOL.Entities
{
    public class Enquiry
    {
        public int EnquiryId { get; set; }
        public string Adderess { get; set; }
        public string PropertyType { get; set; }
        public string RoofType { get; set; }
        public string RoofSize { get; set; }
        public string MonthlyElectricBill { get; set; }
        public string Email { get; set; }
        public string Mobile { get; set; }
        public string Landline { get; set; }
        public string CallTime { get; set; }
    }
}

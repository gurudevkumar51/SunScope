using SunScopeBOL.Entities;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SunScopeDAL.DataAccess
{
    public class LeadRepository : BaseRepository
    {
        public Boolean AddNewEnquiry(Enquiry enq, out string msg)
        {
            msg = "";
            try
            {
                SqlParameter[] parameters =
                {
                        new SqlParameter("@PropertyType",enq.PropertyType),
                        new SqlParameter("@MonthlyElectricBill",enq.MonthlyElectricBill),
                        new SqlParameter("@LeadAddress",enq.Adderess),
                        new SqlParameter("@CustEmail",enq.Email),
                        new SqlParameter("@CustMobile",enq.Mobile),
                        new SqlParameter("@CustLandline",enq.Landline),
                        new SqlParameter("@CallTime",enq.CallTime),
                        new SqlParameter("@RoofType",enq.RoofType),
                        new SqlParameter("@RoofSize",enq.RoofSize),
                        new SqlParameter("@Type","B")
                    };
                var flag = base.ExecuteNonQuery("Usp_Manage_Lead", parameters);
                msg = flag > 0 ? "Enquiry submitted successfully" : "Server Problem try again later";
                return flag > 0 ? true : false;
            }
            catch (Exception ex)
            {
                msg = "Unable to submit enquiry" + ex.Message;
                return false;
            }
        }
    }
}

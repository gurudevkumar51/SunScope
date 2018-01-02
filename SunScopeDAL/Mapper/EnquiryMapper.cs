using SunScopeBOL.Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SunScopeDAL.Mapper
{
    class EnquiryMapper
    {
        public List<Enquiry> Map(IDataReader reader)
        {
            List<Enquiry> Enqs = new List<Enquiry>();
            while (reader.Read())
            {
                Enquiry enq = new Enquiry();
                enq.EnquiryId= reader["EnquiryID"] == DBNull.Value ? 0 : Convert.ToInt32(reader["EnquiryID"].ToString());
                enq.Adderess= reader["LeadAddress"] == DBNull.Value ? "" : reader["LeadAddress"].ToString();
                enq.Email= reader["CustEmail"] == DBNull.Value ? "" : reader["CustEmail"].ToString();
                enq.Mobile= reader["CustMobile"] == DBNull.Value ? "" : reader["CustMobile"].ToString(); 
                enq.Landline= reader["CustLandline"] == DBNull.Value ? "" : reader["CustLandline"].ToString();
                enq.CallTime= reader["CallTime"] == DBNull.Value ? "" : reader["CallTime"].ToString();
                enq.PropertyType= reader["PropertyType"] == DBNull.Value ? "" : reader["PropertyType"].ToString();
                enq.RoofSize= reader["RoofSize"] == DBNull.Value ? "" : reader["RoofSize"].ToString();
                enq.RoofType= reader["RoofType"] == DBNull.Value ? "" : reader["RoofType"].ToString();
                enq.MonthlyElectricBill = reader["MonthlyElectricBill"] == DBNull.Value ? "" : reader["MonthlyElectricBill"].ToString();

                Enqs.Add(enq);
            }
            return Enqs;
        }
    }
}

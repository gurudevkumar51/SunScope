using SunScopeBLL.LeadBLL;
using SunScopeBOL.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SunScopeRFQ.CustomerContent
{
    public partial class NewEnquiry : System.Web.UI.Page
    {
        private LeadBusiness Db = new LeadBusiness();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnEnqSubmit_Click(object sender, EventArgs e)
        {
            Enquiry enq = new Enquiry();
            enq.Adderess = TBEnquiryLocation.Value.Trim();
            enq.PropertyType = RdbPropType.SelectedItem.Text.Trim();
            enq.MonthlyElectricBill = TbBill.Value.Trim();
            enq.RoofSize = TbRoofSize.Value.Trim();
            enq.RoofType = TBRoofType.Value.Trim();
            enq.Email = TbEmail.Value.Trim();
            enq.Mobile = TbMobile.Value.Trim();
            enq.Landline = TbLandline.Value.Trim();
            enq.CallTime = TbCallTime.Value.Trim();
            string msg = string.Empty;
            var flag = Db.SubmitEnquiry(enq, out msg);
            if (flag)
            {
                string jsFunc = "formSubmitStatus('" + msg + "','success')";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", jsFunc, true);
            }
            else
            {
                string jsFunc = "formSubmitStatus('" + msg + "','error')";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", jsFunc, true);
            }
        }
    }
}
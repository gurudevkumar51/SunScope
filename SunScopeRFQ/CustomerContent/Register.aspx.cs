using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SunScopeBOL.Entities;

namespace SunScopeRFQ.CustomerContent
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
         SunScopeBOL.Entities.Customer cust = new SunScopeBOL.Entities.Customer();
            cust.Name = TBName.Text.Trim();
            cust.Email = TBemail.Value.Trim();
            cust.Mobile = TBPhone.Value.Trim();
            cust.Location = TBLocation.Value.Trim();
            cust.Password = TBPwd.Value.Trim();
        }
    }
}
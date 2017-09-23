using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestionAssurance_ASP
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DossierRNRparAssure W = new DossierRNRparAssure();
            int R = 0;
            int NonR = 0;
            W.GetNombreDossierAssureNonAssureParAssure(TextBox1.Text,ref R,ref NonR);
            Label3.Text = R.ToString();
            Label5.Text = NonR.ToString();


        }
    }
}
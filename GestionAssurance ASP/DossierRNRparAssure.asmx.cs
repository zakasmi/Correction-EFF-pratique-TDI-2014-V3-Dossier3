using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace GestionAssurance_ASP
{
    /// <summary>
    /// Summary description for DossierRNRparAssure
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class DossierRNRparAssure : System.Web.Services.WebService
    {

        [WebMethod]
        public void GetNombreDossierAssureNonAssureParAssure(string Assure,ref int Rembou,ref int NonRembou)
        {

            SqlCommand cmd = new SqlCommand("select count(*) from Dossier where Matricule='"+Assure+ "' and (Montant_Remboursement <= '0' or Montant_Remboursement is null)  and year(DateDepot)=year(getdate())", Provider.cnx);
            Provider.cnx.Open();
            NonRembou = int.Parse(cmd.ExecuteScalar().ToString());
            Provider.cnx.Close();
            cmd = new SqlCommand("select count(*) from Dossier where Matricule='" + Assure + "' and Montant_Remboursement >= '0' and year(DateDepot)=year(getdate()) ", Provider.cnx);
            Provider.cnx.Open();
            Rembou = int.Parse(cmd.ExecuteScalar().ToString());
            Provider.cnx.Close();
            
        }
    }
}

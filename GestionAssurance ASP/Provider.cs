using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GestionAssurance_ASP
{
    class Provider
    {
        public static SqlConnection cnx = new SqlConnection(@"Data Source=.\sqlexpress;Initial Catalog=GestAssurance;Integrated Security=True");
        public static DataSet ds = new DataSet();
        public static void Remplire(string req, string table)
        {
            using (SqlDataAdapter da = new SqlDataAdapter(req,cnx))
            {
                if (ds.Tables.Contains(table)) { ds.Tables[table].Rows.Clear(); }
                da.Fill(ds,table);
                ds.Tables[table].PrimaryKey = new DataColumn[] { ds.Tables[table].Columns[0] };
            }
            
        }
        public static void Enregistrer(string req, string table)
        {
            using (SqlDataAdapter da = new SqlDataAdapter(req, cnx))
            {
                SqlCommandBuilder cb = new SqlCommandBuilder(da);
                da.Update(ds,table);
            }
        }
        }
}

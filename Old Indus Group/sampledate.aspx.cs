using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class sampledate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DateTime d = new DateTime();
 

        d = DateTime.UtcNow.AddHours(-5);
        l.Text = "USa estern Time  - 5hours --" + Convert.ToString(d); Convert.ToString(d);

        d = DateTime.UtcNow.AddMinutes(330);
        l1.Text =  "India + 5.30 hours --" + Convert.ToString(d); Convert.ToString(d);

        d = DateTime.UtcNow;
        l2.Text = "UTC Time --" + Convert.ToString(d);

        d = DateTime.Now;
        l3.Text = "Now Time  --" + Convert.ToString(d);
    }
}
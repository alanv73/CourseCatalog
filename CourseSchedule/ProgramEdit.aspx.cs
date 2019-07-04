using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CourseSchedule
{
    public partial class ProgramEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gridPrograms_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Delete"))
            {
                gridPrograms.SelectedIndex = -1;
                dvProgram.DataBind();
            }
        }

        protected void dvProgram_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            gridPrograms.DataBind();
        }

        protected void addNew_Click(object sender, EventArgs e)
        {
            dvProgram.ChangeMode(DetailsViewMode.Insert);
        }

        protected void dvProgram_ItemInserting(object sender, DetailsViewInsertEventArgs e)
        {
            Page.Validate();
            if (!Page.IsValid)
            {
                e.Cancel = true;

            }
        }

        protected void dvProgram_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
        {
            Page.Validate();
            if (!Page.IsValid)
            {
                e.Cancel = true;

            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CourseSchedule
{
    public partial class TeacherIndex : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnNewTeacher_Click(object sender, EventArgs e)
        {
            Session["SelectedTeacher"] = -1;
            formViewTeacher.ChangeMode(FormViewMode.Insert);
        }

        protected void formViewTeacher_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            refreshGridView();
        }

        protected void formViewTeacher_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            refreshGridView();
        }

        protected void formViewTeacher_ItemDeleted(object sender, FormViewDeletedEventArgs e)
        {
            refreshGridView();
        }

        private void refreshGridView()
        {
            gridTeachers.DataBind();
            gridTeachers.SelectedIndex = -1;
        }

        protected void gridTeachers_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(
                    gridTeachers, "Select$" + e.Row.RowIndex);

                e.Row.ToolTip = "Click to select this row.";
            }
        }

        protected void formViewTeacher_ItemInserting(object sender, FormViewInsertEventArgs e)
        {
            Page.Validate();
            if (!Page.IsValid)
            {
                e.Cancel = true;

            }
        }

        protected void formViewTeacher_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {
            Page.Validate();
            if (!Page.IsValid)
            {
                e.Cancel = true;

            }
        }
    }
}
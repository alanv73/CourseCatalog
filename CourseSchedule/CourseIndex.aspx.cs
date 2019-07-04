using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CourseSchedule
{
    public partial class CourseIndex : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["course_code"] != null)
                {
                    ddlProgram.SelectedValue = Request.QueryString["course_code"];
                    Session["course_code"] = Request.QueryString["course_code"];
                }
                else
                {
                    ddlProgram.SelectedIndex = -1;
                }
            }
        }

        protected void gridCourses_SelectedIndexChanged(object sender, EventArgs e)
        {
            var data = gridCourses.SelectedDataKey.Value;
            Session["SelectedCourse"] = data;
            Session["course_code"] = ddlProgram.SelectedValue;
            Response.Redirect("CourseEdit.aspx?id=" + gridCourses.SelectedDataKey.Value);

        }

        protected void gridCourses_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(
                    gridCourses, "Select$" + e.Row.RowIndex);

                e.Row.ToolTip = "Click to select this row.";
            }

        }

        protected void btnNewCourse_Click(object sender, EventArgs e)
        {
            Session["SelectedCourse"] = -1;
            Session["course_code"] = ddlProgram.SelectedValue;
            Response.Redirect("CourseEdit.aspx");
        }

        protected void ddlProgram_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Response.Write(ddlProgram.SelectedValue);
        }
    }
}
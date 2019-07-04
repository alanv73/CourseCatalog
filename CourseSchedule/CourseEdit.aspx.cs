using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CourseSchedule
{
    public partial class CourseEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] == null )
            {
                FormView1.ChangeMode(FormViewMode.Insert);
            }

            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    SqlDataSource1.SelectCommand = "SELECT * from courses where id = " + Request.QueryString["id"];
                    SqlDataSource1.DataBind();
                    FormView1.DataBind();
                }
            }
            else
            {
                Page.Validate();
                if (!Page.IsValid)
                {
                    return;
                }
            }
        }

        protected void InsertCancelButton_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] == null)
            {
                Response.Redirect("CourseIndex.aspx?course_code=" + Session["course_code"]);
            }
        }

        protected void LinkButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("CourseIndex.aspx?course_code=" + Session["course_code"]);
        }

        protected void FormView1_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            SqlDataSource1.SelectCommand = "Select * from [courses]";
            SqlDataSource1.DataBind();
            FormView1.DataBind();
            DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            FormView1.PageIndex = dv.Count - 1;
        }

        protected void FormView1_ItemDeleted(object sender, FormViewDeletedEventArgs e)
        {
            Response.Redirect("CourseIndex.aspx");
        }

        protected void FormView1_ItemInserting(object sender, FormViewInsertEventArgs e)
        {
            Page.Validate();
            if (!Page.IsValid)
            {
                e.Cancel=true;
                
            }
        }

        protected void FormView1_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {
            Page.Validate();
            if (!Page.IsValid)
            {
                e.Cancel = true;

            }
        }
    }
}
<%@ Page Title="" Language="C#" MasterPageFile="~/CSMaster.Master" AutoEventWireup="true" CodeBehind="CourseIndex.aspx.cs" Inherits="CourseSchedule.CourseIndex" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ContentPlaceHolderID="H1ContentPlaceHolder" ID="Content4" runat="server">
    Course Catalog
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="sqlPrograms" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\CourseSchedule.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [programs] ORDER BY [program]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="sqlCourses" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\CourseSchedule.mdf;Integrated Security=True;Connect Timeout=30" 
        ProviderName="System.Data.SqlClient" 
        SelectCommand="SELECT * FROM [courses] WHERE ([course_code] like CONCAT(RTRIM(@course_code), '%')) ORDER BY [course_code]" DeleteCommand="DELETE FROM courses WHERE (Id = @Id)">
        <DeleteParameters>
            <asp:Parameter Name="Id" />
        </DeleteParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlProgram" DefaultValue="-1" Name="course_code" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <div class="ddwrapper">
        <asp:DropDownList ID="ddlProgram" AppendDataBoundItems="true" CssClass="bbdd" OnSelectedIndexChanged="ddlProgram_SelectedIndexChanged" AutoPostBack="true" runat="server" DataSourceID="sqlPrograms" DataTextField="program" DataValueField="code" Height="29px" Width="306px">
            <asp:ListItem Value="%">-- All Programs --</asp:ListItem>
        </asp:DropDownList>
    </div>
    <figure>
        <asp:GridView CssClass="Grid" ID="gridCourses" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="sqlCourses" 
            PageSize="4" AlternatingRowStyle-CssClass="alt" PagerStyle-CssClass="pgr" HorizontalAlign="Center" DataKeyNames="Id" 
            OnSelectedIndexChanged="gridCourses_SelectedIndexChanged" >
            <AlternatingRowStyle CssClass="alt"></AlternatingRowStyle>
            <Columns>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select" Text="Select"></asp:LinkButton><br />
                        <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('Are you sure you want to delete?'); " Text="Delete"></asp:LinkButton>
                    </ItemTemplate>
                    <ControlStyle CssClass="selectbutton btn btn-outline-secondary btn-sm" />
                    <ItemStyle VerticalAlign="Top" />
                </asp:TemplateField>
                <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" ItemStyle-VerticalAlign="Top" InsertVisible="False" ReadOnly="True" Visible="False" />
                <asp:BoundField DataField="course_code" HeaderText="Code" SortExpression="course_code" ItemStyle-VerticalAlign="Top" />
                <asp:BoundField DataField="course_title" HeaderText="Course Name" ItemStyle-Wrap="false" SortExpression="course_title" ItemStyle-VerticalAlign="Top" />
                <asp:TemplateField HeaderText="Description" SortExpression="Description" ItemStyle-VerticalAlign="Top" >
                    <ItemTemplate>
                        <div class="coursedescription">
                            <%# Eval("Description") %>
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Credits" SortExpression="credits" ItemStyle-VerticalAlign="Top" >
                    <ItemTemplate>
                        <asp:Label ID="creditsLabel" runat="server" Text='<%# Bind("credits","{0:F1}") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="clock_hours" HeaderText="Clock Hours" SortExpression="clock_hours" ItemStyle-VerticalAlign="Top" />
            </Columns>
            <PagerStyle CssClass="pgr"></PagerStyle>
        </asp:GridView>
        <figcaption class="captions" style="text-align: center;">To View or Edit Course Details click Select</figcaption>
    </figure>
    <div class="cmd text-center">
        <asp:Button ID="btnNewCourse" CssClass="btn btn-outline-secondary btnlg" OnClick="btnNewCourse_Click" runat="server" Text="Add New Course" />
    </div>
</asp:Content>

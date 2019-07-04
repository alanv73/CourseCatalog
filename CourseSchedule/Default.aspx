<%@ Page Title="" Language="C#" MasterPageFile="~/CSMaster.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CourseSchedule.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="H1ContentPlaceHolder" runat="server">
    South Hills Course Catalog
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="overlay">
		<div class="description">
            <h2>Program Index</h2>
            <h6 ID="lblInstructions" class="chalk-directions">Select a program to view available courses</h6><br />
            <asp:SqlDataSource ID="sqlPrograms" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\CourseSchedule.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [programs] ORDER BY [program]" DeleteCommand="DELETE FROM [programs] WHERE [Id] = @Id" InsertCommand="INSERT INTO [programs] ([code], [program]) VALUES (@code, @program)" UpdateCommand="UPDATE [programs] SET [code] = @code, [program] = @program WHERE [Id] = @Id">
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="code" Type="String" />
                    <asp:Parameter Name="program" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="code" Type="String" />
                    <asp:Parameter Name="program" Type="String" />
                    <asp:Parameter Name="Id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:DataList CssClass="chalk courseindex" ID="DataList1" runat="server" DataKeyField="Id" DataSourceID="sqlPrograms" RepeatColumns="2" ShowFooter="False" ShowHeader="False">
                <ItemTemplate>
                    <asp:HyperLink Visible="false" ID="HyperLink1" runat="server" NavigateUrl='<%# "CourseIndex.aspx?course_code=" + Eval("code") %>' Text='<%# Eval("code") %>'></asp:HyperLink>
                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# "CourseIndex.aspx?course_code=" + Eval("code") %>' Text='<%# Eval("program") %>'></asp:HyperLink>
                </ItemTemplate>
            </asp:DataList>
        </div>
	</div>
    <div class="div-button">
        <a class="btn btn-basic btn-new-program" href="ProgramEdit.aspx">Add/Edit Programs</a><br />
    </div>
</asp:Content>

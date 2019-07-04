<%@ Page Title="" Language="C#" MasterPageFile="~/CSMaster.Master" AutoEventWireup="true" CodeBehind="TeacherIndex.aspx.cs" Inherits="CourseSchedule.TeacherIndex" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="H1ContentPlaceHolder" runat="server">
    Teacher List
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container features teachers">
        <div class="row">
            <div class="teachercontent col">
                <asp:SqlDataSource ID="sqlTeachers" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\CourseSchedule.mdf;Integrated Security=True;Connect Timeout=30" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [instructors]" DeleteCommand="DELETE FROM [instructors] WHERE [Id] = @Id" InsertCommand="INSERT INTO [instructors] ([fname], [lname], [email]) VALUES (@fname, @lname, @email)" UpdateCommand="UPDATE [instructors] SET [fname] = @fname, [lname] = @lname, [email] = @email WHERE [Id] = @Id">
                    <DeleteParameters>
                        <asp:Parameter Name="Id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="fname" Type="String" />
                        <asp:Parameter Name="lname" Type="String" />
                        <asp:Parameter Name="email" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="fname" Type="String" />
                        <asp:Parameter Name="lname" Type="String" />
                        <asp:Parameter Name="email" Type="String" />
                        <asp:Parameter Name="Id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="gridTeachers" CssClass="Grid teacherGrid" runat="server" AllowPaging="True" PageSize="5" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="sqlTeachers" OnRowDataBound="gridTeachers_RowDataBound"
                     AlternatingRowStyle-CssClass="alt" PagerStyle-CssClass="pgr" HorizontalAlign="Center">
                    <Columns>
                        <asp:CommandField ControlStyle-CssClass="selectbutton btn btn-outline-secondary btn-sm" ShowSelectButton="True" ButtonType="Link" />
                        <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" Visible="False" />
                        <asp:BoundField DataField="fname" HeaderText="First Name" SortExpression="fname" />
                        <asp:BoundField DataField="lname" HeaderText="Last Name" SortExpression="lname" />
                        <asp:BoundField DataField="email" HeaderText="eMail Address" SortExpression="email" />
                    </Columns>
                </asp:GridView>
            </div>
            <div class="chalk teacherdetail col">
                <asp:SqlDataSource ID="sqlTeacherDetail" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\CourseSchedule.mdf;Integrated Security=True;Connect Timeout=30" DeleteCommand="DELETE FROM [instructors] WHERE [Id] = @Id" InsertCommand="INSERT INTO [instructors] ([fname], [lname], [email]) VALUES (@fname, @lname, @email)" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [instructors] WHERE ([Id] = @Id)" UpdateCommand="UPDATE [instructors] SET [fname] = @fname, [lname] = @lname, [email] = @email WHERE [Id] = @Id">
                    <DeleteParameters>
                        <asp:Parameter Name="Id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="fname" Type="String" />
                        <asp:Parameter Name="lname" Type="String" />
                        <asp:Parameter Name="email" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="gridTeachers" DefaultValue="-1" Name="Id" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="fname" Type="String" />
                        <asp:Parameter Name="lname" Type="String" />
                        <asp:Parameter Name="email" Type="String" />
                        <asp:Parameter Name="Id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                
                <asp:FormView class="teacherEditForm detailform" ID="formViewTeacher" runat="server" DataKeyNames="Id" DataSourceID="sqlTeacherDetail" 
                    OnItemUpdated="formViewTeacher_ItemUpdated" OnItemInserting="formViewTeacher_ItemInserting" OnItemUpdating="formViewTeacher_ItemUpdating" OnItemInserted="formViewTeacher_ItemInserted" OnItemDeleted="formViewTeacher_ItemDeleted">
                    <EditItemTemplate>
                        <span class="ecdata cdata">First Name:</span>
                        <asp:TextBox CssClass="form-tb cdata" ID="fnameTextBox" runat="server" Text='<%# Bind("fname") %>' /><br />
                        <asp:RequiredFieldValidator CssClass="cdata" Display="Dynamic" ID="rfvFnameEdit" ControlToValidate="fnameTextBox" SetFocusOnError="true" runat="server" ErrorMessage="Please Enter First Name" ForeColor="Red"><span class="ecdata">&nbsp</span>Please Enter First Name<br /></asp:RequiredFieldValidator>
                        <span class="ecdata cdata tLabel">Last Name:</span>
                        <asp:TextBox CssClass="form-tb cdata" ID="lnameTextBox" runat="server" Text='<%# Bind("lname") %>' /><br />
                        <asp:RequiredFieldValidator CssClass="cdata" Display="Dynamic" ID="rfvLnameEdit" ControlToValidate="lnameTextBox" SetFocusOnError="true" runat="server" ErrorMessage="Please Enter Last Name" ForeColor="Red"><span class="ecdata">&nbsp</span>Please Enter Last Name<br /></asp:RequiredFieldValidator>
                        <span class="ecdata cdata">eMail Address:</span>
                        <asp:TextBox CssClass="form-tb cdata" ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' /><br />
                        <asp:RequiredFieldValidator CssClass="cdata" Display="Dynamic" ID="rfvEmailEdit" ControlToValidate="emailTextBox" SetFocusOnError="true" runat="server" ErrorMessage="Please Enter an eMail Address" ForeColor="Red"><span class="ecdata">&nbsp</span>Please Enter an eMail Address<br /></asp:RequiredFieldValidator>
                        <asp:LinkButton CssClass="btn btn-outline-secondary btn-sm" ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                        &nbsp;<asp:LinkButton CssClass="btn btn-outline-secondary btn-sm" ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </EditItemTemplate>
                    <HeaderTemplate>
                        Teacher Details
                    </HeaderTemplate>
                    <InsertItemTemplate>
                        <span class="ecdata cdata">First Name:</span>
                        <asp:TextBox CssClass="form-tb cdata" ID="fnameTextBox" runat="server" Text='<%# Bind("fname") %>' /><br />
                        <asp:RequiredFieldValidator CssClass="cdata" Display="Dynamic" ID="rfvFnameEdit" ControlToValidate="fnameTextBox" SetFocusOnError="true" runat="server" ErrorMessage="Please Enter First Name" ForeColor="Red"><span class="ecdata">&nbsp</span>Please Enter First Name<br /></asp:RequiredFieldValidator>
                        <span class="ecdata cdata">Last Name:</span>
                        <asp:TextBox CssClass="form-tb cdata" ID="lnameTextBox" runat="server" Text='<%# Bind("lname") %>' /><br />
                        <asp:RequiredFieldValidator CssClass="cdata" Display="Dynamic" ID="rfvLnameEdit" ControlToValidate="lnameTextBox" SetFocusOnError="true" runat="server" ErrorMessage="Please Enter Last Name" ForeColor="Red"><span class="ecdata">&nbsp</span>Please Enter Last Name<br /></asp:RequiredFieldValidator>
                        <span class="ecdata cdata">eMail Address:</span>
                        <asp:TextBox CssClass="form-tb cdata" ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' /><br />
                        <asp:RequiredFieldValidator CssClass="cdata" Display="Dynamic" ID="rfvEmailEdit" ControlToValidate="emailTextBox" SetFocusOnError="true" runat="server" ErrorMessage="Please Enter an eMail Address" ForeColor="Red"><span class="ecdata">&nbsp</span>Please Enter an eMail Address<br /></asp:RequiredFieldValidator>
                        <asp:LinkButton CssClass="btn btn-outline-secondary btn-sm" ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                        &nbsp;<asp:LinkButton CssClass="btn btn-outline-secondary btn-sm" ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <span class="ecdata cdata">First Name:</span>
                        <asp:Label CssClass="cdata" ID="fnameLabel" runat="server" Text='<%# Bind("fname") %>' /><br />
                        <span class="ecdata cdata">Last Name:</span>
                        <asp:Label CssClass="cdata" ID="lnameLabel" runat="server" Text='<%# Bind("lname") %>' /><br />
                        <span class="ecdata cdata">eMail Address:</span>
                        <asp:Label CssClass="cdata" ID="emailLabel" runat="server" Text='<%# Bind("email") %>' /><br />
                        <asp:LinkButton CssClass="btn btn-outline-secondary btn-sm" ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                        &nbsp;<asp:LinkButton CssClass="btn btn-outline-secondary btn-sm" ID="DeleteButton" runat="server" CausesValidation="False" OnClientClick="return confirm('Are you sure you want to delete?'); " CommandName="Delete" Text="Delete" />
                    </ItemTemplate>
                </asp:FormView>
            </div>
        </div>
        <div class="cmd text-center btnteacherinsert">
            <asp:Button ID="btnNewTeacher" CssClass="btn btn-outline-secondary btnlg" OnClick="btnNewTeacher_Click" runat="server" Text="Add New Teacher" />
        </div>
    </div>
</asp:Content>

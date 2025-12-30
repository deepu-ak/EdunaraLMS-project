<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="EdunaraProject.Admin" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <title>Admin Dashboard - Edunara</title>
    <style>
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; margin: 0; padding: 0; background: #f4f7f6; }
        .wrapper { display: flex; min-height: 100vh; }
        
        /* Sidebar */
        .sidebar { width: 260px; background: #2c3e50; color: white; padding: 20px; flex-shrink: 0; }
        .sidebar h2 { color: #e74c3c; font-size: 22px; margin-bottom: 30px; text-align: center; border-bottom: 1px solid #34495e; padding-bottom: 10px; }
        .sidebar a { display: block; color: #bdc3c7; padding: 12px; text-decoration: none; margin-bottom: 5px; border-radius: 4px; transition: 0.3s; }
        .sidebar a:hover { background: #34495e; color: white; }
        
        /* Main Content */
        .main-content { flex-grow: 1; padding: 40px; background: #f4f7f6; }
        .header-box { margin-bottom: 30px; }
        .card { background: white; padding: 25px; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.1); margin-bottom: 30px; }
        
        .form-group { margin-bottom: 15px; }
        .form-group label { display: block; margin-bottom: 5px; font-weight: bold; }
        .input-field { width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 4px; box-sizing: border-box; }
        
        .btn-add { background: #e74c3c; color: white; border: none; padding: 12px 25px; cursor: pointer; border-radius: 4px; font-weight: bold; transition: 0.3s; }
        .btn-add:hover { background: #c0392b; }

        /* Table Styling */
        .grid-style { width: 100%; border-collapse: collapse; background: white; margin-top: 20px; }
        .grid-style th { background: #2c3e50; color: white; padding: 12px; text-align: left; }
        .grid-style td { padding: 12px; border-bottom: 1px solid #eee; }
        .msg-label { display: block; margin-top: 10px; font-weight: bold; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="wrapper">
            <div class="sidebar">
                <h2>EDUNARA ADMIN</h2>
                <a href="Admin.aspx">Manage Courses</a>
                <a href="ManageUsers.aspx">Manage Users</a>
                <a href="ManageInquiries.aspx">Manage Inquiries</a>
                <a href="Course.aspx" target="_blank">View Live Site</a>
                <hr style="border: 0.5px solid #34495e; margin: 20px 0;" />
                <asp:LinkButton ID="btnLogout" runat="server" OnClick="btnLogout_Click" ForeColor="#e74c3c" Font-Bold="true">Logout</asp:LinkButton>
            </div>

            <div class="main-content">
                <div class="header-box">
                    <h1>Course Management</h1>
                    <p>Add or remove learning resources from the database.</p>
                </div>

                <div class="card">
                    <h3>Create New Course</h3>
                    <div class="form-group">
                        <label>Course Title</label>
                        <asp:TextBox ID="txtTitle" runat="server" CssClass="input-field" placeholder="e.g., Intro to Web Development"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Description</label>
                        <asp:TextBox ID="txtDesc" runat="server" TextMode="MultiLine" Rows="4" CssClass="input-field" placeholder="What will students learn?"></asp:TextBox>
                    </div>
                    <asp:Button ID="btnAdd" runat="server" Text="Publish Course" CssClass="btn-add" OnClick="btnAdd_Click" />
                    <asp:Label ID="lblMsg" runat="server" CssClass="msg-label"></asp:Label>
                </div>

                <div class="card">
                    <h3>Active Course List</h3>
                    <asp:GridView ID="gvCourses" runat="server" CssClass="grid-style" AutoGenerateColumns="False" 
                        DataKeyNames="id" OnRowDeleting="gvCourses_RowDeleting">
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="ID" />
                            <asp:BoundField DataField="title" HeaderText="Course Name" />
                            <asp:BoundField DataField="description" HeaderText="Description" />
                            <asp:TemplateField HeaderText="Actions">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnDelete" runat="server" CommandName="Delete" 
                                        OnClientClick="return confirm('Delete this course permanently?');" 
                                        ForeColor="#e74c3c">Delete</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
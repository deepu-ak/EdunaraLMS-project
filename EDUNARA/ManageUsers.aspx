<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageUsers.aspx.cs" Inherits="EdunaraProject.ManageUsers" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <title>Manage Users - Edunara Admin</title>
    <style>
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; margin: 0; padding: 0; background: #f4f7f6; }
        .wrapper { display: flex; min-height: 100vh; }
        
        /* Sidebar - Same as Admin.aspx */
        .sidebar { width: 260px; background: #2c3e50; color: white; padding: 20px; flex-shrink: 0; }
        .sidebar h2 { color: #e74c3c; font-size: 22px; margin-bottom: 30px; text-align: center; border-bottom: 1px solid #34495e; padding-bottom: 10px; }
        .sidebar a { display: block; color: #bdc3c7; padding: 12px; text-decoration: none; margin-bottom: 5px; border-radius: 4px; transition: 0.3s; }
        .sidebar a:hover { background: #34495e; color: white; }
        
        /* Main Content Area */
        .main-content { flex-grow: 1; padding: 40px; background: #f4f7f6; }
        .header-box { margin-bottom: 30px; }
        .card { background: white; padding: 25px; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.1); margin-bottom: 30px; }
        
        /* Search Bar Styling */
        .search-container { display: flex; gap: 10px; margin-bottom: 20px; }
        .input-field { flex-grow: 1; padding: 10px; border: 1px solid #ddd; border-radius: 4px; max-width: 400px; }
        .btn-search { background: #3498db; color: white; border: none; padding: 10px 20px; cursor: pointer; border-radius: 4px; font-weight: bold; }
        
        /* Table Styling */
        .grid-style { width: 100%; border-collapse: collapse; background: white; margin-top: 20px; }
        .grid-style th { background: #2c3e50; color: white; padding: 12px; text-align: left; }
        .grid-style td { padding: 12px; border-bottom: 1px solid #eee; }
        .status-msg { font-weight: bold; display: block; margin-bottom: 10px; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="wrapper">
            <div class="sidebar">
                <h2>EDUNARA ADMIN</h2>
                <a href="Admin.aspx">Manage Courses</a>
                <a href="ManageUsers.aspx" style="background:#34495e; color:white;">Manage Users</a>
                <a href="ManageInquiries.aspx">Manage Inquiries</a>
                <a href="Course.aspx" target="_blank">View Live Site</a>
                <hr style="border: 0.5px solid #34495e; margin: 20px 0;" />
                <asp:LinkButton ID="btnLogout" runat="server" OnClick="btnLogout_Click" ForeColor="#e74c3c" Font-Bold="true">Logout</asp:LinkButton>
            </div>

            <div class="main-content">
                <div class="header-box">
                    <h1>User Management</h1>
                    <p>View and manage registered students in the system.</p>
                </div>

                <div class="card">
                    <h3>Registered Students</h3>
                    <div class="search-container">
                        <asp:TextBox ID="txtSearch" runat="server" CssClass="input-field" placeholder="Search by name or email..."></asp:TextBox>
                        <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn-search" OnClick="btnSearch_Click" />
                    </div>

                    <asp:Label ID="lblMsg" runat="server" CssClass="status-msg"></asp:Label>

                    <asp:GridView ID="gvUsers" runat="server" CssClass="grid-style" AutoGenerateColumns="False" 
                        DataKeyNames="id" OnRowDeleting="gvUsers_RowDeleting">
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="User ID" />
                            <asp:BoundField DataField="full_name" HeaderText="Full Name" />
                            <asp:BoundField DataField="email" HeaderText="Email Address" />
                            <asp:TemplateField HeaderText="Actions">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnDelete" runat="server" CommandName="Delete" 
                                        OnClientClick="return confirm('Remove this student from the system?');" 
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
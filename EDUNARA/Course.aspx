<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Course.aspx.cs" Inherits="EdunaraProject.Course" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Courses - Edunara</title>
    <style>
        body { font-family: 'Times New Roman', serif; margin: 0; background-color: #f4f4f4; }
        header { background: #fff; padding: 20px; text-align: center; border-bottom: 2px solid #eee; }
        .logo-img { width: 60px; height: 60px; border-radius: 50%; border: 2px solid #cc0000; }
        nav { background: #333; display: flex; justify-content: center; }
        nav a { color: white; padding: 15px 20px; text-decoration: none; text-transform: uppercase; font-size: 13px; }
        nav a:hover { background: #cc0000; }
        
        .container { width: 85%; margin: 30px auto; min-height: 450px; }
        .course-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 20px; }
        .course-card { background: white; padding: 20px; border-radius: 8px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); border-left: 5px solid #cc0000; }
        .course-card h3 { margin-top: 0; color: #333; }
        .course-btn { display: inline-block; margin-top: 10px; background: #333; color: #fff; padding: 10px 15px; text-decoration: none; border-radius: 4px; }
        
        footer { background: #222; color: #888; padding: 20px; text-align: center; margin-top: 50px; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <img src="Image/LOGO-removebg-preview.png" alt="Edunara Logo" class="logo-img">
            <h1>EDUNARA</h1>
        </header>

        <nav>
            <a href="Default.aspx">Home</a>
            <a href="Course.aspx">Courses</a>
            <a href="Contact.aspx">Contact</a>
            <a href="Login.aspx">Login</a>
            <a href="Register.aspx">Register</a>
        </nav>

        <div class="container">
            <h2>Our Learning Modules</h2>
            <div class="course-grid">
                <asp:Repeater ID="rptCourses" runat="server">
                    <ItemTemplate>
                        <div class="course-card">
                            <h3><%# Eval("title") %></h3>
                            <p><%# Eval("description") %></p>
                            <a href="#" class="course-btn">Start Learning</a>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>

            <asp:Panel ID="pnlNoData" runat="server" Visible="false">
                <div style="text-align:center; padding:40px;">
                    <h3>No resources found. Check back later!</h3>
                </div>
            </asp:Panel>
        </div>

        <footer>
            <p>&copy; 2025 Edunara Digital Learning</p>
        </footer>
    </form>
</body>
</html>
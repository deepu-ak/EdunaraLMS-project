<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="EdunaraProject.Contact" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <title>Contact Us - Edunara</title>
    <style>
        body { font-family: 'Segoe UI', sans-serif; margin: 0; background: #f4f4f4; }
        nav { background: #333; padding: 15px; text-align: center; }
        nav a { color: white; margin: 0 15px; text-decoration: none; text-transform: uppercase; }
        .contact-box { max-width: 500px; margin: 50px auto; background: white; padding: 30px; border-radius: 8px; box-shadow: 0 4px 15px rgba(0,0,0,0.1); }
        .form-control { width: 100%; padding: 10px; margin: 10px 0; border: 1px solid #ddd; border-radius: 4px; box-sizing: border-box; }
        .btn-send { background: #cc0000; color: white; border: none; width: 100%; padding: 12px; cursor: pointer; font-weight: bold; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <nav>
    <a href="Default.aspx">Home</a>
    <a href="Course.aspx">Courses</a>
    <a href="Contact.aspx">Contact</a>
    <a href="Login.aspx">Login</a>
    <a href="Register.aspx">Register</a>
</nav>

        <div class="contact-box">
            <h2>Send us a Message</h2>
            <asp:TextBox ID="txtName" runat="server" placeholder="Your Name" CssClass="form-control"></asp:TextBox>
            <asp:TextBox ID="txtEmail" runat="server" placeholder="Your Email" CssClass="form-control"></asp:TextBox>
            <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Rows="4" placeholder="How can we help?" CssClass="form-control"></asp:TextBox>
            <asp:Button ID="btnSubmit" runat="server" Text="Send Message" CssClass="btn-send" OnClick="btnSubmit_Click" />
            <asp:Label ID="lblStatus" runat="server" ForeColor="Green" style="display:block; margin-top:10px;"></asp:Label>
        </div>
    </form>
</body>
</html>
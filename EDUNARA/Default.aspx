<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EdunaraProject.Default" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home - Edunara Digital Learning</title>
    <style>
        /* Global Styles */
        body { font-family: 'Times New Roman', serif; margin: 0; padding: 0; line-height: 1.6; background-color: #f9f9f9; color: #333; }
        
        /* Header & Logo */
        header { background: #ffffff; color: #333; padding: 20px 0; text-align: center; border-bottom: 2px solid #eee; }
        .logo-img { width: 80px; height: 80px; border-radius: 50%; display: block; margin: 0 auto 10px auto; object-fit: cover; border: 2px solid #cc0000; }

        /* Navigation */
        nav { display: flex; justify-content: center; background: #333; position: sticky; top: 0; z-index: 1000; }
        nav a, nav span { color: white; padding: 15px 25px; text-decoration: none; text-transform: uppercase; font-size: 14px; font-weight: bold; transition: 0.3s; }
        nav a:hover { background-color: #cc0000; color: white; }
        .user-welcome { background: #444; color: #ffcc00; }

        /* Hero Section */
        .hero { 
            background: linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.6)), url('https://images.unsplash.com/photo-1501504905252-473c47e087f8?ixlib=rb-4.0.3&auto=format&fit=crop&w=1350&q=80');
            background-size: cover; background-position: center; height: 450px; display: flex; flex-direction: column; justify-content: center; align-items: center; color: white; text-align: center; padding: 0 20px;
        }
        .hero h2 { font-size: 3rem; margin-bottom: 10px; }
        .hero p { font-size: 1.2rem; max-width: 700px; }
        .btn-cta { margin-top: 20px; background: #cc0000; color: white; padding: 12px 30px; text-decoration: none; border-radius: 5px; font-weight: bold; text-transform: uppercase; }

        /* Container & Features */
        .container { width: 85%; margin: 40px auto; overflow: hidden; }
        .features-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 30px; margin-top: 30px; }
        .feature-card { background: white; padding: 30px; border-radius: 10px; box-shadow: 0 4px 15px rgba(0,0,0,0.1); text-align: center; transition: transform 0.3s; }
        .feature-card:hover { transform: translateY(-10px); }
        .feature-card h3 { color: #cc0000; margin-top: 0; }

        /* Footer */
        footer { background: #222; color: #bbb; padding: 50px 0 20px 0; margin-top: 50px; }
        .footer-content { width: 85%; margin: auto; display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 40px; padding-bottom: 30px; border-bottom: 1px solid #444; }
        .footer-section h4 { color: white; margin-bottom: 20px; text-transform: uppercase; }
        .footer-section p, .footer-section a { font-size: 14px; color: #bbb; text-decoration: none; display: block; margin-bottom: 10px; }
        .footer-section a:hover { color: #cc0000; }
        .footer-bottom { text-align: center; padding-top: 20px; font-size: 13px; }
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
            
            <asp:PlaceHolder ID="phLoggedIn" runat="server" Visible="false">
                <span class="user-welcome">Welcome, <asp:Literal ID="litUserName" runat="server"></asp:Literal></span>
                <asp:LinkButton ID="lnkLogout" runat="server" OnClick="lnkLogout_Click" Style="background: #555; color: white;">Logout</asp:LinkButton>
            </asp:PlaceHolder>

            <asp:PlaceHolder ID="phLoggedOut" runat="server">
                <a href="Login.aspx">Login</a>
                <a href="Register.aspx">Register</a>
            </asp:PlaceHolder>
            
            <a href="AdminLogin.aspx" style="color: #ff4d4d;">Admin Portal</a>
        </nav>

        <div class="hero">
            <h2>Empower Your Learning Journey</h2>
            <p>Access world-class digital resources, virtual labs, and interactive courses designed to support your educational goals.</p>
            <a href="Course.aspx" class="btn-cta">Explore Courses</a>
        </div>

        <div class="container">
            <div style="text-align:center; margin-bottom: 50px;">
                <h2>Why Choose Edunara?</h2>
                <p>Providing the best digital innovation for students worldwide.</p>
            </div>

            <div class="features-grid">
                <div class="feature-card">
                    <h3>Flexible Learning</h3>
                    <p>Learn at your own pace with 24/7 access to all our digital lectures and materials.</p>
                </div>
                <div class="feature-card">
                    <h3>Expert Instructors</h3>
                    <p>Our courses are curated by top industry professionals and academic experts.</p>
                </div>
                <div class="feature-card">
                    <h3>Virtual Labs</h3>
                    <p>Experience hands-on learning through our integrated interactive simulations.</p>
                </div>
            </div>
        </div>

        <footer>
            <div class="footer-content">
                <div class="footer-section">
                    <h4>About Edunara</h4>
                    <p>Edunara is a leading digital learning platform dedicated to providing high-quality education through modern technology.</p>
                </div>
                <div class="footer-section">
                    <h4>Quick Links</h4>
                    <a href="Default.aspx">Home</a>
                    <a href="Course.aspx">Browse Courses</a>
                    <a href="Contact.aspx">Support Center</a>
                    <a href="AdminLogin.aspx">Administrator</a>
                </div>
                <div class="footer-section">
                    <h4>Contact Us</h4>
                    <p>Email: support@edunara.edu</p>
                    <p>Phone: +60 3-1234 5678</p>
                    <p>Location: APU Campus, Malaysia</p>
                </div>
            </div>
            <div class="footer-bottom">
                <p>&copy; <asp:Literal ID="litYear" runat="server"></asp:Literal> Edunara Digital Learning System | APU Web Project</p>
            </div>
        </footer>
    </form>
</body>
</html>
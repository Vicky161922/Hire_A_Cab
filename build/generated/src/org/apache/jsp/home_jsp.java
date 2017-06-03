package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class home_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <title>Reaction Tester</title>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("         <link rel=\"stylesheet\" type=\"text/css\" href=\"image/bootstrap.min.css\">\n");
      out.write("         <link rel=\"stylesheet\" type=\"text/css\" href=\"image/jumbotron.css\">\n");
      out.write("         \n");
      out.write("    </head>\n");
      out.write("   <body>\n");
      out.write("       <div class=\"jumbotron\" id=\"jumbotron\">\n");
      out.write("          <h1 class=\"display-3\">Want to Hire A Cab?</h1>\n");
      out.write("          <p class=\"lead\">No worries! now book a cab in seconds hassle free at reasonable price.</p>\n");
      out.write("          <p class=\"lead\">Just login to your account or if you haven't yet registered your account with us sign up first! </p>\n");
      out.write("          <hr class=\"m-y-2\">\n");
      out.write("          \n");
      out.write("          <p>want to join our mail list?\n");
      out.write("        <form class=\"form-inline\">\n");
      out.write("          <div class=\"form-group\">\n");
      out.write("            <label class=\"sr-only\" for=\"email\">Email address</label>\n");
      out.write("            <div class=\"input-group\">\n");
      out.write("              <div class=\"input-group-addon\">@</div>\n");
      out.write("              <input type=\"email\" class=\"form-control\" id=\"email\" placeholder=\"Your email\">\n");
      out.write("            </div>\n");
      out.write("          </div>\n");
      out.write("          <button type=\"submit\" class=\"btn btn-primary\">Sign up</button>\n");
      out.write("        </form>\n");
      out.write("        </div>\n");
      out.write("      \n");
      out.write("      <div class=\"container\">\n");
      out.write("      \n");
      out.write("        <div class=\"row\" id=\"appSummary\">\n");
      out.write("          \n");
      out.write("            <h1>Just a few clicks away and our cab will be at your doorstep in minimal time!\n");
      out.write("          </h1>\n");
      out.write("            <p class=\"lead\">Provide us your pick up location and destination by login into your account ...check your estimated fares and book your cab.....Boom we get you :p</p>\n");
      out.write("            <br><br><p class=\"lead\">Summary, once again, of our app's awesomeness<br>\n");
      out.write("                <a href=\"index.html\">try it now!!</a></p>\n");
      out.write("          \n");
      out.write("          </div>\n");
      out.write("          \n");
      out.write("      </div>\n");
      out.write("      \n");
      out.write("     <div class=\"container\" id=\"about\">\n");
      out.write("      <div class=\"card-deck-wrapper\">\n");
      out.write("  <div class=\"card-deck\">\n");
      out.write("    <div class=\"card\">\n");
      out.write("      <img class=\"card-img-top\" src=\"image/conv.png\" alt=\"Card image cap\">\n");
      out.write("      <div class=\"card-block\">\n");
      out.write("        <h4 class=\"card-title\"><i class=\"fa fa-anchor\"></i> Convenience</h4>\n");
      out.write("        <p class=\"card-text\">Book within seconds and get instant confirmations. Easy online payments or cash on delivery. Booking car rentals will never be a headache again!</p>\n");
      out.write("        \n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"card\">\n");
      out.write("      <img class=\"card-img-top\" src=\"image/quality.jpg\" alt=\"Card image cap\">\n");
      out.write("      <div class=\"card-block\">\n");
      out.write("        <h4 class=\"card-title\"><i class=\"fa fa-bicycle\"></i> Quality</h4>\n");
      out.write("        <p class=\"card-text\">Our cars are audited for cleanliness, safety and comfort. Our drivers are well trained and reliable. Sit back and enjoy the Ola experience!</p>\n");
      out.write("        \n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"card\">\n");
      out.write("      <img class=\"card-img-top\" src=\"image/pay.jpg\" alt=\"Card image cap\">\n");
      out.write("      <div class=\"card-block\">\n");
      out.write("        <h4 class=\"card-title\"><i class=\"fa fa-birthday-cake\"></i> Control</h4>\n");
      out.write("        <p class=\"card-text\">We have clear and transparent pricing listed online. Never haggle with drivers again on payments and be confident and assured of what you are being charged for!!!</p>\n");
      out.write("       \n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("  </div>\n");
      out.write("</div>\n");
      out.write("          </div>\n");
      out.write("      \n");
      out.write("      <div id=\"footer\">\n");
      out.write("      \n");
      out.write("        <div class=\"row\">\n");
      out.write("          \n");
      out.write("                <h2>Download the app!</h2>\n");
      out.write("            \n");
      out.write("            <p class=\"lead\">Really, why should I download this app??</p>\n");
      out.write("            \n");
      out.write("            <p><a href=\"#\"><img id=\"appStoreIcon\" src=\"image/App-Store-Icon.png\"></a>\n");
      out.write("            <a href=\"#\"><img id=\"appStoreIcon\" src=\"image/google-play.jpg\"></a></p>\n");
      out.write("            \n");
      out.write("            \n");
      out.write("          \n");
      out.write("          </div>\n");
      out.write("      \n");
      out.write("      </div>\n");
      out.write("       <script src=\"image/jquery.min.js\"></script>\n");
      out.write("       <script src=\"image/bootstrap.min.js\"></script>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}

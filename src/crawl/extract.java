package crawl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.helper.Validate;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.IOException;
@WebServlet("/extract")
public class extract extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HashSet<String> list=new HashSet<String>();
    public extract() {
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String Keyword=request.getParameter("keyword");
		String URL=request.getParameter("URL");
	list.add(URL);
		HttpSession session=request.getSession();  
        session.setAttribute("Keyword",Keyword);
	
		String url = URL;
        print("Fetching %s...",url);

        Document doc = Jsoup.connect(url).get();
        Elements links = doc.select("a[href]");
             
            //  print("\nLinks: (%d)", links.size());
      
              for (Element link : links) {
        
        //    	  print("%s ", link.attr("abs:href"), trim(link.text(), 35));
String uri=String.format(link.attr("abs:href"), trim(link.text(), 35));
            
            if(uri.contains(".")) {
                String extension = uri.substring(uri.lastIndexOf(".")+1);
                if(!extension.equals("pdf")) {
                	if(!extension.equals("jpg")) {
                	
                	list.add(String.format(link.attr("abs:href"), trim(link.text(), 35)));    	
                	//print("%s ", link.attr("abs:href"), trim(link.text(), 35));
                	}                }
            }
            
            

        }/*
for(String s:list) {
              Document doc1 = Jsoup.connect(s).get();
              Elements links1 = doc1.select("a[href]");
                   
                  //  print("\nLinks: (%d)", links.size());
            
                    for (Element link : links1) {
              
              //    	  print("%s ", link.attr("abs:href"), trim(link.text(), 35));
      String uri1=String.format(link.attr("abs:href"), trim(link.text(), 35));
                  
                  if(uri1.contains(".")) {
                      String extension = uri1.substring(uri1.lastIndexOf(".")+1);
                      if(!extension.equals("pdf")) {
                      	if(!extension.equals("jpg")) {
                      	
                      	list.add(String.format(link.attr("abs:href"), trim(link.text(), 35)));    	
                      	//print("%s ", link.attr("abs:href"), trim(link.text(), 35));
                      	}                }
                  }
                  
                  

              }
                    
}
*/
              
              
              request.setAttribute("list",list);
      
        getServletConfig().getServletContext().getRequestDispatcher("/Result.jsp").forward(request,response);
       
	}
	
	
	
    private static void print(String msg, Object... args) {
        System.out.println(String.format(msg, args));
        }

    private static String trim(String s, int width) {
        if (s.length() > width)
            return s.substring(0, width-1) + ".";
        else
            return s;
    }
	
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

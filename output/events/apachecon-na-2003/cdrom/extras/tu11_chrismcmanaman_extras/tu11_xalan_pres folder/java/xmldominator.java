import java.io.IOException;

import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.NodeList;

import org.xml.sax.SAXException;

public class Sample2 
{
  public static void main(String args[]) {

  try {
    javax.xml.parsers.DocumentBuilderFactory factory = javax.xml.parsers.DocumentBuilderFactory.newInstance(); 
    javax.xml.parsers.DocumentBuilder builder = factory.newDocumentBuilder(); 
    Document document = builder.parse("e:\\xslt_pres\\in.xml"); 

    NodeList myNL = document.getElementsByTagName("well_name");
  
    System.out.println("myNL.getLength(): " + myNL.getLength());
    
    for (int i = 0; i < myNL.getLength(); i++) {
      System.out.println(myNL.item(i).getFirstChild().getNodeValue());
      NamedNodeMap nnm = myNL.item(i).getAttributes();
       for (int k = 0; k < nnm.getLength(); k++) {
        System.out.println(nnm.getNamedItem("type").getNodeValue());
      }
    }

    
  } catch (ParserConfigurationException pce) 
    {
      System.err.println(pce.toString());
    } catch (IOException ioe) 
    {
      System.err.println(ioe.toString());
    } catch (SAXException sax) 
    {
      System.err.println(sax.toString());
    }
  }
}
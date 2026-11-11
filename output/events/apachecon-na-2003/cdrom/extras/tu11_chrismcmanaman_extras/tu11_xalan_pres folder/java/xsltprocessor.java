
import java.io.File;

import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import org.apache.xalan.trace.TraceManager;
import org.apache.xalan.trace.PrintTraceListener;
import org.apache.xalan.transformer.TransformerImpl;
class XSLTProcessor 
{

  public static void main(String args[]) throws javax.xml.transform.TransformerException 
  {
    if (args.length != 2) 
    {
      System.err.println("Usage:");
      System.err.println(" java " + XSLTProcessor.class.getName() 
        + " xmlFilename xsltFileName");
      System.exit(1);
    }

   try {
    File xmlFile = new File("c://xslt_pres//xml_files//incoming.xml");
    File xsltFile = new File("c://xslt_pres//xslt_files//function.xsl");

      java.io.PrintWriter pwriter = new java.io.PrintWriter(System.out);
      PrintTraceListener ptracer = new PrintTraceListener(pwriter);
      ptracer.m_traceElements = true;
      ptracer.m_traceSelection = true;

    javax.xml.transform.Source xmlSource = 
      new StreamSource(xmlFile);

    javax.xml.transform.Source xsltSource = 
      new StreamSource(xsltFile);

    javax.xml.transform.Result result = 
      new StreamResult(System.out); 

    TransformerFactory transFact =   
      TransformerFactory.newInstance();

    Transformer trans = transFact.newTransformer(xsltSource);

    TransformerImpl transformerImpl = (TransformerImpl)trans;
    TraceManager trMgr = transformerImpl.getTraceManager();
    trMgr.addTraceListener(ptracer);

    trans.transform(xmlSource, result);
   } catch (java.util.TooManyListenersException tmle) 
   {
      System.out.println("Exception: " + tmle.getMessage());   

   }
  }

}
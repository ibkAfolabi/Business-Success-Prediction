<%-- 
    Document   : goal1_receive
    Created on : Feb 26, 2018, 5:36:19 PM
    Author     : Seniorita Cordelia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%Class.forName("com.mysql.jdbc.Driver");%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.FileReader"%>
<%@page import="weka.classifiers.bayes.NaiveBayes"%>
<%@page import="weka.core.Instances"%>

<%--<%@page import="javax.servlet.ServletException"--%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
    <link rel="icon" type="image/png" href="assets/img/favicon.ico">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>DaLia</title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
    <!--     Fonts and icons     -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
    <!-- CSS Files -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/css/now-ui-kit.css?v=1.1.0" rel="stylesheet" />
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link href="assets/css/demo.css" rel="stylesheet" />
    </head>
    <body>
        

<%
    
         int idgiven=0;
         String newId="";
         String newstoredID="";
         
         try{
             
         int idlast =0;    
        Connection conn2 = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/form1?zeroDateTimeBehavior=convertToNull", "root","password");
        Statement st=conn2.createStatement();
        ResultSet res2 = st.executeQuery("SELECT * FROM  form_2");
        res2.last();
        int row = res2.getRow();
        //idlast = res2.getInt("idGiven");
        idlast=row +1;
        idgiven=idlast;
            
            
            
            String genders=request.getParameter("gender");
            String age_range=request.getParameter("age");
            String lvl_edu=request.getParameter("lvl_edu");
            String communication=request.getParameter("communicate");
            String leads=request.getParameter("lead");
            String capitals=request.getParameter("capital");
            String risks=request.getParameter("risk");
            String prepare=request.getParameter("prepared");
            String competition=request.getParameter("competitive");
            String emotion=request.getParameter("emotional");
            String experts=request.getParameter("expert");
            String prediction ="?";
            newId= Integer.toString(idgiven);
            String query= "INSERT INTO form_2 VALUES"
                    
            + "(NULL,'"+genders+"','"+age_range+"','"+lvl_edu+"','"+communication+"','"+leads+"','"+capitals+"','"+risks+"','"+prepare+"','"+competition+"','"+emotion+"','"+experts+"','"+prediction+"','"+newId+"')";
           
          
                   


//Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/form1?zeroDateTimeBehavior=convertToNull", "root","password");
Statement stc=conn2.createStatement();

stc.executeUpdate(query);
conn2.setAutoCommit(true);
out.println("inserted");
out.println(newId);
}
catch (Exception e){  
out.println(e.getMessage());}
 
         try{
        String sex=""; 
        String age="";
        String education="";
        String communicate="";
        String leader="";
        String capi ="";
        String risk="";
        String prep="";
        String compet="";
       
       // String comm="";
        String emotions="";
        String experts="";
        String prediction="";
        int idstored =0;
       
        boolean verify=true;
        
        Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/form1?zeroDateTimeBehavior=convertToNull", "root","password");
        Statement st=conn.createStatement();
        ResultSet res = st.executeQuery("SELECT * FROM  form_2");
        while (res.next()){
        sex=res.getString("gender").trim(); 
        age=res.getString("age").trim();
        education=res.getString("lvl_education").trim();
        communicate=res.getString("communication").trim();
        leader=res.getString("manage").trim();
        capi=res.getString("capital").trim();
        risk=res.getString("risk").trim();
        prep=res.getString("preparation").trim();
        compet=res.getString("competitiveness").trim();
        emotions=res.getString("emotion_intelligence").trim();
        experts=res.getString("expert").trim();
        prediction = res.getString("prediction").trim();
        
        //comm=res.getString("commit").trim();
        idstored= res.getInt("idgiven");
        newstoredID = Integer.toString(idstored );
        verify=true;
        if (newId.equals(newstoredID))
        {
            verify=true;
            break;
        }
        else
        {
          verify=false;  
        }
        }
        if (verify==true)
        {
           out.println("the prediction is ");
              
        }
        else
        {
           out.println("cant predict");
                  
        }
            conn.close();
        
        
      
        String[] myArray= new String[12];
        myArray = new String[] {sex,age,education,communicate,leader,capi,risk,prep,compet,emotions,experts,prediction};
        BufferedWriter writer = new BufferedWriter(new FileWriter("C:\\Users\\Seniorita Cordelia\\Desktop\\goal1.nominalTest.arff"));
        writer.write("@relation goal1.nominalTest\n" +
"\n" +
"@attribute Gender {Male,Female,none}\n" +
"@attribute Age {15To20,21To30,31To40,41To50,51To60,Above60,none}\n" +
"@attribute Education {SSCE,OND,HND,B.Sc,M.Sc,Ph.D,none}\n" +
"@attribute Communication {0To25,26To50,51To75,76To100,none}\n" +
"@attribute ManageBusiness {0To25,26To50,51To75,76To100,none}\n" +
"@attribute Capital {0To25,26To50,51To75,76To100,none}\n" +
"@attribute Risk {0To25,26To50,51To75,76To100,none}\n" +
"@attribute Challenges {0To25,26To50,51To75,76To100,none}\n" +
"@attribute Competition {0To25,26To50,51To75,76To100,none}\n" +
"@attribute EmotionalIntelligence {0To25,26To50,51To75,76To100,none}\n" +
"@attribute Expert {0To25,26To50,51To75,76To100,none}\n" +
"@attribute Prediction {MAYSUCCEED,NOTSUCCEED,SUCCEED}\n" +

"\n" +
"@data");
        writer.close();
      
    String filename= "C:\\Users\\Seniorita Cordelia\\Desktop\\goal1.nominalTest.arff";
    FileWriter fw = new FileWriter(filename,true); //the true will append the new data
fw.write("\n");
fw.write(sex);
fw.write(",");
fw.write(age);
fw.write(",");
fw.write(education);
fw.write(",");
fw.write(communicate);
fw.write(",");
fw.write(leader);
fw.write(",");
fw.write(capi);
fw.write(",");
fw.write(risk);
fw.write(",");
fw.write(prep);
fw.write(",");
fw.write(compet);
fw.write(",");
//fw.write(comm);
//fw.write(",");
fw.write(emotions);
fw.write(",");
fw.write(experts);
fw.write(",");
fw.write(prediction);

//appends the string to the file
    fw.close(); 
        
        
        // TODO code application logic here
       BufferedReader breader = null;
       breader = new BufferedReader (new FileReader("C:\\Users\\Seniorita Cordelia\\Desktop\\goal1TRAINdata.arff"));
       Instances train = new Instances(breader);
       train.setClassIndex(train.numAttributes()-1);
     
       
       breader = new BufferedReader (new FileReader("C:\\Users\\Seniorita Cordelia\\Desktop\\goal1.nominalTest.arff"));
       Instances test = new Instances(breader);
       test.setClassIndex(train.numAttributes()-1);
       
       breader.close();
       
       NaiveBayes tree = new NaiveBayes();
       tree.buildClassifier(train);
       Instances labeled = new Instances(test);
       
       for (int i=0; i<test.numInstances(); i++)
       {
       double clsLabel = tree.classifyInstance(test.instance(i));       
       labeled.instance(i).setClassValue(clsLabel);
       String output= labeled.lastInstance().toString();
       String[] arr = output.split(",");
   // for (int j =0; j<arr.length; j++)
   // {
     out.println(arr[11]);
  //  }
      }
     
         }
         catch (SQLException ex)
         {
         }
        
        
        
%>  
                    
      
    </body>
</html>

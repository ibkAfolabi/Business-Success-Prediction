<%-- 
    Document   : goal3_predict
    Created on : Mar 24, 2018, 8:23:57 AM
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
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
     
int idgiven=0;
String newId="";
String newstoredID ="";
try{
           
int idlast=0;                  
            
Connection conn2 = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/form1", "root","password");
Statement st=conn2.createStatement();
ResultSet res2 = st.executeQuery("SELECT * FROM form_4");
res2.last(); 
int row  =res2.getRow();
//idlast = res2.getInt("idGiven");
idlast=row+1;
idgiven=idlast;

 
            //int idinsert = idgiven;
            String invest=request.getParameter("investment");
            String operate=request.getParameter("operation");
            String market=request.getParameter("marketing");
            String business=request.getParameter("businesskind");
            String describe=request.getParameter("description");
            String operationexit=request.getParameter("operationexit");
            String legal=request.getParameter("legal");
            String fraud=request.getParameter("fraud");
            String prediction = "?";
            newId= Integer.toString(idgiven);
            String query= "INSERT INTO form_4 VALUES"
            + "('"+invest+"','"+operate+"','"+market+"','"+business+"','"+describe+"','"+operationexit+"','"
                    +legal+"','"+fraud+"','"+prediction+"','"+newId+"')";
           
          
                   


//Connection connc = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/businessdiag", "root","ibk");
Statement stc=conn2.createStatement();

stc.executeUpdate(query);
conn2.setAutoCommit(true);
out.println("inserted");
out.println(newId);
}
catch (Exception e){  
out.println(e.getMessage());
}
    try
    {
            String invest="";
            String operate="";
            String market="";
           
            String sex="";
            String age="";
            String education="";
            String plan="";
            String invest_hour="";
            String details="";
            String businessplan="";
            String consult="";
            String satisfy="";
            String finance="";
            int idstored =0;
       
        boolean verify=true;
        
        Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/form1", "root","password");
        Statement st=conn.createStatement();
        ResultSet res = st.executeQuery("SELECT * FROM  form_4");
        ResultSet res2 = st.executeQuery("SELECT * FROM  form_3");
        ResultSet res3 = st.executeQuery("SELECT * FROM  form_2");
        while (res.next() && res2.next() && res3.next()){
            sex=res.getString("gender").trim(); 
            age=res.getString("age").trim();
            education=res.getString("lvl_education").trim();
            plan=res.getString("successionplan").trim();
            invest_hour=res.getString("investmenthour").trim();
            details=res.getString("customerdetail").trim();
            businessplan=res.getString("businessplan").trim();
            consult=res.getString("consultation").trim();
            satisfy=res.getString("customersatisfy").trim();
            invest=res.getString("returns").trim();
            market=res.getString("marketactivity").trim();
            finance=res.getString("management").trim();
            operate=res.getString("prediction").trim();;
            idstored= res.getInt("idGiven");
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
        myArray = new String[] {invest,operate,market,sex,age,education,plan,invest_hour,satisfy,consult,details,businessplan,finance};
        BufferedWriter writer = new BufferedWriter(new FileWriter("C:\\Users\\Seniorita Cordelia\\Desktop\\FINAL YEAR PROJECT\\FINAL YEAR PROJECT\\goal_3\\goal3Testdata.arff"));
        writer.write(  
        "@relation goal3Testdata\n"+
"\n" +

"@attribute Gender {MALE, FEMALE, none}\n" +
"@attribute Age {15To20, 21To30, 31To40, 41To50, 51To60, Above60, none}\n" +
"@attribute LevelEducation {SSCE, OND, HND, B.Sc, M.Sc, Ph.D, none}\n" +
"@attribute SuccessionPlan {YES, NO, none}\n" +
"@attribute InvestmentHour {0To3, 4To6, Above6, none}\n" +
"@attribute CustomerDetails {YES, NO, none}\n" +
"@attribute BusinessPlan {YES, NO, none}\n" +
"@attribute Consultation {ALWAYS, SOMETIMES,NEVER, none}\n" +
"@attribute CustomersSatisfied {YES, NO, none}\n" +
"@attribute InvestmentReturns {0To25, 26To50, 51To75, 76To100, none}\n" +
"@attribute MarketingActivities {YES, NO, none}\n" +
"@attribute ManageFinances {YES, NO, none}\n" +
"@attribute BusinessOperation {0To5, 6To10, 10To20, none}\n" +
"\n" +
"@data");
        
        writer.close();
      
    String filename= "C:\\Users\\Seniorita Cordelia\\Desktop\\FINAL YEAR PROJECT\\FINAL YEAR PROJECT\\goal_3\\goal3Testdata.arff";
    FileWriter fw = new FileWriter(filename,true); //the true will append the new data
fw.write("\n");
fw.write(sex);
fw.write(",");
fw.write(age);
fw.write(",");
fw.write(education);
fw.write(",");
fw.write(plan);
fw.write(",");
fw.write(invest_hour);
fw.write(",");
fw.write(details);
fw.write(",");
fw.write(businessplan);
fw.write(",");
fw.write(consult);
fw.write(",");
fw.write(satisfy);
fw.write(",");
fw.write(invest);
fw.write(",");
fw.write(market);
fw.write(",");
fw.write(finance);
fw.write(",");
fw.write(operate);

//appends the string to the file
    fw.close(); 
        
        
        // TODO code application logic here
       BufferedReader breader = null;
       breader = new BufferedReader (new FileReader("C:\\Users\\Seniorita Cordelia\\Desktop\\FINAL YEAR PROJECT\\FINAL YEAR PROJECT\\goal_3\\goal3Traindata.arff"));
       Instances train = new Instances(breader);
       train.setClassIndex(train.numAttributes()-1);
     
       
       breader = new BufferedReader (new FileReader("C:\\Users\\Seniorita Cordelia\\Desktop\\FINAL YEAR PROJECT\\FINAL YEAR PROJECT\\goal_3\\goal3Testdata.arff"));
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
    catch (Exception ex)
    {}
        %>
    </body>
</html>

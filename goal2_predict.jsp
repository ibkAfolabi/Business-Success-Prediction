<%-- 
    Document   : goal2_predict
    Created on : 23-Mar-2018, 16:06:24
    Author     : Ibukun
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
ResultSet res2 = st.executeQuery("SELECT * FROM form_3");
res2.last(); 
 int row  =res2.getRow();
//idlast = res2.getInt("idGiven");
 idlast=row+1;
 idgiven=idlast;

 
            //int idinsert = idgiven;
            String businessdiff=request.getParameter("businessdiff");
            String plan=request.getParameter("succession");
            String invest_hour=request.getParameter("hours");
            String details=request.getParameter("customerdetails");
            String businessplan=request.getParameter("businessplan");
            String customers=request.getParameter("target");
            String competitors=request.getParameter("competitors");
            String consult=request.getParameter("consultation");
            String satisfy=request.getParameter("satisfaction");
            String gvt_policies=request.getParameter("policies");
            String finance=request.getParameter("finances");
            String prediction = "?";
            newId= Integer.toString(idgiven);
            String query= "INSERT INTO form_3 VALUES"
            + "('"+businessdiff+"','"+plan+"','"+invest_hour+"','"+details+"','"+businessplan+"','"+customers+"','"
                    +competitors+"','"+consult+"','"+satisfy+"','"+gvt_policies+"','"+finance+"','"+prediction+"','"+newId+"')";
           
          
                   


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

try{
            String businessdiff="";
            String plan="";
            String invest_hour="";
            String details="";
            String businessplan="";
            String customers="";
            String competitors="";
            String consult="";
            String satisfy="";
            String gvt_policies="";
            String finance="";
            String prediction = "";
            int idstored =0;
       
        boolean verify=true;
        
        Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/form1", "root","password");
        Statement st=conn.createStatement();
        ResultSet res = st.executeQuery("SELECT * FROM  form_3");
        while (res.next()){
        
            businessdiff=res.getString("businessdiff").trim();
            plan=res.getString("successionplan").trim();
            invest_hour=res.getString("investmenthour").trim();
            details=res.getString("customerdetail").trim();
            businessplan=res.getString("businessplan").trim();
            customers=res.getString("targetcustomer").trim();
            competitors=res.getString("competitors").trim();
            consult=res.getString("consultation").trim();
            satisfy=res.getString("customersatisfy").trim();
            gvt_policies=res.getString("governmentpolicies").trim();
            finance=res.getString("management").trim();
            prediction = res.getString("prediction").trim();
            
       
        //comm=res.getString("commit").trim();
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
        myArray = new String[] {businessdiff,plan,invest_hour,details,businessplan,customers,competitors,consult,satisfy,gvt_policies,finance,prediction};
        BufferedWriter writer = new BufferedWriter(new FileWriter("C:\\Users\\Seniorita Cordelia\\Desktop\\FINAL YEAR PROJECT\\FINAL YEAR PROJECT\\goal_2\\goal2Testdata.arff"));
        writer.write(  
        "@relation goal2Testdata\n"+
"\n" +
"@attribute BusinessDifficulties{YES, NO, none}\n"+
"@attribute SuccessionPlan{YES, NO, none}\n"+
"@attribute InvestmentHour{0To3, 4To6, Above6, none}\n"+
"@attribute CustomerDetail {YES, NO, none}\n"+
"@attribute BusinessPlan {YES, NO, none}\n"+
"@attribute TargetCustomers {YES, NO, none}\n"+
"@attribute Competitors {YES, NO, none}\n"+
"@attribute Consultation {ALWAYS, SOMETIMES,NEVER, none}\n"+
"@attribute CustomerSatisfaction {YES, NO, none}\n"+
"@attribute GovernmentPolicies {VERYMUCH, SLIGHTLY, NOTATALL, none}\n"+
"@attribute ManageFinance {YES, NO, none}\n"+
"@attribute Prediction {MAYSUCCEED, NOTSUCCEED, SUCCEED, none}\n"+
"\n" +
"@data");
        
        writer.close();
      
    String filename= "C:\\Users\\Seniorita Cordelia\\Desktop\\FINAL YEAR PROJECT\\FINAL YEAR PROJECT\\goal_2\\goal2Testdata.arff";
    FileWriter fw = new FileWriter(filename,true); //the true will append the new data
fw.write("\n");
fw.write(businessdiff);
fw.write(",");
fw.write(plan);
fw.write(",");
fw.write(invest_hour);
fw.write(",");
fw.write(details);
fw.write(",");
fw.write(businessplan);
fw.write(",");
fw.write(customers);
fw.write(",");
fw.write(competitors);
fw.write(",");
fw.write(consult);
fw.write(",");
fw.write(satisfy);
fw.write(",");
fw.write(gvt_policies);
fw.write(",");
fw.write(finance);
fw.write(",");
fw.write(prediction);

//appends the string to the file
    fw.close(); 
        
        
        // TODO code application logic here
       BufferedReader breader = null;
       breader = new BufferedReader (new FileReader("C:\\Users\\Seniorita Cordelia\\Desktop\\FINAL YEAR PROJECT\\FINAL YEAR PROJECT\\goal_2\\goal2Traindata.arff"));
       Instances train = new Instances(breader);
       train.setClassIndex(train.numAttributes()-1);
     
       
       breader = new BufferedReader (new FileReader("C:\\Users\\Seniorita Cordelia\\Desktop\\FINAL YEAR PROJECT\\FINAL YEAR PROJECT\\goal_2\\goal2Testdata.arff"));
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

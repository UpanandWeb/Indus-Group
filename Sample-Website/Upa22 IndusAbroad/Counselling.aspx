<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Counselling.aspx.cs" Inherits="Counselling" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" />

    <style>
        b,
        h3 {
            color: darkblue;
        }

        b {
            font-family: 'Lato', sans-serif;
            font-weight: bold;
        }

        p {
            font-family: 'Lato', sans-serif;
            font-weight: 500;
            font-size: 14px;
            line-height: 25px
        }

        .col-sm-9 ul li {
            font-family: 'Lato', sans-serif;
            font-weight: 500;
            font-size: 14px;
            padding: 5px 0;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div style="padding:10px;">
        <div class="row">
            <div class="col-sm-8">
                <h3>
                    Counseling :
                </h3>
                <p>
                  Our Counselors specialize in helping the students find the right international university. Admissions policies and applications are vary from College to college and nation to nation, and the application process can be particularly daunting for international students. Our counselors work one-on-one with students and their parents to help them navigate the global admissions process. Our personalized counseling approach minimizes application stress and yields tremendous success. We excel at helping each candidate create applications worthy of their unique academic and personal profiles.

                </p>
               
            </div>
          
           
            <div class="col-sm-4">
    <div class="form-group">
      <label for="name">First Name:</label>
      <input type="text" class="form-control" id="name" placeholder="Enter name" name="name">
    </div>
    <div class="form-group">
      <label for="name"> Last Name:</label>
      <input type="text" class="form-control" id="Text1" placeholder="Enter name" name="name" />
    </div>
    <div class="form-group">
        <label for="email">Email:</label>
      <input type="email" class="form-control" id="email" placeholder="Enter email" name="email" />
    </div>
     <div class="form-group">
      <label for="phone">Phone:</label>
      <input type="tel" class="form-control" id="phone" placeholder="Enter phone" name="phone">
    </div>
    <div class="form-group">
      <label for="phone">Subject:</label>
      <input type="text" class="form-control" id="Text2" placeholder="Enter phone" name="phone">
    </div>
    
    <label for="phone">Description :</label>
    <div class="form-group">
      
      <textarea name="" id="" cols="77" rows="10" style="width:100%;height:50px;"></textarea>
    </div>
    <div style="text-align: center">
    <input type="submit" class="btn btn-success" name="submit" value="Submit" />
     <input type="submit" class="btn btn-danger" name="submit" value="Reset" />
  </div>
            </div>
        </div>

        </div>
</asp:Content>


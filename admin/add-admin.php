<?php include('partials/menu.php'); ?>

<div class="main-content">
    <div class="wrapper">
        <h1>Add admin</h1>
        <br><br>

        <?php

            if(isset($_SESSION['add'])) //checking whether the session is set or not
            {

                echo $_SESSION['add'];  //Display the session message if set
                unset($_SESSION['add']);  //Remove session message
            }

        ?>
        <form action="" method="POST">


<table class="tbl-30">

<tr>

    <td>Full Name: </td>
    <td><input type="text" name="full-name" placeholder="Enter your name"> </td>
</tr>

<tr>
     <td>Username: </td>
     <td>
         <input type="text" name="username" placeholder="Your username">
     </td>
</tr>

<tr>
     <td>Password: </td>
     <td>
         <input type="password" name="password" placeholder="Your password">
     </td>
</tr>

<tr>
    <td colspan="2">
        <input type="submit" name="submit" value="Add admin" class="btn-secondary">
    </td>
</tr>
</table>


        </form>
 
    </div>

</div>


<?php include('partials/footer.php'); ?>

<?php
      //Process the value Form and Save it in Database
      //Check whether the submit button is clicked or not 
      if(isset($_POST['submit']))
         {
          //button clicked
          //echo "Button clicked";
          //get data from from 
          $full_name = $_POST['full-name'];
           $username = $_POST['username'];
           $password = md5($_POST['password']);  //password encryption with MD5
           //SQL query to save the data into database
           $sql = "INSERT INTO tbl_admin SET
                   full_name = '$full_name',
                   username = '$username',
                   password = '$password'
           ";
         //3.executing query and saving data into database
         $res = mysqli_query($conn, $sql) or die(mysqli_error());
         //4.Check whether the (Query is executed) data is inserted or not and display appropriate message
         if($res == TRUE )
         {
             //DATA inserted
             //echo "Data Inserted";
             //Create a session variable to Display message
             $_SESSION['add'] = "Admin added successfully";
             //Redirect page to manage admin
             header("location:".SITEURL.'admin/manage-admin.php');
         }
         else
         {
             //failed to insert data 
             // echo "Failed to Insert Data";
             //Create a session variable to Display message
             $_SESSION['add'] = "Failed to Add admin";
             //Redirect page to add admin
             header("location:".SITEURL.'admin/manage-admin.php');
         }
      }    
?>
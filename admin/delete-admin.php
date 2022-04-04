<?php
   //Include constant.php file here
   include('../config/constants.php');
   //1.Get the id of admin to be deleted 
   echo $id = $_GET['id'];
   //2. Create SQL Query to Delete Admin
   $sql = "DELETE FROM tbl_admin WHERE id=$id";
   //Execute the Query
   $res = mysqli_query($conn,$sql);
   //Check whether the QUERY executed successfully or not 
   if($res == true)
   {
     //Query executed successfully and admin deleted 
     //echo "Admin Deleted";
    //Create session variable to display message 
     $_SESSION['delete'] = "<div class='success' >Admin Deleted successfully </div>";
     //Redirect to manage admin page
     header ('location:'.SITEURL.'admin/manage-admin.php');
   }  
   else
   {
      //Failed to Delete Admin
      //echo "Failed to Delete Admin";
      $_SESSION['delete'] = "<div class = 'error'>Failed to delete. Try again later</div>";
      header ('location:'.SITEURL.'admin/manage-admin.php');
   }
?>

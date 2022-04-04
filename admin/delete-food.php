<?php


   //Include constants page
   include('../config/constants.php');
        // echo "Delete food page";
      if(isset($_GET['id']) && isset($_GET['image_name']))
      {
          //Process to delete
         // echo "Process to Delete";
         //1.Get id and Image name
         $id = $_GET['id'];
         $image_name = $_GET['image_name'];
         //2.Remove the image if available
         //Check whether the image is available or not and Delete only if available
         if($image_name != "")
         {
             //it has image and need to remove from folder
             //Get the Image path
             $path = "../images/food/".$image_name;
             //Remove image file from folder
             $remove = unlink($path);
             //Check whether the image is removed or not 
             if($remove == false)
             {
                 //failed to remove image
                 $_SESSION['upload'] = "<div class='error'>Failed to Remove Image</div>";
                 //Redirect to manage food
                 header('location'.SITEURL.'admin/manage-food.php');
                 die();

             }
         }

         //3.Delete food from database
         $sql = "DELETE FROM tbl_food WHERE id= $id";
         //Execute the query
         $res = mysqli_query($conn,$sql);
         //Check whether the Query executed or not and set the session message respectively
          //4.Redirect to manage food with session message
         if($res== true)
         {
               //Food Deleted
               $_SESSION['delete'] = "<div class='success'>Food Deleted Successfully</div>";
               header('location:'.SITEURL.'admin/manage-food.php');
         }
         else
         {
              //Failed to Delete Food
              $_SESSION['delete'] = "<div class='error'>Failed to Delete Food</div>";
              header('location:'.SITEURL.'admin/manage-food.php');
         }


         
      }
      else
      {
          //Redirect to manage food page
          //echo"Redirect";

          $_SESSION['unauthorize'] = "<div class='error'>Unauthorized Access.</div>";
          header('location:'.SITEURL.'admin/manage-food.php');
      }
?>
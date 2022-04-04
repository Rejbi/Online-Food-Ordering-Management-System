<?php 


     //Include constants File
     include("../config/constants.php");
     //echo "Delete Page";
     //check whether the id and image_name value is set or not 
     if(isset($_GET['id']) AND isset($_GET['image_name']))
     {
         //Get the value and Delete
        // echo "Get value and delete";
        $id = $_GET['id'];
        $image_name = $_GET['image_name'];
        //Remove the physical Image file is available
        if($image_name != "")
        {
            //Image is available . So Remove it
            $path = "../images/category/".$image_name;
            //Remove the image;
            $remove = unlink($path);
            //if failed to remove image then add an error message and stop the process
            if($remove == false)
            {
                //set the session message;
                $_SESSION['remove'] = "<div class='error'>Failed to Remove Category Image</div>";
                //Redirect to manage category page
                header('location:'.SITEURL.'admin/manage-category.php');
                //stop the process
                die();
            }
         
        }
        //Delete Data from database
        //Sql Query Delete data from database
        $sql = "DELETE FROM tbl_category WHERE id = $id";
        //Execute the Query
        $res = mysqli_query($conn, $sql);

        //check whether the database is delete from database or not 

        if($res == true)
        {
            //Set success message
            $_SESSION['delete'] = "<div class='success'>Category Deleted Successfully.</div>";

            //Redirect to manage category
            header('location:'.SITEURL.'admin/manage-category.php');
        }
        else
        {
            //set fail message and redirect
            //Set success message
            $_SESSION['delete'] = "<div class='error'>Failed to Delete Category .</div>";

            //Redirect to manage category
            header('location:'.SITEURL.'admin/manage-category.php');

        }

        

     }
     else
     {
        //Redirect to manage-category page 
        header('location:'.SITEURL.'admin/manage-category.php');  
     }

?>
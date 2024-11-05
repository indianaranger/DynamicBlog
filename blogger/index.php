<?php
require "./partials/dbBlogs.php";

$fetch = false;
$searchQuery = ""; // Initialize searchQuery
$tableName = "allblogs";

// Check if the search form is submitted
if (isset($_POST['search'])) {
    $searchQuery = mysqli_real_escape_string($conn, $_POST['search']);
    $sql = "SELECT * FROM $tableName WHERE username LIKE '%$searchQuery%' OR blog_title LIKE '%$searchQuery%' ORDER BY time DESC;";
} else {
    $sql = "SELECT * FROM $tableName ORDER BY time DESC;";
}

$result = mysqli_query($conn, $sql);
$aff = mysqli_affected_rows($conn);
$fetch = $aff > 0;
?>

<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="UTF-8">
    <title>BLOG WEBSITE</title>
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <?php require "./partials/links.php"; ?>
    <link rel="stylesheet" href="index.css">
    <link rel="stylesheet" href="./static/css/profileIndexCommonCard.css">
</head>

<body>
<?php require "./partials/sideBar.php"; ?>

<section class="home-section">
    <?php
    if (isset($_SESSION['username'])) {
        $currentUser = $_SESSION['username'];
        echo "<h3 class='text'> Welcome, $currentUser</h3>";
    } else {
        echo "<div class='text'>Blogs</div>";
    }
    ?>

    <!-- Search Form Wrapper -->
<div class="search-wrapper" style="position: absolute; top: 0; right: 0; padding: 10px;">
    <form method="post" class="search-form" style="display: flex; align-items: center;">
        <label for="search-input" class="sr-only">Search</label>
        <div style="position: relative;">
            <input 
                type="text" 
                id="search-input" 
                name="search"
                placeholder="Enter Username or Blog Title" 
                value="<?php echo htmlspecialchars($searchQuery); ?>" 
                style="padding: 5px 30px 5px 10px; width: 265px;"
            />
            <!-- Clear button -->
            <span 
                onclick="document.getElementById('search-input').value = ''" 
                style="position: absolute; right: 10px; top: 50%; transform: translateY(-50%); cursor: pointer; color: #888;"
            >
                &times;
            </span>
        </div>
        <button type="submit" style="padding: 5px; margin-left: 5px;">Search</button>
    </form>
</div>



    <div id="blogs" class="my-1 mb-6">
        <?php
        if ($fetch) {
            while ($data = mysqli_fetch_object($result)) {
                $blogSno = $data->blog_sno;
                $username = $data->username;
                $email = $data->email;
                $blogTitle = $data->blog_title;
                $blogSubtitle = $data->blog_subtitle;
                $blogContent = $data->blog_content;
                $mainContent = substr($blogContent, 0, 200);
                $readMore = substr($blogContent, 200);
                $blogTime = $data->time;
                $newDate = date("j-F Y", strtotime($blogTime));
                $newTime = date("l, g:i a", strtotime($blogTime));

                echo "
                <div class='card'>
                    <div class='image-data'>
                        <div class='background-image'></div>
                        <div class='publication-details'>
                            <a href='#' class='author'><i class='fas fas-user'></i>$username</a>
                            <span class='date'><i class='fas fa-calendar-alt'></i>$email</span>
                            <span class='date'><i class='fas fa-calendar-alt'></i>$newDate</span>
                            <span class='date'><i class='fas fa-calendar-alt'></i>$newTime</span>
                        </div>
                    </div>
                    <div class='post-data'>
                        <h1 class='title'>$blogTitle</h1>
                        <h2 class='subtitle'>$blogSubtitle</h2>
                        <p class='description'>
                            $mainContent<span class='dots'>.........</span><span class='more-text'>$readMore</span>
                        </p>
                        <div class='cta'>
                            <button class='read-more-btn' onclick='readMore(this)'>Read more</button>
                        </div>
                    </div>
                </div>";
            }
        } else {
            echo "<p>No blogs found for the search query.</p>";
        }
        ?>
    </div>
</section>

<script>
    function readMore(button) {
        const dots = button.parentElement.querySelector(".dots");
        const moreText = button.parentElement.querySelector(".more-text");

        if (dots.style.display === "none") {
            dots.style.display = "inline";
            moreText.style.display = "none";
            button.textContent = "Read more";
        } else {
            dots.style.display = "none";
            moreText.style.display = "inline";
            button.textContent = "Read less";
        }
    }
</script>
</body>
</html>

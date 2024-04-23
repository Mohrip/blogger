<?php include("path.php"); ?>
<?php include(ROOT_PATH . '/app/controllers/posts.php');
include(ROOT_PATH . '/comment/functions.php');

if (isset($_GET['id'])) {
  $post = selectOne('posts', ['id' => $_GET['id']]);
}
$topics = selectAll('topics');
$posts = selectAll('posts', ['published' => 1]);
$top_posts = topPost();


?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">


  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"
    integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
  <link href="https://fonts.googleapis.com/css?family=Candal|Lora" rel="stylesheet">


  <link rel="stylesheet" href="assets/css/style.css">


  <title><?php echo $post['title']; ?></title>
</head>

<body>
  <?php include(ROOT_PATH . "/app/includes/header.php"); ?>


  <div class="page-wrapper">


    <div class="content clearfix">

      <div class="main-content-wrapper">
        <div class="main-content single">
          <h1 class="post-title"><?php echo $post['title']; ?></h1>
          <video width="100%" height="300" controls style="<?php if(!isset($post['video'])) echo "display:none";?>">
              <source src="<?php if(isset($post['video'])) echo BASE_URL . '/assets/videos/' . $post['video'];?>" type="video/mp4"></video>
          <div class="post-content">
            <?php echo html_entity_decode($post['body']); ?>
          </div>
          <div class = "col-md-6 col-md-offset-3 rating-section" style="position:relative; left:60%; top:50px;">
          <?php if (isset($user_id)): ?>
            <form action = "single.php?id=<?php echo $post['id']; ?>" method = "post" id = "#rating_form">
            <select name="rating" class="rating">
             <option value="1">1</option>
             <option value="2">2</option>
             <option value="3">3</option>
             <option value="4">4</option>
             <option value="5">5</option>
            </select>
            <button type = "submit" name = "submit_rating"  class="btn btn-primary btn-xs pull-left submit-reply" style = "width:15%; height:50px; font-size:14px;">Submit Rating</button>
            </form>
			<?php else: ?>
				<div class="well" style="margin-top: 20px;">
					<h4 class="text-center"><a href="login.php">Log in</a> to rate a post</h4>
				</div>
			<?php endif ?>
           
          </div>
          <?php include(ROOT_PATH . "/comment/post_details.php"); ?>
        </div>
      </div>

      <div class="sidebar single">
        <div class="section popular">
          <h2 class="section-title">Top post</h2>

          <?php foreach ($top_posts as $p): ?>
            <div class="post clearfix">
              <img src="<?php  if (isset($p['image'])){ echo BASE_URL . '/assets/images/' . $p['image'];}
            else echo BASE_URL . '/comment/profile.png' ?>" alt="">
              <a href="single.php?id=<?php echo $p['id']; ?>" class="title">
                <h4><?php echo $p['title'] ?></h4>
              </a>
            </div>
          <?php endforeach; ?>
          

        </div>
      </div>
    </div>
  </div>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
  <script src="assets/js/scripts.js"></script>
  <script src="comment/scripts.js"></script>
</body>

</html>
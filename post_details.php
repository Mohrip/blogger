
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Comment and reply system in PHP</title>
	<link rel="stylesheet" href="main.css">
</head>
<body>
<div class="container">
	<div class="row">
	
		<div class="col-md-6 col-md-offset-3 comments-section">
			
			<?php if (isset($user_id)): ?>
				<form class="clearfix" action="single.php?id=<?php echo $post['id']; ?>" method="post" id="comment_form">
					<textarea name="comment_text" id="comment_text"  class="form-control" cols="30" rows="3"></textarea>
					<br><button type= "submit" name="comment_posted" class="btn btn-primary btn-sm pull-right" id="submit_comment" style = "width:15%; height:50px; font-size:14px;">Submit comment</button>
				</form>
			<?php else: ?>
				<div class="well" style="margin-top: 20px;">
					<h4 class="text-center"><a href="login.php">Log in</a> to post a comment</h4>
				</div>
			<?php endif ?>
			
			<h2><span id="comments_count"><?php echo count($comments) ?></span> Comment(s)</h2>
			<hr>
			
			<div id="comments-wrapper">
			<?php if (isset($comments)): ?>
				
				<?php foreach ($comments as $comment): ?>
				
				<div class="comment">
					<img src="comment\profile.png" style = "width: 35px; height: 35px; margin-right: 5px; float: left; border-radius: 50%; "alt="" class="profile_pic">
					<div class="comment-details">
						<span class="comment-name"><?php echo getUsernameById($comment['user_id']) ?></span>
						<span class="comment-date"><?php echo date("F j, Y ", strtotime($comment["created_at"])); ?></span>
						<p><?php echo $comment['body']; ?></p>
						<a class="reply-btn" href="#" data-id="<?php echo $comment['id']; ?>">reply</a>
					</div>
					
					<?php if (isset($user_id)): ?>
					<form action="single.php?id=<?php echo $post['id']; ?>" method = "post" class="reply_form clearfix" name = "comment_id" id="comment_reply_form_<?php echo $comment['id'] ?>" data-id="<?php echo $comment['id']; ?>">
						<textarea class="form-control" name="reply_text" id="reply_text" cols="30" rows="2"></textarea>
						<input type="hidden" id="comment_id" name="comment_id" value="<?php echo $comment['id'] ?>">
						<br><button type = "submit" name = "reply_posted"  class="btn btn-primary btn-xs pull-right submit-reply" style = "width:15%; height:50px; font-size:14px;  margin-bottom:5%;">Submit reply</button>
					</form>
					<?php else: ?>
						<div class="well" style="margin-top: 20px;">
							<h4 class="text-center"><a href="login.php">Log in</a> to reply</h4>
						</div>
					<?php endif ?>

					
					<?php $replies = getRepliesByCommentId($comment['id']) ?>
					<div class="replies_wrapper_<?php echo $comment['id']; ?>">
						<?php if (isset($replies)): ?>
							<?php foreach ($replies as $reply): ?>
								<!-- reply -->
								<div class="comment reply clearfix">
								<img src="comment\profile.png" style = "width: 35px; height: 35px; margin-right: 5px; float: left; border-radius: 50%; "alt="" class="profile_pic">
									<div class="comment-details">
										<span class="comment-name"><?php echo getUsernameById($reply['user_id']) ?></span>
										<span class="comment-date"><?php echo date("F j, Y ", strtotime($reply["created_at"])); ?></span>
										<p><?php echo $reply['body']; ?></p>
										<a class="reply-btn" href="#">reply</a>
									</div>
								</div>
							<?php endforeach ?>
						<?php endif ?>
					</div>
				</div>
					
				<?php endforeach ?>
			<?php else: ?>
				<h2>Be the first to comment on this post</h2>
			<?php endif ?>
			</div>
		</div>
	</div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script src="scripts.js"></script>
</body>
</html>
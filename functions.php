<?php 
	if (isset($_SESSION['id'])){
		$user_id = $_SESSION['id'];
	}
	
	$db = mysqli_connect("localhost", "root", "", "blog");
	$post_query_result = mysqli_query($db, "SELECT * FROM posts WHERE id=" . $_GET['id'] . "");
	$post = mysqli_fetch_assoc($post_query_result);

	$comments_query_result = mysqli_query($db, "SELECT * FROM comment WHERE post_id=" . $post['id'] . " ORDER BY created_at DESC");
	$comments = mysqli_fetch_all($comments_query_result, MYSQLI_ASSOC);

	if (isset($_POST['submit_rating'])){
		$count = rated();
		if($count == 0){
			global $db;
			$rating = $_POST['rating'];
			$sql = "INSERT INTO ratings (user_id, post_id, rating) VALUES (".$user_id.", " . $_GET['id'] . ", ".$rating.")";
			mysqli_query($db, $sql);
		}else{
			global $db;
			$rating = $_POST['rating'];
			$sql = "update ratings set rating =". $_POST['rating']." where user_id =".$user_id." and post_id =". $_GET['id']."";
			mysqli_query($db, $sql);
		}
		
	}

	function rated(){
		global $db;
		$sql = "select count(*) as c from ratings where user_id = ". $_SESSION['id']." and post_id = ". $_GET['id']."";
		$result = mysqli_query($db, $sql);
		$data = mysqli_fetch_assoc($result);
		return $data['c'];	
	}
	function getUsernameById($id)
	{
		global $db;
		$result = mysqli_query($db, "SELECT username FROM users WHERE id=" . $id . " LIMIT 1");
		return mysqli_fetch_assoc($result)['username'];
	}

	function getRepliesByCommentId($id)
	{
		global $db;
		$result = mysqli_query($db, "SELECT * FROM reply WHERE comment_id=$id");
		$replies = mysqli_fetch_all($result, MYSQLI_ASSOC);
		return $replies;
	}
	
	function getCommentsCountByPostId($post_id)
	{
		global $db;
		$result = mysqli_query($db, "SELECT COUNT(*) AS total FROM comment where post_id = $post_id");
		$data = mysqli_fetch_assoc($result);
		return $data['total'];
	}
	
	
if (isset($_POST['comment_posted'])) {
	global $db;
	
	$comment_text = $_POST['comment_text'];
	
	$sql = "INSERT INTO comment (post_id, user_id, body, created_at, updated_at) VALUES (".$_GET['id'].", " . $user_id . ", '$comment_text', now(), null)";
	$result = mysqli_query($db, $sql);
	
	$inserted_id = $db->insert_id;
	$res = mysqli_query($db, "SELECT * FROM comment WHERE id=$inserted_id");
	$inserted_comment = mysqli_fetch_assoc($res);
	
	if ($result) {
		$comment = "<div class='comment clearfix'>
		<img src='comment\profile.png' style = 'width: 35px; height: 35px; margin-right: 5px; float: left; border-radius: 50%; 'alt='' class='profile_pic'>
					<div class='comment-details'>
						<span class='comment-name'>" . getUsernameById($inserted_comment['user_id']) . "</span>
						<span class='comment-date'>" . date('F j, Y ', strtotime($inserted_comment['created_at'])) . "</span>
						<p>" . $inserted_comment['body'] . "</p>
						<a class='reply-btn' href='#' data-id='" . $inserted_comment['id'] . "'>reply</a>
					</div>
					<!-- reply form -->
					<form action='single.php?id=". $post['id'] ."' method = 'post' name = 'comment_id' class='reply_form clearfix' id='comment_reply_form_" . $inserted_comment['id'] . "' data-id='" . $inserted_comment['id'] . "'>
						<textarea class='form-control' name='reply_text' id='reply_text' cols='30' rows='2'></textarea>
						<br><button class='btn btn-primary btn-xs pull-right submit-reply' style = 'width:15%; height:50px; font-size:14px;  margin-bottom:5%;'>Submit reply</button>
					</form>
				</div>";
		$comment_info = array(
			'comment' => $comment,
			'comments_count' => getCommentsCountByPostId($_GET['id'])
		);
		echo json_encode($comment_info);
		exit();
	} else {
		echo "error";
		exit();
	}
}


if (isset($_POST['reply_posted'])) {
	global $db;

	$reply_text = $_POST['reply_text']; 
	$comment_id = $_POST['comment_id']; 

	$sql = "INSERT INTO reply (user_id, comment_id, body, created_at, updated_at) VALUES (" . $user_id . ", $comment_id, '$reply_text', now(), null)";
	$result = mysqli_query($db, $sql);
	$inserted_id = $db->insert_id;
	$res = mysqli_query($db, "SELECT * FROM reply WHERE id=$inserted_id");
	$inserted_reply = mysqli_fetch_assoc($res);

	if ($result) {
		$reply = "<div class='comment reply clearfix'>
		<img src='comment\profile.png' style = 'width: 35px; height: 35px; margin-right: 5px; float: left; border-radius: 50%; 'alt='' class='profile_pic'>
					<div class='comment-details'>
						<span class='comment-name'>" . getUsernameById($inserted_reply['user_id']) . "</span>
						<span class='comment-date'>" . date('F j, Y ', strtotime($inserted_reply['created_at'])) . "</span>
						<p>" . $inserted_reply['body'] . "</p>
						<a class='reply-btn' href='#'>reply</a>
					</div>
				</div>";
		//echo json_encode($reply);
		//exit();
	} else {
		echo "error";
		exit();
	}
}
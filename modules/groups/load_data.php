<?php
	if ($_SESSION['permissions'] != 'admin')
	{
		header('Location: /');
		exit();
	}

	$sql = "SELECT COUNT(id_group) AS total FROM groups WHERE school_period = '".$_SESSION['school_period']."'";

	if ($result = $conexion -> query($sql))
	{
		if ($row = mysqli_fetch_array($result))
		{
			$tpages = ceil($row['total'] / $max);
		}
	}

	if (!empty($_POST['search']))
	{
		$_SESSION['group'] = array();
		$_SESSION['group_school_period'] = array();
		$_SESSION['group_name'] = array();
		$_SESSION['group_semester'] = array();

		$i = 0;

		$sql = "SELECT * FROM groups WHERE id_group = '".$_POST['search']."' AND school_period = '".$_SESSION['school_period']."' OR name = '".$_POST['search']."' AND school_period = '".$_SESSION['school_period']."'";

		if ($result = $conexion -> query($sql))
		{
			while ($row = mysqli_fetch_array($result))
			{
				$_SESSION['group'][$i] = $row['id_group'];
				$_SESSION['group_school_period'] =  $row['school_period'];
				$_SESSION['group_name'][$i] = $row['name'];
				$_SESSION['group_semester'][$i] = $row['semester'];

				$i += 1;
			}
		}
		$_SESSION['total_groups'] = count($_SESSION['group']);
	}
	else
	{
		$_SESSION['group'] = array();
		$_SESSION['group_school_period'] = array();
		$_SESSION['group_name'] = array();
		$_SESSION['group_semester'] = array();

		$i = 0;

		$sql = "SELECT * FROM groups WHERE school_period = '".$_SESSION['school_period']."' ORDER BY name LIMIT $inicio, $max";

		if ($result = $conexion -> query($sql))
		{
			while ($row = mysqli_fetch_array($result))
			{
				$_SESSION['group'][$i] = $row['id_group'];
				$_SESSION['group_school_period'][$i] =  $row['school_period'];
				$_SESSION['group_name'][$i] = $row['name'];
				$_SESSION['group_semester'][$i] = $row['semester'];

				$i += 1;
			}
		}
		$_SESSION['total_groups'] = count($_SESSION['group']);
	}
?>
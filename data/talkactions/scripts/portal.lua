By: Roger
(!empty($_REQUEST['name'])){
    if (ereg("^[A-Za-z0-9 -]+$",$_REQUEST['name'])){
    if (file_exists($dirplayer.$_REQUEST['name'].".xml")){
    $lines = file($dirplayer.$_REQUEST['name'].'.xml');
     $pieces = explode('"',$lines[1]);
        $old = '1';
        $new = '0';
    
    
    file_put_contents($dirplayer.$_REQUEST['name'].'.xml',str_replace('banned="'.$old,'banned="'.$new,file_get_contents($dirplayer.$_REQUEST['name'].'.xml')));
    echo "<p><b>Character has been Unbanned !</b></p>";

}else{$error = "It doesn't exist.";}
}else{$error = "Name is not valid.";}
}

?>
<br>
<h2>Unban Character</h2>
<form method="get" action="<?=$_SERVER['PHP_SELF']?>"> 
<input type="text" name="name"/>  
<input type="submit" value="Unban"/> 
</form>
</div>
function button ($title,$mailbx) {

###################Load Assembly for creating form & button######

[void][System.Reflection.Assembly]::LoadWithPartialName( “System.Windows.Forms”)
[void][System.Reflection.Assembly]::LoadWithPartialName( “Microsoft.VisualBasic”)

#####Define the form size & placement

$form = New-Object “System.Windows.Forms.Form”;
$form.Width = 500;
$form.Height = 150;
$form.Text = $title;
$form.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterScreen;

##############Define text label1
$textLabel1 = New-Object “System.Windows.Forms.Label”;
$textLabel1.Left = 25;
$textLabel1.Top = 15;

$textLabel1.Text = $mailbx;


############Define text box1 for input
$textBox1 = New-Object “System.Windows.Forms.TextBox”;
$textBox1.Left = 150;
$textBox1.Top = 10;
$textBox1.width = 200;



#############Define default values for the input boxes
$defaultValue = “”
$textBox1.Text = $defaultValue;
#$textBox2.Text = $defaultValue;
#$textBox3.Text = $defaultValue;

#############define OK button
$button = New-Object “System.Windows.Forms.Button”;
$button.Left = 360;
$button.Top = 85;
$button.Width = 100;
$button.Text = “Ok”;

############# This is when you have to close the form after getting values
$eventHandler = [System.EventHandler]{
$textBox1.Text;

$form.Close();};

$button.Add_Click($eventHandler) ;

#############Add controls to all the above objects defined
$form.Controls.Add($button);
$form.Controls.Add($textLabel1);

$form.Controls.Add($textBox1);

$ret = $form.ShowDialog();

#################return values

return $textBox1.Text,$textBox2.Text
}

$return= button “Hidden Folders” “Enter folder path”



$ret1=$return[0]
Write-Host $ret1

$Filepath = Get-Item -path "$ret1" -Force   
 $Filepath.Attributes = "System,Hidden,ReadOnly"

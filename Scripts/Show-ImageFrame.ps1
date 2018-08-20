<#
.SYNOPSIS
  Lorem ipsum dolor sit amet, consectetur adipiscing.
.DESCRIPTION
  Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
.NOTES
  Version:        1.0
  Author:         Hackstur
  Creation Date:  19/08/2018
  Purpose/Change: Initial script development
.EXAMPLE
  Example code.
#>
$file = (get-item "c:\image.jpg")

[void][reflection.assembly]::LoadWithPartialName("System.Windows.Forms")
$form = new-object Windows.Forms.Form
$form.Text = "Image Viewer"
$form.width = 1280
$form.height = 1024
$pictureBox = new-object Windows.Forms.PictureBox
$pictureBox.Width = 1280
$pictureBox.Height = 1024

$pictureBox.Image = [System.Drawing.Image]::Fromfile($file)
$form.controls.add($pictureBox)
$form.Add_Shown( { $form.Activate() } )
$form.ShowDialog()
exit
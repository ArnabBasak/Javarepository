function div_show() {
document.getElementById('abc').style.display = "block";
}
//Function to Hide Popup
function div_hide(){
document.getElementById('abc').style.display = "none";
}
// function to text checkbox
function check_text(){
var str = document.getElementById('name').value
if (str == "")
{
alert('please enter the store number')
}
else
{
	//alert(str);
	window.open('pilotanalytics.jsp')
}
}
function ShowHideDiv() {
		var checksdt = document.getElementById("checksdt")
		var checknonsdt = document.getElementById("checknonsdt")
		dvtextbox.style.display = checksdt.checked ? "block" : "none"
    }
function checkallstores()
{
	    var checksdt = document.getElementById("checksdt")
		var checknonsdt = document.getElementById("checknonsdt")
		if (checksdt.checked || checknonsdt.checked)
		{
			if(dvtextbox.style.display == "none")
			{
				window.open("sdtrolloutanalytics.jsp")
			}
			else if(dvtextbox.style.display == "block" && document.getElementById('name').value != "")
				{
					var Ips =["10.36.65.1","10.36.66.1","10.36.68.1","10.36.82.1"] 
					setTimeout(window.open('NonSDTRolloutpage.html'),5000)
				}
			else
				alert('please fill the values properly')
							
		}
		else
		{
			alert('please enter all the values properly')
		}
}
function checkdevstores()
{
	    var checksdt = document.getElementById("checksdt")
		var checknonsdt = document.getElementById("checknonsdt")
		if (checksdt.checked || checknonsdt.checked)
		{
			if(dvtextbox.style.display == "none")
			{
				window.open("Basic analytics.html")
			}
			else if(dvtextbox.style.display == "block" && document.getElementById('name').value != "")
				{
					var Ips =["10.36.65.1","10.36.66.1","10.36.68.1","10.36.82.1"] 
					setTimeout(window.open('Basic analytics.html'),5000)
				}
			else
				alert('please fill the values properly')
							
		}
		else
		{
			alert('please enter all the values properly')
		}
}

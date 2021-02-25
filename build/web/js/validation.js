function checkCaptcha()
{
	var x = document.getElementById("realCP").value;
	var element = document.getElementById("CP").value;
	if (x !== element)
	{
		document.getElementById("wrongData").innerHTML = "Captcha is not correct.";
		changeCap();
		return false;
	}
	return true;
}

function checkDate()
{
	var flag = true;
	var checkIn = document.getElementById("checkIn").value;
    var checkOut = document.getElementById("checkOut").value;

	var numberOfRooms = document.getElementById("numberOfRooms").value;
	
	var adult = document.getElementById("adult").value;
    var children = document.getElementById("children").value;

	var total_adult = document.getElementById("max_adult").value * numberOfRooms;
    var total_children = document.getElementById("max_children").value * numberOfRooms;
	
	const date1 = new Date(checkOut);
	const date2 = new Date(checkIn);
	const diffTime = (date1 - date2);
	const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24)); 
	if(diffDays == 0)
	{
		document.getElementById("wrongDate").innerHTML = "Check-In and Check-Out Can't be in the same day.";
		flag = false;
	}
	else if(diffDays < 0)
	{
		document.getElementById("wrongDate").innerHTML = "Check-In Date Must be before Check-Out Date.";
		flag = false;
	}
	if(adult > total_adult)
	{
		document.getElementById("wrongAdults").innerHTML = "Adults number exceeded max Capacity.";
		flag = false;
	}
	else
	{
		document.getElementById("wrongAdults").innerHTML = "";
	}
	if(children > total_children)
	{
		document.getElementById("wrongChildren").innerHTML = "Children number exceeded max Capacity.";
		flag = false;
	}
	else
	{
		document.getElementById("wrongChildren").innerHTML = "";
	}
	
	return flag;
}
function checkRate()
{
	var flag = true;
	var userRate = document.getElementById("userRate").value;
    var comment = document.getElementById("comment").value;
    if(userRate === "")
	{
		document.getElementById("wrongRate").innerHTML = "Hotel rate is required.";
		flag = false;
		
	}
	else
	{
		document.getElementById("wrongRate").innerHTML = "";
	}
	if(comment === "")
	{
		document.getElementById("wrongComment").innerHTML = "Comment is required.";
		flag = false;
	}
	else
	{
		document.getElementById("wrongComment").innerHTML = "";
	}
	return flag;
}

function checkUpdateProfile()
{
	
	var flag = true;
	var name = document.getElementById("name").value;
    var email = document.getElementById("email").value;
    var phonenumber = document.getElementById("phonenumber").value;
	var x = document.getElementById("Password1").value;
	var element = document.getElementById("Password2").value;
	
	if(x === "" || element === "")
	{
		document.getElementById("wrongData").innerHTML = "Password is Required.";
		flag = false;
	}
	else if (x !== element)
	{
		document.getElementById("wrongData").innerHTML = "Password is not Identical.";
		flag = false;
	}
	else
    {
		document.getElementById("wrongData").innerHTML = "";
    }
	if(name === ""){
        document.getElementById("n").innerHTML="name can’t be empty!";
        flag = false;
    }
    else
    {
        document.getElementById("n").innerHTML="";
    }
    if(email === "")
    {
        document.getElementById("e").innerHTML="email can’t be empty!";
        flag = false;

    }
    else
    {
        document.getElementById("e").innerHTML=" ";
    }    
    
    if(isNaN(phonenumber)|| phonenumber==="")
    {
        document.getElementById("p").innerHTML="Enter phone number correctly!";
        flag = false;
    }
    else
    {
        document.getElementById("p").innerHTML="";
    }
    return flag;
}


function checkPassword()
{
	var x = document.getElementById("Password1").value;
	var element = document.getElementById("Password2").value;
	
	
}

function changeCap()
{
	var result           = '';
	var characters       = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
	var charactersLength = characters.length;
	for ( var i = 0; i < 6 ; i++ ) {
	   result += characters.charAt(Math.floor(Math.random() * charactersLength));
	}
	document.getElementById("realCP").value = result;
	document.getElementById("realCP").innerHTML = result;

}
/*
function loginCheck()
{
	var email = document.getElementById("email").value;
	var pass = document.getElementById("pass").value;
	const orders = new XMLHttpRequest();
	var url = "CheckLogin?email=" + email + "&password=" + pass;
	orders.open("GET", url);
	orders.send();
	bool = false;
	orders.onreadystatechange = (e) => {
		if (orders.readyState == 4 && orders.status == 200)
		{
			var order = orders.response;
			console.log(order);
			if (order == "no")
			{
				document.getElementById("wrongDate").innerHTML = "Invalid Email or Password.";

			}
		}
	}
}
*/
function check()
{
	
	var flag = true;
	var name = document.getElementById("name").value;
    var email = document.getElementById("email").value;
    var phonenumber = document.getElementById("phonenumber").value;
    var userName = document.getElementById("userName").value;
	if(checkCaptcha() === false)
	{
			changeCap();
			flag = false;
	}
	if(userName === ""){
        document.getElementById("ua").innerHTML="user name can’t be empty!";
        flag = false;
    }
    else
    {
        document.getElementById("n").innerHTML="";
    }
	if(name === ""){
        document.getElementById("n").innerHTML="name can’t be empty!";
        flag = false;
    }
    else
    {
        document.getElementById("n").innerHTML="";
    }
    if(email === "")
    {
        document.getElementById("e").innerHTML="email can’t be empty!";
        flag = false;

    }
    else
    {
        document.getElementById("e").innerHTML=" ";
    }    
    
    if(isNaN(phonenumber)|| phonenumber==="")
    {
        document.getElementById("p").innerHTML="Enter phone number correctly!";
        flag = false;
    }
    else
    {
        document.getElementById("p").innerHTML="";
    }
    return flag;
}


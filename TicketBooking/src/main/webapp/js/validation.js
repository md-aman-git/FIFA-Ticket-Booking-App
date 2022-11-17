function ValidateEmail()
{
var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
var inputText = document.form1.text1;
var f = true;
if(inputText.value.match(mailformat))
{
}
else
{
alert("You have entered an invalid email address!");
document.form1.text1.focus();
f=false;
}
var letters = /^[A-Za-z]+$/;
var fname=document.form1.text2;
var lname=document.form1.text3;
if(fname.value.match(letters) && lname.value.match(letters))
{
}
else
{
alert('Please input alphabet characters only');
f=false;
}

var phoneno = /^\d{10}$/;
var phone= document.form1.text4;
if(phone.value.match(phoneno))
{
}
else
{
alert("Enter mobile number properly");
    f=false;
}
var decimal= /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{8,15}$/;
var password=document.getElementById('password').value;
var password2=document.getElementById('password2').value;
console.log("d" + password+" Hello "+password2);
if(password.match(decimal))
{
}
else
{
alert('Wrong...!')
f=false;
}
if(password.length!=password2.length)
{
    f=false;
    alert("wrong confirm password"+ password);
}
for (let i = 0; i < password.length; i++) {
    if(password.charAt(i)!=password2.charAt(i))
    {
        f=false;
        alert("wrong confirm password value "+password);
        break;
    }
  }

        return f;
}
function request(url)
{
        var r = new XMLHttpRequest();
        r.open('GET', url, false);
        r.send(); // wait for result firs

        if (r.status == 200)
        return r.responseText;

        return null;
}

function create_bc()
{
var bl = document.getElementById('block-log');
var res = request('test.lua');
if(res != null)
{
        bl.innerHTML = '<span class="note">:D</span>';
}
else
bl.innerHTML = '<span class="note">Faled!</span>'
}

function do_stuff()
{
        var blk = document.getElementById('block-ls');
        var res = request('/sh/lsback.sh');

        var output = ''; // generated html code
        var array = res.split('\n'); // split new lines into array elements
        for (var i = 0;i < array.length; i++) // loop thru array elements
        {
                if (array[i].length == 0) break; // empty line at the end
                output += '<a href="/mybackups/' + array[i] + '">click to download th>
        }


        if (res != null)
           blk.innerHTML = output; // insert generated html code
        else
          blk.innerHTML = '<span class="note">request failed!</span>';

}

function do_stuff2()
{
        var res2 = request('/sh/back.sh');
}


function do_stuff3()
{
//      var text = document.getElementById("res").value
        var res3 = request('/sh/resback.sh' + res.value);
}
function do_stuff4()
{
//      var text = document.getElementById("rm").value
        var res4 = request('/sh/rmback.sh' + rm.value);
}

function main()
{
        var btn = document.getElementById('button-ls');
        btn.addEventListener('click', do_stuff, false);

        var btn2 = document.getElementById('button-back');
        btn2.addEventListener('click', do_stuff2, false);

        var btn3 = document.getElementById('button-res');
        btn3.addEventListener('click', do_stuff3, false);

        var btn4 = document.getElementById('button-rm');
        btn4.addEventListener('click', do_stuff4, false);
}
window.addEventListener('load', main, false);



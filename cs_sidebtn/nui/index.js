let idshowing = []

function remove_array_element(array, n)
 {
   var index = array.indexOf(n);
   if (index > -1) {
    array.splice(index, 1);
}
   return array;
 }

window.addEventListener('message', (event) => {
    item = event.data;
	switch (event.data.action) {
		case 'add':
            if(!idshowing.includes(item.id)) {
                document.getElementById("help").innerHTML += '<div id="'+item.id+'" class="infor"><span class="what">'+item.text+'</span> <span class="letter">'+item.prz+'</span></div>';
                idshowing.push(item.id);
            }
        break;
        case 'remove':
            document.getElementById(item.id).remove();
            remove_array_element(idshowing, item.id)
        break;
        case 'edit':
            if(idshowing.includes(item.id)) {
                document.getElementById(item.id).innerHTML = '<span class="what">'+item.text+'</span> <span class="letter">'+item.prz+'</span>';
            }
        break;
    }
});
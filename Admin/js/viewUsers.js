import { initializeApp } from "https://www.gstatic.com/firebasejs/9.6.4/firebase-app.js";
import { getDatabase, ref, onValue, remove} from 'https://www.gstatic.com/firebasejs/9.6.4/firebase-database.js';

// Your web app's Firebase configuration
const firebaseConfig = {
    apiKey: "AIzaSyAARVObDcEYn1GQ5shl58Srqk40bjtk-PI",
    authDomain: "secondhand-book-241ae.firebaseapp.com",
    projectId: "secondhand-book-241ae",
    storageBucket: "secondhand-book-241ae.appspot.com",
    messagingSenderId: "252665153542",
    appId: "1:252665153542:web:ed9ddc9225c7f4573adb87"
};
const app = initializeApp(firebaseConfig);

let usersData = [];
const db = getDatabase();
var Data = [];

onload = getUsers();

function getUsers() {
    var table = document.querySelector("table");
    var tableHead = table.querySelector("thead");
    var tableBody = table.querySelector("tbody");

    tableHead.innerHTML = '<div class="text-center"> <div class="spinner-border" role="status"><span class="sr-only">Loading...</span></div></div>';

    onValue(ref(db, 'users'), (snapshot) => {
        snapshot.forEach(element => {
            const childKey = element.key;
            const childData = element.val();
            usersData.push({ childKey, childData })
        });

        tableHead.innerHTML = '<tr class="table bg-light text-dark text-center"><th scope="col">Sr No</th><th scope = "col"> Name</th> <th scope="col">Email ID</th><th scope="col">Gender</th><th scope="col">Contact No</th><th scope="col">City</th><th scope="col">Action</th></tr > ';

        tableBody.innerHTML = "";

        usersData.forEach((element, index) => {
            Data.push(element.childData)

            for (const row of Data) {
                var rowElement = document.createElement('tr');

                const no = document.createElement('td');
                no.textContent = index + 1;

                const name = document.createElement('td');
                name.textContent = row.name;

                const email = document.createElement('td');
                email.textContent = row.regEmail;

                const gender = document.createElement('td');
                gender.textContent = row.gender;

                const contactNo = document.createElement('td');
                contactNo.textContent = row.contactNo;

                const city = document.createElement('td');
                city.textContent = row.city;

                const buttons = document.createElement('td');
                let viewBtn = document.createElement("button");
                viewBtn.innerHTML = "<i class='fa fa-eye'></i>";
                viewBtn.type = "button";
                viewBtn.name = "deleteBtn";
                viewBtn.className = "btn btn-secondary m-1";
                viewBtn.onclick = function () {
                    viewUser(element.childKey);
                    $("#viewUserModel").modal()
                }
                let deleteBtn = document.createElement("button");
                deleteBtn.innerHTML = "<i class='fa fa-trash'></i>";
                deleteBtn.type = "button";
                deleteBtn.name = "deleteBtn";
                deleteBtn.className = "btn btn-danger m-1";
                deleteBtn.onclick = function () {
                    deleteUser(element.childKey);
                }

                buttons.appendChild(viewBtn);
                buttons.appendChild(deleteBtn);

                rowElement.appendChild(no);
                rowElement.appendChild(no);
                rowElement.appendChild(name);
                rowElement.appendChild(email);
                rowElement.appendChild(gender);
                rowElement.appendChild(contactNo);
                rowElement.appendChild(city);
                rowElement.appendChild(buttons);
            }
            tableBody.appendChild(rowElement);
        })
    })
}

function deleteUser(userKey) {
    if (confirm("Can you delete this user?")) {
        usersData = [];
        remove(ref(db, 'users/' + userKey))
    }
}
function viewUser(userKey) {
    onValue(ref(db, 'users/' + userKey), (snapshot) => {
        const user = snapshot.val();
        document.getElementById('viewName').innerHTML = user.name;
        document.getElementById('viewEmail').innerHTML = user.regEmail;
        document.getElementById('viewGender').innerHTML = user.gender;
        document.getElementById('viewContactNo').innerHTML = user.contactNo;
        document.getElementById('viewCity').innerHTML = user.city;
    })
}


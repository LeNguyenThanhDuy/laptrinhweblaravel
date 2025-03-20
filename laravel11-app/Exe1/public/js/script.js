/*Login*/
document.getElementById('login-form').addEventListener('submit', function(event) {
    event.preventDefault();
    
    let username = document.getElementById('username').value;
    let password = document.getElementById('password').value;
    let remember = document.getElementById('remember').checked;

    if (username && password) {
        alert(`Đăng nhập thành công!\nUsername: ${username}\nGhi nhớ: ${remember ? 'Có' : 'Không'}`);
    } else {
        alert('Vui lòng nhập đầy đủ thông tin!');
    }
});

/*Register */
document.getElementById("register-form").addEventListener("submit", function(event) {
    event.preventDefault();

    let password = document.getElementById("password").value;
    let confirmPassword = document.getElementById("confirm-password").value;

    if (password !== confirmPassword) {
        alert("Mật khẩu nhập lại không khớp!");
        return;
    }

    alert("Đăng ký thành công!");
    // Thêm xử lý gửi dữ liệu đến server tại đây
});
/*Update*/ 
document.getElementById("update-form").addEventListener("submit", function(event) {
    event.preventDefault();

    let password = document.getElementById("password").value;
    let confirmPassword = document.getElementById("confirm-password").value;

    if (password !== confirmPassword) {
        alert("Mật khẩu nhập lại không khớp!");
        return;
    }

    alert("Cập nhật thông tin thành công!");
    // Thêm xử lý gửi dữ liệu lên server tại đây
});
/*List*/
document.addEventListener("DOMContentLoaded", function () {
    const userList = [
        { id: 1, username: "UPVH", email: "ATJW@gmail.com" },
        { id: 2, username: "IFUK", email: "KULB@gmail.com" },
        { id: 3, username: "DZZQ", email: "ERNB@gmail.com" },
        { id: 4, username: "NJYY", email: "ROIF@gmail.com" },
        { id: 5, username: "YUMG", email: "KITN@gmail.com" },
        { id: 6, username: "WZSU", email: "CVTL@gmail.com" },
        { id: 7, username: "WXFQ", email: "MIUZ@gmail.com" },
        { id: 8, username: "XZOR", email: "YZLV@gmail.com" },
        { id: 9, username: "HGGO", email: "OYYX@gmail.com" },
        { id: 10, username: "PXZX", email: "YSML@gmail.com" }
    ];

    const tableBody = document.getElementById("user-table");

    if (!tableBody) {
        console.error("Không tìm thấy bảng user-table. Kiểm tra lại HTML!");
        return;
    }

    tableBody.innerHTML = ""; // Xóa nội dung cũ trước khi thêm mới

    userList.forEach(user => {
        const row = document.createElement("tr");
        row.innerHTML = `
        <td>${user.id}</td>
        <td>${user.username}</td>
        <td>${user.email}</td>
        <td>
            <a href="update.html?id=${user.id}">Edit</a> |
            <a href="view.html?id=${user.id}">View</a> |
            <a href="#" onclick="deleteUser(${user.id})">Delete</a>
        </td>
    `;
        tableBody.appendChild(row);
    });
});


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="icon" type="image/png" sizes="16x16" href="/webdev/kitty.png">
    <title>Insert title here</title>

    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        form {
            max-width: 600px;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        table {
            width: 100%;
        }

        caption {
            font-size: 1.5em;
            margin-bottom: 10px;
        }

        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            width: 30%;
        }

        input[type="text"],
        input[type="password"],
        textarea {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="submit"] {
            background-color: #4caf50;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 1em;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

    <form name="myform" method="post" action="insertAction">
        <table>
            <caption>게시물 글쓰기</caption>
            <tr>
                <th>제목</th>
                <td><input type="text" name="title" autofocus required /></td>
            </tr>
            <tr>
                <th>이름</th>
                <td><input type="text" name="name" required /></td>
            </tr>
            <tr>
                <th>비밀번호</th>
                <td><input type="password" name="password" required /></td>
            </tr>
            <tr>
                <th>내용</th>
                <td><textarea name="content" rows="5" cols="40"></textarea></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="완료" />
                </td>
            </tr>
        </table>
    </form>

</body>
</html>
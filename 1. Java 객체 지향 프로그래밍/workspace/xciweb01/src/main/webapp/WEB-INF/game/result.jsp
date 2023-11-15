<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        table {
            border-collapse: collapse;
            width: 60%;
            margin-top: 30px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
        }

        caption {
            font-size: 1.5em;
            margin-bottom: 10px;
        }

        th, td {
            padding: 15px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #4caf50;
            color: white;
        }

        tr:hover {
            background-color: #f5f5f5;
        }

        td {
            font-weight: bold;
        }

        td.empty {
            width: 20px;
            background-color: #f5f5f5;
        }

        td.result {
            background-color: #f0f0f0;
            font-style: italic;
            color: #666;
        }
    </style>

</head>
<body>

<table>
	<caption>결과</caption>
	<tr>
		<th>you</th>
		<th>vs</th>
		<th>com</th>
	</tr>
	<tr>
		<td>${you}</td>
		<td></td>
		<td>${com}</td>
	</tr>
	<tr>
		<td colspan="3">${result}</td>
	</tr>
</table>

</body>
</html>
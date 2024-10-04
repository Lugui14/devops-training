let database = null;

initSqlJs({
  locateFile: (file) => `https://sql.js.org/dist/${file}`,
}).then((SQL) => {
  const db = new SQL.Database();

  db.run(
    "CREATE TABLE IF NOT EXISTS todo (id SERIAL PRIMARY KEY, description TEXT)"
  );

  db.run(
    "INSERT INTO todo (id, description) VALUES (1, 'Learn SQL') ON CONFLICT DO NOTHING"
  );

  const stmt = db.prepare("SELECT * FROM todo");

  while (stmt.step()) {
    const row = stmt.getAsObject();

    const todo = document.createElement("li");
    todo.textContent = row.description;

    document.getElementById("todos").appendChild(todo);
  }

  database = db;
});

function addTodo() {
  const description = document.getElementById("description").value;

  if (!description) {
    return;
  }

  const stmt = database.prepare(
    "INSERT INTO todo (description) VALUES (:description)"
  );
  stmt.bind({ ":description": description });
  stmt.step();

  const todo = document.createElement("li");
  todo.textContent = description;

  document.getElementById("todos").appendChild(todo);
  document.getElementById("description").value = "";
}

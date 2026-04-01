# Database manager for storing room and item data
extends Node

var db = null
var db_path = "user://dollhouse.db"

func _ready():
    # Initialize database
    init_database()

func init_database():
    # Create SQLite database connection
    db = SQLite.new()
    var error = db.open(db_path)
    
    if error != OK:
        print("Error opening database: ", error)
        return
    
    # Create tables if they don't exist
    create_tables()

func create_tables():
    # Create rooms table
    db.execute("""
        CREATE TABLE IF NOT EXISTS rooms (
            room_id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            background_image TEXT,
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        )
    """)
    
    # Create items table
    db.execute("""
        CREATE TABLE IF NOT EXISTS items (
            item_id INTEGER PRIMARY KEY AUTOINCREMENT,
            room_id INTEGER NOT NULL,
            position_x REAL NOT NULL,
            position_y REAL NOT NULL,
            position_z REAL DEFAULT 0.0,
            rotation REAL DEFAULT 0.0,
            scale_x REAL DEFAULT 1.0,
            scale_y REAL DEFAULT 1.0,
            item_type TEXT NOT NULL,
            sprite_path TEXT,
            FOREIGN KEY (room_id) REFERENCES rooms(room_id)
        )
    """)

func create_room(name: String, background_image: String = "") -> int:
    var room_id = -1
    db.execute("INSERT INTO rooms (name, background_image) VALUES (?, ?)", [name, background_image])
    
    # Get the last inserted row ID
    var result = db.get_last_insert_row_id()
    if result.size() > 0:
        room_id = result[0]
    
    return room_id

func save_item(room_id: int, position: Vector2, rotation: float, scale: Vector2, 
               item_type: String, sprite_path: String) -> bool:
    var error = db.execute("""
        INSERT INTO items (room_id, position_x, position_y, position_z, rotation, 
                          scale_x, scale_y, item_type, sprite_path)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
    """, [room_id, position.x, position.y, 0.0, rotation, scale.x, scale.y, item_type, sprite_path])
    
    return error == OK

func load_room_items(room_id: int) -> Array:
    var items = []
    var result = db.execute("SELECT * FROM items WHERE room_id = ?", [room_id])
    
    if result.size() > 0:
        for row in result[1]:
            var item_data = {
                "item_id": row[0],
                "room_id": row[1],
                "position_x": row[2],
                "position_y": row[3],
                "position_z": row[4],
                "rotation": row[5],
                "scale_x": row[6],
                "scale_y": row[7],
                "item_type": row[8],
                "sprite_path": row[9]
            }
            items.append(item_data)
    
    return items

func delete_room(room_id: int) -> bool:
    # First delete all items in the room
    db.execute("DELETE FROM items WHERE room_id = ?", [room_id])
    
    # Then delete the room
    var error = db.execute("DELETE FROM rooms WHERE room_id = ?", [room_id])
    
    return error == OK

func _exit_tree():
    if db:
        db.close()

CREATE TABLE users (                    --ユーザーテーブル制作
    name TEXT,
    password_hash TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,  
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO  users(name, password_hash, email)
VALUES (
        '前田',
        'youkoso',
        'saitou@gmail.com'

);

CREATE TABLE tasks (
    id UUID PRIMARY KEY,            
    title TEXT NOT NULL,
    comment TEXT,
    limit_date DATE,
    priority TEXT CHECK (priority IN ('高', '中', '小')),
    completed BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO tasks (id, title, comment, limit_date, priority, completed)
VALUES (
    'a1b2c3d4-e5f6-7a8b-9c0d-1e2f3a4b5c6d', -- id (UUID)
    'DjangoのAPI掲示板を完成させる',         -- title
    '先生に教えてもらう',                     -- comment
    '2026-06-30',                           -- limit_date (期限日)
    '高',                                   -- priority ('高', '中', '小')
    FALSE                                   -- completed (まだ未完了)
);
INSERT INTO tasks (id, title, priority) --空白はNULL
VALUES (
    '9f8e7d6c-5b4a-3f2e-1d0c-9b8a7f6e5d4c', 
    'スーパーで牛乳を買う',                  
    '中'                                    
);
CREATE TABLE task_name_history (
    id UUID PRIMARY KEY,
    update_task TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


INSERT INTO task_name_history (--タスクIDがあっていない→修正点
    id,
    update_task
)
VALUES (
    gen_random_uuid(),
    'xammpの勉強会'
);

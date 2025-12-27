-- Comfort Food Database Schema for Supabase (PostgreSQL)

-- Create table for storing comfort food entries
CREATE TABLE IF NOT EXISTS comfort_foods (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    food_name TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    animation_url TEXT,
    session_id TEXT
);

-- Create index on created_at for faster queries
CREATE INDEX IF NOT EXISTS idx_comfort_foods_created_at ON comfort_foods(created_at DESC);

-- Create index on session_id if you want to query by session
CREATE INDEX IF NOT EXISTS idx_comfort_foods_session_id ON comfort_foods(session_id);

-- Enable Row Level Security (RLS) - optional, adjust based on your needs
ALTER TABLE comfort_foods ENABLE ROW LEVEL SECURITY;

-- Create policy to allow all operations (adjust based on your security needs)
-- For public read/write access:
CREATE POLICY "Allow public insert" ON comfort_foods
    FOR INSERT
    WITH CHECK (true);

CREATE POLICY "Allow public select" ON comfort_foods
    FOR SELECT
    USING (true);

-- If you want to allow updates and deletes, uncomment these:
-- CREATE POLICY "Allow public update" ON comfort_foods
--     FOR UPDATE
--     USING (true)
--     WITH CHECK (true);

-- CREATE POLICY "Allow public delete" ON comfort_foods
--     FOR DELETE
--     USING (true);


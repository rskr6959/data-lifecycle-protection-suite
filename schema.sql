-- ======================================
-- Data Lifecycle Protection Suite Schema
-- ======================================

-- Create database (run only if not already created)
-- CREATE DATABASE datalifecycle;

-- ===================
-- Table: workloads
-- ===================
CREATE TABLE IF NOT EXISTS workloads (
    id SERIAL PRIMARY KEY,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    read_ops INT,
    write_ops INT,
    latency_ms FLOAT,
    throughput_mb FLOAT
);

-- ===================
-- Table: backups
-- ===================
CREATE TABLE IF NOT EXISTS backups (
    id SERIAL PRIMARY KEY,
    type VARCHAR(10), -- full/inc/diff
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    size_mb FLOAT,
    duration_ms FLOAT,
    status VARCHAR(20) DEFAULT 'completed',
    file_hashes JSON
);

-- ===================
-- Table: recovery_logs
-- ===================
CREATE TABLE IF NOT EXISTS recovery_logs (
    id SERIAL PRIMARY KEY,
    attack_time TIMESTAMP,
    recovery_start TIMESTAMP,
    recovery_end TIMESTAMP,
    files_restored INT,
    status VARCHAR(20)
);

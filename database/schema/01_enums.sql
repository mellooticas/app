-- =============================================
-- Nipo School - New Database Schema
-- File: 01_enums.sql
-- Description: All enum types (created in public schema for cross-schema access)
-- =============================================

-- Education
CREATE TYPE enrollment_status AS ENUM ('active', 'pending', 'completed', 'cancelled');
CREATE TYPE lesson_status AS ENUM ('draft', 'scheduled', 'in_progress', 'completed', 'cancelled');
CREATE TYPE course_level AS ENUM ('beginner', 'intermediate', 'advanced');

-- Difficulty (shared across domains)
CREATE TYPE difficulty_level AS ENUM ('beginner', 'intermediate', 'advanced', 'expert');
CREATE TYPE technique_difficulty AS ENUM ('beginner', 'intermediate', 'advanced', 'expert');

-- Content
CREATE TYPE material_type AS ENUM ('document', 'video', 'audio', 'link', 'sheet_music');
CREATE TYPE quiz_type AS ENUM ('multiple_choice', 'true_false', 'open');

-- Portfolio
CREATE TYPE portfolio_type AS ENUM ('project', 'research', 'performance', 'reflection', 'composition');
CREATE TYPE portfolio_status AS ENUM ('draft', 'submitted', 'in_review', 'evaluated');
CREATE TYPE visibility AS ENUM ('private', 'class_only', 'public');
CREATE TYPE evidence_type AS ENUM ('photo', 'video', 'audio', 'document');

-- Challenges
CREATE TYPE challenge_type AS ENUM ('practical', 'theoretical', 'creative', 'collaborative');
CREATE TYPE submission_status AS ENUM ('submitted', 'under_review', 'evaluated', 'returned');

-- Gamification
CREATE TYPE achievement_category AS ENUM ('progress', 'consistency', 'milestone', 'special', 'social');

-- IAM
CREATE TYPE invitation_status AS ENUM ('pending', 'accepted', 'expired', 'revoked');

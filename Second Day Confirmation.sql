SELECT user_id FROM emails
JOIN texts
ON emails.email_id = texts.email_id
WHERE signup_action = 'Confirmed' AND action_date = signup_date + INTERVAL '1 DAY'
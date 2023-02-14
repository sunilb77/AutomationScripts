#!/bin/bash

# Define the backup directory
backup_dir="/backup"

# Define the date in a format that can be used in a file name
date=$(date +%Y-%m-%d)

# Define the name of the backup file
backup_file="$backup_dir/backup-$date.tar.gz"

# Define the directory that you want to backup
src_dir="/data"

# Define the email address to send the notification to
email_address="you@example.com"

# Create the backup directory if it doesn't exist
if [ ! -d "$backup_dir" ]; then
  mkdir "$backup_dir"
fi

# Create the backup
tar -czf "$backup_file" "$src_dir"

# Check if the backup was successful
if [ $? -eq 0 ]; then
  # Print a message indicating that the backup was successful
  echo "Backup was successful. Backup file: $backup_file"

  # Send an email notification
  echo "The backup was successful. Backup file: $backup_file" | mail -s "Backup Complete" "$email_address"
else
  # Print a message indicating that the backup failed
  echo "Backup failed. Please check the logs for more information."

  # Send an email notification
  echo "The backup failed. Please check the logs for more information." | mail -s "Backup Failed" "$email_address"
fi

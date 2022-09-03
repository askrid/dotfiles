#!/bin/bash

# variables
df_src_dir=$(dirname "$(realpath "$0")")
df_dest_dir=$HOME/.dotfiles
backup_dir=$HOME/.dotfiles.bak
script_fname=$(basename "$0")

# Move this repository to the desired dotfiles directory if they are different
cd "$HOME" || exit
if [ "$df_src_dir" != "$df_dest_dir" ]; then
    echo -n "Moving this repository to $df_dest_dir ..."
    rm -rf "$df_dest_dir"; mv "$df_src_dir" "$df_dest_dir"
    echo "done"
fi

# Create a directory to backup the existing dotfiles
echo -n "Creating backup directory on $backup_dir ..."
rm -rf "$backup_dir"; mkdir -p "$backup_dir"
echo "done"

# Backup the existing dotfiles
echo -n "Moving any existing dotfiles from $HOME to $backup_dir ..."
for file in "$df_dest_dir"/*; do
    fname=$(basename "$file")
    if [ "$fname" != "$script_fname" ] && [ -e "$HOME"/."$fname" ]; then
        mv "$HOME"/."$fname" "$backup_dir"/
    fi
done
unset file
unset fname
echo "done"

# Create symlinks from the home directory to any files in dotfiles directory
echo -n "Creating symlink to $df_dest_dir ..."
for file in "$df_dest_dir"/*; do
    fname=$(basename "$file")
    if [ "$fname" != "$script_fname" ]; then
        ln -s "$file" "$HOME"/."$fname"
    fi
done
unset file
unset fname
echo "done"

echo "Dotfiles installation has completed."

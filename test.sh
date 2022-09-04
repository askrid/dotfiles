#!/bin/bash

# Full path directory variables
df_src_dir=$(dirname "$(realpath "$0")")
df_dest_dir=$HOME/.dotfiles
backup_dir=$HOME/.dotfiles.bak

# Helper function that returns whether a first argument is a .df file
is_df() {
    [[ "$1" =~ \.df$ ]]
}

# Helper functions that converts a name .df file its original name
df_to_org() {
    echo "$1" | sed 's/^/\./; s/\.df$//'
}

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
    if is_df "$fname"; then
        org_fname=$(df_to_org "$fname")
        [ -e "$HOME"/"$org_fname" ] && mv "$HOME"/"$org_fname" "$backup_dir"/
    fi
done
echo "done"

# Create symlinks from the home directory to any files in dotfiles directory
echo -n "Creating symlink to $df_dest_dir ..."
for file in "$df_dest_dir"/*; do
    fname=$(basename "$file")
    if is_df "$fname"; then
        org_fname=$(df_to_org "$fname")
        ln -s "$file" "$HOME"/"$org_fname"
    fi
done
echo "done"

echo "Dotfiles installation has completed."

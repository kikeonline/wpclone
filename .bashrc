function wpclone() {
        if [[ $1 = "post" ]]; then
                echo "Starting post clonation..."
                wp post get $2 --field=content | wp post create - --post_title="$3"
                echo "Content of $2 duplicated into new draft post: $3. Please publish manually"
        elif [[ $1 = "page" ]]; then
                echo "Starting page clonation..."
                wp post get $2 --field=content | wp post create - --post_type=page --post_title="$3"
                echo "Content of $2 duplicated into new draft page: $3. Please publish manually"
        else
                echo "Please especify an argument post or page followed by the post ID and Name of new post"
                echo -e "Example: wpclone page 32 \"My New Post\""
        fi
}

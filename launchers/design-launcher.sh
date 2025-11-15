APP_DIR="$HOME/.local/share/applications/webapps/design"

declare -A app_map
for file in "$APP_DIR"/*.desktop; do
    [ -f "$file" ] || continue
    name=$(grep -i '^Name=' "$file" | cut -d'=' -f2)
    [ -n "$name" ] && app_map["$name"]="$file"
done

options=("${!app_map[@]}")

choice=$(printf "%s\n" "${options[@]}" | sort | rofi -dmenu -p "Design Webapps" -theme-str '
window {
    location: center;
    anchor: center;
    width: 250px;
}
listview {
    lines: 9;
    fixed-height: true;
}
element-text {
    font: "JetBrainsMono Nerd Font 16";
}')

[ -z "$choice" ] && exit 0

desktop_file="${app_map[$choice]}"
[ -z "$desktop_file" ] && notify-send "Design Launcher" "Could not find desktop file for $choice" && exit 1

# Get exact Exec line (keep all flags)
cmd=$(grep -i '^Exec=' "$desktop_file" | head -n1 | cut -d'=' -f2-)

# Launch
bash -c "$cmd" &

notify-send "Design Launcher" "Launching $choice…"



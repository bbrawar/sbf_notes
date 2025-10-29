#!/bin/bash

# Prompt for year and day range
read -p "Enter year (last two digits, e.g. 25 for 2025): " year
read -p "Enter start day (e.g. 274): " start_day
read -p "Enter end day (e.g. 282): " end_day

# Validate inputs
if ! [[ "$year" =~ ^[0-9]{2}$ && "$start_day" =~ ^[0-9]+$ && "$end_day" =~ ^[0-9]+$ ]]; then
    echo "❌ Please enter valid numeric values."
    exit 1
fi

if (( start_day > end_day )); then
    echo "⚠️  Start day cannot be greater than end day."
    exit 1
fi

echo -e "\n🛰️  Processing year 20${year}, days $start_day to $end_day ..."

# Main loop
for (( day=$start_day; day<=$end_day; day++ )); do
    echo -e "\n🗓️  Day $day"

    src_dir="./${year}${day}"
    out_file="./SEPT${day}0.${year}_"

    # Skip if output already exists
    if [ -f "$out_file" ]; then
        echo -e "⚠️  Output file $out_file already exists. Skipping..."
        continue
    fi

    # Check if source directory exists
    if [ ! -d "$src_dir" ]; then
        echo -e "🚫 Directory $src_dir not found. Skipping..."
        continue
    fi

    # Find matching hourly files
    files=(${src_dir}/SEPT${day}*.${year}_)
    if [ ${#files[@]} -eq 0 ]; then
        echo -e "🚫 No input files found for day $day. Skipping..."
        continue
    fi

    # Concatenate hourly SBF files into one daily file
    cat "${files[@]}" > "$out_file"

    # Verify result
    if [ -s "$out_file" ]; then
        echo -e "✅ Created \e[32m$out_file\e[0m"
        echo "📦 Size: $(du -h "$out_file" | cut -f1)"
    else
        echo -e "❌ Failed to create output for day $day"
    fi
done

echo -e "\n🎯 All done!"

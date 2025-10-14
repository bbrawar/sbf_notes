for day in {274..282}; do
    echo "🛰️ Processing day $day ..."
    cat ./25${day}/SEPT${day}*.25_ > ./SEPT${day}0.25_
    echo "✅ Created ./SEPT${day}0.25_"
done

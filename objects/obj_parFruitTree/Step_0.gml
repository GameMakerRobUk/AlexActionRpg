// Inherit the parent event
event_inherited();

if (global.season == fruitSeason && sprite_index == spriteWithoutNuts) {
	fruitTimer += 1;
}


if (global.season = fruitSeason && fruitTimer >= fruitGrowthTime) {
	sprite_index = spriteWithNuts;
}
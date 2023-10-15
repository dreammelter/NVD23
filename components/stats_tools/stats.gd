class_name Stats
extends RefCounted
## Class for managing fluctating data values on character or env scenes.
## 
## Stats plural because you can define multiple stats. Used for adjustable
## numerical values that reset every level. (Since that's all we have in this game.)
## Sticks to floating point numbers for all stats. For now.


## Container for all stats for whatever this is attached to.
var stats: Dictionary = {}


## Add a stat - if you need an int, use casting
func add(stat_name: String, stat_value: float):
	if stats.has(stat_name):
		print("STATS: stat exists - overwriting value...")
	stats[stat_name] = stat_value


## Remove a stat
func remove(stat_name: String):
	if stats.has(stat_name):
		stats.erase(stat_name)
	else:
		print("STATS: stat doesn't exist. Moving on.")


## Update a stat
## The value should be calculated/recasted by whatever system is modifying the stat.
func update(stat_name: String, stat_value: float):
	if stats.has(stat_name):
		stats[stat_name] = stat_value
	else:
		print("STATS: stat doesn't exist")


## Get a stat's value
func view_stat(stat_name) -> float:
	return stats.get(stat_name)

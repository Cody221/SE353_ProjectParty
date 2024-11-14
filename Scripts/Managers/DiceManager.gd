class_name DiceManager extends Node

var rng = RandomNumberGenerator.new()

func roll20(mod = 0):
	return rng.randi_range(1, 20) + mod

func roll6(mod = 0):
	return rng.randi_range(1, 6) + mod

func roll8(mod = 0):
	return rng.randi_range(1, 8) + mod

func roll10(mod = 0):
	return rng.randi_range(1, 10) + mod

func roll4(mod = 0):
	return rng.randi_range(1, 4) + mod

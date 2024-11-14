class_name DiceManager extends Node

var rng = RandomNumberGenerator.new()

func roll20(mod = 0):
	return rng.randi_range(0, 20) + mod

func roll6(mod = 0):
	return rng.randi_range(0, 6) + mod

func roll8(mod = 0):
	return rng.randi_range(0, 8) + mod

func roll10(mod = 0):
	return rng.randi_range(0, 10) + mod

func roll4(mod = 0):
	return rng.randi_range(0, 4) + mod

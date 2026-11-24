extends Node

enum Phase { DAY_OFFICE, DAY_CRIME_SCENE, NIGHT_WAREHOUSE, REPORT }

var current_phase: Phase = Phase.DAY_OFFICE
var suspicion: int = 0
var collected_clues: Array[String] = []
var deduced_leads: Array[String] = []

signal suspicion_changed(new_value: int)
signal clue_collected(clue_id: String)
signal phase_changed(new_phase: Phase)

func add_suspicion(amount: int) -> void:
	suspicion = clamp(suspicion + amount, 0, 100)
	emit_signal("suspicion_changed", suspicion)

func collect_clue(clue_id: String) -> void:
	if not collected_clues.has(clue_id):
		collected_clues.append(clue_id)
		emit_signal("clue_collected", clue_id)

func set_phase(new_phase: Phase) -> void:
	current_phase = new_phase
	emit_signal("phase_changed", current_phase)

if(keyboard_check_pressed(vk_space) and not global.freeze_movement) {
	other.current_dialogue = other.next_dialogue;
	other.next_dialogue = array_create(3);
	other.next_dialogue[0] = "akdsjflkdjlfkjdslfkjdlkafjdlkjfdlkajsdlkfjdslak ak jf ldksjf lkdasj ldfkajdlksaj flkjsadlkfj lkdjsfklj alksdjfl kdjsaflkdjsalkfjd aldkjf lkdjf laskdfj lkjfa slk";
	other.next_dialogue[1] = "Niko";
	other.next_dialogue[2] = spr_niko_portrait_neutral;
}
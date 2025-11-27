extends Node

const IP_ADDRESS: String = "localhost";
const PORT: int = 6669;

var peer: ENetMultiplayerPeer;

func startServer() -> void:
	peer = ENetMultiplayerPeer.new();
	peer.create_server(PORT, 3);
	multiplayer.multiplayer_peer = peer;
	
func startClient() -> void:
	peer = ENetMultiplayerPeer.new();
	peer.create_client(IP_ADDRESS, PORT);
	multiplayer.multiplayer_peer = peer;



class ChatState {
  final String userInput;
  final String? geminiResponse;

  const ChatState({required this.userInput, this.geminiResponse});

  ChatState copyWith({
    String? userInput,
    String? geminiResponse,
  }) {
    return ChatState(
      userInput: userInput ?? this.userInput,
      geminiResponse: geminiResponse ?? this.geminiResponse,
    );
  }

}
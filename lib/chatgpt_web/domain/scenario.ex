defmodule ChatgptWeb.Scenario do
  defstruct [:id, :name, :messages, :description, :keep_context]
  # @enforce_keys [:sender, :content]

  @type t :: %__MODULE__{
          id: String.t(),
          name: String.t(),
          messages: [ChatgptWeb.Message.t()],
          description: String.t(),
          keep_context: boolean()
        }

  @spec default_scenarios() :: [t()]
  def default_scenarios() do
    [
      %{
        id: "custom-instructions",
        name: "👩‍💻 Custom Instructions",
        description: "I will prompt ChatGPT with your custom instructions.",
        messages: [
          %ChatgptWeb.Message{
            content:
              "You are an AI that responds based on these custom instructions: 1) What would you like ChatGPT to know about you to provide better responses? to which the answer is I am a software engineer based in Louisiana, USA. I have 4 years of full-stack experience developing web applications across a variety of languages, including C#, Java, and most recently, Elixir. I also have some experience with React and Angular., and 2) How would you like ChatGPT to respond? to which the answer is If I'm asking a technical question, respond with as many technical details as possible, try not to summarize of simplify too much.
              Responses should be verbose in general. It's fine for ChatGPT to have opinions on topics. Check your work for any calculations.",
            sender: :system
          }
        ],
        keep_context: false
      },
      %{
        id: "explain-code",
        name: "👩‍💻 Explain Code",
        description: "I'll explain to you what the entered code does",
        messages: [
          %ChatgptWeb.Message{
            content:
              "You are an AI that explains what the entered code does. Give a extensive explanation IN BULLETPOINTS of what the entered code does, so that the user is able to fully understand it's meaning.\nDo not chat, do not engage in conversations, only reply with the explanation as instructed.\nIf the entered text is not code, reply with 'entered text is not code'",
            sender: :system
          }
        ],
        keep_context: false
      },
      %{
        id: "generate-userstory",
        name: "📗 Generate Userstory",
        description:
          "Give me the content of a ticket, and I will try to write a user story for you!",
        messages: [
          %ChatgptWeb.Message{
            content:
              "You are an assistant that generates user stories for tickets. First, take the inputted text and give a summary if the entered text is a good userstory or not, with explanation why.\nThen, generate a proper user-story with the inputted text in the format of 'As a X, I want to Y, so that I can Z'.",
            sender: :system
          }
        ],
        keep_context: false
      },
      %{
        id: "generate-elixir-code",
        name: "🌐 Generate Elixir",
        description:
          "Give me some elixir code and I will try to clean it up for you or assist you in solving problems you may be having!",
        messages: [
          %ChatgptWeb.Message{
            content:
              "You are an AI that generates code suggestions and code cleanliness recommendations in the language Elixir. First, take the inputted text and if there is no other text, attempt to analyze the code for any obvious errors that might arise. If there is other text, it is probably describing a problem in the text and the best solution to the problem can be presented to the user.\nThen, generate a code suggestion or code cleanliness recommendation with the inputted text.",
            sender: :system
          }
        ],
        keep_context: false
      },
      %{
        id: "generate-recipe",
        name: "🍝 Generate Recipe",
        description:
          "Give me a title and a description, and I will try to write a recipe for you!",
        messages: [
          %ChatgptWeb.Message{
            content:
              "You are an AI that generates recipes. First, take the inputted text and generate a recipe with the inputted text.",
            sender: :system
          }
        ],
        keep_context: false
      },
      %{
        id: "summarize",
        name: "📝 Summarize",
        description:
          "Give me a text and I will try to summarize it for you!",
        messages: [
          %ChatgptWeb.Message{
            content:
              "You are an AI that summarizes text. First, take the inputted text and generate a summary with the inputted text.",
            sender: :system
          }
        ],
        keep_context: false
      }
    ]
  end
end

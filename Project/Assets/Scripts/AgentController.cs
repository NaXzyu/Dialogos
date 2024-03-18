using UnityEngine;
using Unity.Logging;
using CommandTerminal;
using Unity.VisualScripting.Antlr3.Runtime;

public class AgentController : MonoBehaviour
{
    private Terminal terminal;

    void Start()
    {
        terminal = FindAnyObjectByType<Terminal>();
        if (terminal == null)
        {
            Log.Error("Terminal component not found in the scene.");
        }
    }

    void Update()
    {
        if (Input.GetKeyDown(KeyCode.Space))
        {
            ProcessTerminalLog();
        }
    }

    void ProcessTerminalLog()
    {
        Log.Info("Process Terminal Log");
        var _logs = Terminal.Buffer.Logs;
        var _countX = 0;
        foreach (var log in _logs)
        {
            ++_countX;
            var _countY = 0;
            Log.Info("message=" + log.message);
            var _tokens = log.message.Split(' ');
            foreach (string _token in _tokens)
            {
                ++_countY;
                Log.Info("token=" + _token);
                TokenState state = new TokenState(_token);
                // TODO: Add state to your state management system
            }
        }
    }

    class TokenState
    {
        public string token;

        public TokenState(string token)
        {
            this.token = token;
        }

        public override string ToString()
        {
            return token;
        }
    }

    // TODO: Implement other methods for state management and conversation handling
}

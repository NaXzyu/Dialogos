using UnityEngine;

public class AgentController : MonoBehaviour
{
    void Start()
    {
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
        Debug.Log("Process Terminal Log");
        
        // TODO process logs
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

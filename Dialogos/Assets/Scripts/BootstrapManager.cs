using UnityEngine;
using System.IO;
using CommandTerminal;
using System.Collections;

public class BootstrapManager : MonoBehaviour
{
    // Renamed to bootFile
    [SerializeField] string bootFile;

    private void Start()
    {
        bootFile = Path.Combine(Application.persistentDataPath, "bootstrap.unityboot");
        if (!File.Exists(bootFile))
        {
            CreateBootstrapFile();
            Terminal.Log("");
            Terminal.Log("Rebooting...");
            StartCoroutine(WaitAndQuit());
        }
        else
        {
            Terminal.Log("Bootstrap OKAY!, proceed with loading and executing commands");
            Terminal.Log("");
            StartCoroutine(WaitAndPrintBootMessage());
        }
    }

    IEnumerator WaitAndQuit()
    {
        // Wait for 1 second before quitting
        yield return new WaitForSeconds(1);
        BootstrapUtil.Quit();
    }

    IEnumerator WaitAndPrintBootMessage()
    {
        // Wait for 1 second before printing the boot message
        yield return new WaitForSeconds(1);
        PrintBootMessage();
    }

    private void CreateBootstrapFile()
    {
        string[] defaultCommands = {
            "InitializeSystem",
            "LoadEntityData",
            "StartAsyncJobs",
            "ExecuteStaticFunctionCalls"
        };

        File.WriteAllLines(bootFile, defaultCommands);
        Debug.Log($"Created new bootstrap file at: {bootFile}");
    }

    void PrintBootMessage()
    {
        Terminal.Buffer.Clear();
        Terminal.Log("- - - - - - - - - - - - - - - - - - - - - - - - - - - - - -");
        Terminal.Log("-.........................................................-");
        Terminal.Log("-.........................................................-");
        Terminal.Log("-... D I A L 0 G 0 S .....................................-");
        Terminal.Log("-.........................................................-");
        Terminal.Log("-...............................................c2024.....-");
        Terminal.Log("_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _");
        Terminal.Log("\n");

        StartCoroutine(ReadBootFileAndAcknowledge());
    }

    IEnumerator ReadBootFileAndAcknowledge()
    {
        yield return new WaitForSeconds(1);

        string[] lines = File.ReadAllLines(bootFile);
        foreach (string line in lines)
        {
            Terminal.Log(line);
        }

        Terminal.Log("\n");

        yield return new WaitForSeconds(1);

        Terminal.Log("=== Boot Sequence COMPLETE! ===");
        Terminal.Log("\n");
    }
}

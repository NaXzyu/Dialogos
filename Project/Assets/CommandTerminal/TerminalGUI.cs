using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace CommandTerminal
{
    public class TerminalGUI
    {
        public void DrawGUIButtons(Terminal terminal, Font font, bool rightAlignButtons, float currentOpenT, GUIStyle windowStyle)
        {
            int _size = font.fontSize;
            float _xPos = rightAlignButtons ? Screen.width - 7 * _size : 0;

            // 7 is the number of chars in the button plus some padding, 2 is the line height.
            // The layout will resize according to the font size.
            GUILayout.BeginArea(new Rect(_xPos, currentOpenT, 7 * _size, _size * 2));
            GUILayout.BeginHorizontal();

            if (GUILayout.Button("Small", windowStyle))
            {
                terminal.ToggleState(TerminalState.OpenSmall);
            }
            else if (GUILayout.Button("Full", windowStyle))
            {
                terminal.ToggleState(TerminalState.OpenFull);
            }

            GUILayout.EndHorizontal();
            GUILayout.EndArea();
        }
    }
}

using System;
using System.Collections.Generic;
using System.Text;

public static class Text
{
    static char[] RuChars = new char[] { 'а', 'б', 'в', 'г', 'д', 'е', 'ж', 'з', 'и', 'й', 'к', 'л',
            'м', 'н', 'о', 'п', 'р', 'с', 'т', 'у', 'ф', 'х', 'ц', 'ч', 'ш', 'щ', 'ъ', 'ы', 'ь', 'э',
            'ю', 'я', 'ё', 'ё'};
    static string[] EnTrans = new string[]  { "a","b","v","g","d","e","zh","z","i","j","k","l",
            "m","n","o","p","r","s","t","u","f","h","c","ch","sh","shh","","y","","e","yu","ya","yo","yo"};

    public static string TransliterateRuEn(string src)
    {
        if (null == src)
            throw new ArgumentNullException("src");

        if (string.Empty == src)
            return string.Empty;

        string s = src.ToLower();
        string ns = string.Empty;
        string prevch = "-";
        for (int i = 0; i < src.Length; i++)
        {
            char ch = s[i];
            string newch = "-";
            if (ch >= 'а' && ch <= 'я')
                newch = EnTrans[ch - 'а'];
            if ((ch >= 'a' && ch <= 'z') || (ch >= '0' && ch <= '9'))
                newch = ch.ToString();
            if (!(ch == '-' && prevch == "-"))
                ns += newch;
            prevch = newch;
        }

        if (ns.Length > 1)
        {
            if (ns[ns.Length - 1] == '-')
            {
                ns = ns.Remove(ns.Length - 1);
            }
        }

        while (ns.IndexOf("--") > -1)
            ns = ns.Replace("--", "-");

        return ns;
    }
}

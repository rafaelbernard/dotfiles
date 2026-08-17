import QtQuick
import Quickshell
import Quickshell.Io

// World clocks bar widget — shows multiple timezones in a row.
// Configured via shell.json settings: zones = array of {label, tz, format}.
// Falls back to a sensible default set if no zones are configured.

Item {
  property var bar
  property string moduleName
  property var settings

  implicitWidth: row.implicitWidth + 16
  implicitHeight: bar ? bar.barSize : 26

  // Default zones if not configured in shell.json
  readonly property var defaultZones: [
    { label: "BR",   tz: "America/Sao_Paulo",  format: "dd HH:mm" },
    { label: "ASyd", tz: "Australia/Sydney",    format: "dd HH:mm" },
    { label: "CAlb", tz: "America/Edmonton",    format: "dd HH:mm" },
    { label: "POR",  tz: "Europe/Lisbon",       format: "dd HH:mm" }
  ]

  readonly property var zones: (settings && settings.zones) ? settings.zones : defaultZones

  SystemClock {
    id: clock
    precision: SystemClock.Minutes
  }

  // Format a date in a specific timezone using Intl.DateTimeFormat
  function formatInTz(tz, format) {
    var d = new Date()
    try {
      var opts = { timeZone: tz, hour12: false }
      var parts = new Intl.DateTimeFormat("en-GB", {
        timeZone: tz,
        day: "2-digit",
        hour: "2-digit",
        minute: "2-digit"
      }).formatToParts(d)

      var day = "", hour = "", minute = ""
      for (var i = 0; i < parts.length; i++) {
        if (parts[i].type === "day") day = parts[i].value
        else if (parts[i].type === "hour") hour = parts[i].value
        else if (parts[i].type === "minute") minute = parts[i].value
      }
      return day + " " + hour + ":" + minute
    } catch(e) {
      return "??"
    }
  }

  Row {
    id: row
    anchors.centerIn: parent
    spacing: 6

    Repeater {
      model: parent.zones

      Item {
        required property var modelData
        width: label.implicitWidth
        height: parent.height

        Text {
          id: label
          anchors.centerIn: parent
          font.family: bar ? bar.fontFamily : "monospace"
          font.pixelSize: bar ? bar.fontPixelSize : 12
          color: bar ? bar.foreground : "white"
          text: "| " + modelData.label + " " + parent.parent.parent.formatInTz(modelData.tz, modelData.format)
        }
      }
    }
  }
}

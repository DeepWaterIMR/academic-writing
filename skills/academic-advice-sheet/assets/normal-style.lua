function Para(el)
  if FORMAT:match("docx") then
    return pandoc.Div({el}, pandoc.Attr("", {}, {["custom-style"] = "Normal"}))
  end
  return el
end

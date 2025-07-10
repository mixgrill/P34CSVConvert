# gml:id の行にマッチ
/^\/ksj:Dataset\/gml:Point\/@gml:id=/ {
    match($0, /@gml:id=([a-zA-Z0-9_]+)/, m)
    if (m[1] != "") {
        current_id = m[1]
    }
}

# gml:pos の行にマッチし、current_id がセットされているとき
/^\/ksj:Dataset\/gml:Point\/gml:pos=/ && current_id != "" {
    sub(/^\/ksj:Dataset\/gml:Point\/gml:pos=/, "", $0)
    pos[current_id] = $0
    current_id = ""  # 1対1の対応を想定
}
/^\/ksj:Dataset\/ksj:LocalGovernmentOfficeAndPublicMeetingFacility\/@gml:id=/ {
    match($0, /@gml:id=([a-zA-Z0-9_]+)/, m)
    printf "\n\"" m[1] "\""
}
/^\/ksj:Dataset\/ksj:LocalGovernmentOfficeAndPublicMeetingFacility\/ksj:position\/@xlink:href=#/ {
    match($0, /@xlink:href=#([a-zA-Z0-9_]+)/, m)
    printf ",\"" m[1] "\""
    printf ",\"" pos[m[1]] "\""
}
/^\/ksj:Dataset\/ksj:LocalGovernmentOfficeAndPublicMeetingFacility\/ksj:administrativeAreaCode=/ {
    match($0, /administrativeAreaCode=([a-zA-Z0-9_]+)/, m)
    printf ",\"" m[1] "\""
}
/^\/ksj:Dataset\/ksj:LocalGovernmentOfficeAndPublicMeetingFacility\/ksj:publicOfficeClassification=/ {
    match($0, /publicOfficeClassification=([a-zA-Z0-9_]+)/, m)
    printf ",\"" m[1] "\""
}
/^\/ksj:Dataset\/ksj:LocalGovernmentOfficeAndPublicMeetingFacility\/ksj:publicOfficeName=/ {
    match($0, /publicOfficeName=(.+)/, m)
    printf ",\"" m[1] "\""
}
/^\/ksj:Dataset\/ksj:LocalGovernmentOfficeAndPublicMeetingFacility\/ksj:address=/ {
    match($0, /address=(.+)/, m)
    printf ",\"" m[1] "\""
}
END {
}

;=================================================
;========Code được viết bởi Bs Châu=========
;========Http://fb.com/chauhuynh0104==============
;========079.567.9350=============================
;========Vui lòng tôn trọng bản quyền tác giả=====
;========Không xoá dòng này ======================
;=================================================

#Requires AutoHotkey v2.0
#UseHook
#SingleInstance Force
^!Esc::ExitApp   ; 
;============ SẮC THUỐC ===========
::s1::
{
    NgayHienTai := FormatTime(, "dd/MM/yyyy")
    SendText "Sắc uống theo đơn thuốc ngày " NgayHienTai ", chia uống 2 lần trong ngày"
}
::s2::
{
    NgayTiepTheo := FormatTime(DateAdd(A_Now, 1, "Days"), "dd/MM/yyyy")
    SendText "Sắc uống theo đơn thuốc ngày " NgayTiepTheo ", chia uống 2 lần trong ngày"
}
::s3::
{
    SendText "Sắc uống mỗi ngày 01 thang, chia uống 2 lần trong ngày"
}
::bt01c::
{
    SendText "Nội khoa YHCT kết hợp YHHĐ`nChăm sóc cấp III`nBT01-Cơm"
}
::tm01c::
{
    SendText "Nội khoa YHCT kết hợp YHHĐ`nChăm sóc cấp III`nTM01-Cơm"
}
::tn07c::
{
    SendText "Nội khoa YHCT kết hợp YHHĐ`nChăm sóc cấp III`nTN07-Cơm"
}
; ====== GÕ TẮT ======
::hn1::
{
    MyGui := Gui("+AlwaysOnTop", "Chỉ định Chiếu Đèn Hồng Ngoại")
    MyGui.SetFont("s10", "Segoe UI")
    
    MyGui.Add("Text",, "Chọn vùng hồng ngoại:")
    
    ; Tạo các checkbox
    CB_Lung := MyGui.Add("Checkbox","Checked", "Lưng")
    CB_CoGay := MyGui.Add("Checkbox",, "Cổ gáy")
    
    ; Nút xác nhận
    Btn_Ok := MyGui.Add("Button", "Default w80", "Xác nhận")
    Btn_Ok.OnEvent("Click", ProcessInput)
    
    MyGui.Show()

    ProcessInput(*)
    {
        ; Kiểm tra xem người dùng chọn gì
        VungChon := ""
        if CB_Lung.Value
            VungChon .= "Lưng, "
        if CB_CoGay.Value
            VungChon .= "Cổ gáy, "
        
        ; Xóa dấu phẩy thừa ở cuối
        VungChon := RTrim(VungChon, ", ")
        


        ; Đóng GUI
        MyGui.Destroy()

        ; Nội dung văn bản sẽ xuất ra
        KetQua := "Chiếu đèn hồng ngoại 15p/lần/ngày, công suất 250W, cách 50cm, vùng " . StrLower(VungChon)

        ; Gửi văn bản vào ứng dụng đang mở
        A_Clipboard := KetQua
        Send "^v" 
    }
}

::k1::
{
    SendText "Uống lúc 18h00 sau ăn"
}
::m1::
{
    SendText "Uống lúc 20h00"
}
::km1::
{
    SendText "Uống lúc 08h00-14h00-20h00"
}
::a1::
{
    SendText "Uống lúc 07h00"
}
ShowToast(text, duration := 1800) {
    static toastGui, spinTimer
    static frames := ["⠋","⠙","⠹","⠸","⠼","⠴","⠦","⠧","⠇","⠏"]
    static idx := 1

    ; ===== RANDOM MÀU =====
    colors := ["4CAF50"]
    bgColor := colors[Random(1, colors.Length)]

    ; huỷ toast cũ
    if IsSet(toastGui) {
        try SetTimer(spinTimer, 0)
        try toastGui.Destroy()
    }

    toastGui := Gui("+AlwaysOnTop -Caption +ToolWindow +E0x20")
    toastGui.BackColor := bgColor   ; <<< màu random ở đây

    ; Spinner
    toastGui.SetFont("s16 cFFFFFF", "Segoe UI Symbol")
    spinner := toastGui.AddText("x14 y12 w24 h24 Center +BackgroundTrans", frames[1])

    ; Text
    toastGui.SetFont("s10 cFFFFFF w600", "Segoe UI")
    toastGui.AddText(
        "x46 y14 w300 Center +BackgroundTrans",
        text
    )

    ; vị trí
    x := A_ScreenWidth - 380
    y := A_ScreenHeight - 110
    toastGui.Show("x" x " y" y " NoActivate AutoSize")

    ; bo góc
    toastGui.GetPos(,, &w, &h)
    WinSetRegion("0-0 w" w " h" h " r12-12", toastGui.Hwnd)

    ; ===== SPINNER QUAY =====
    spinTimer := () => (
        idx := idx >= frames.Length ? 1 : idx + 1,
        spinner.Text := frames[idx]
    )
    SetTimer(spinTimer, 80)

    ; tự huỷ
    SetTimer(() => (
        SetTimer(spinTimer, 0),
        toastGui.Destroy()
    ), -duration)
}






F5::{
SetTimer(() => ShowToast("Đang thực hiện thao tác tự động...`n© 2014-2026 By Dr.Châu"), -1)

Click(925, 310)
Send "^a"
Send "^c"
Sleep(200)
Click(927, 436)
Send "^a"
Send "^v"
Send "{Enter}"
Sleep(200)
Click(915, 355)
Send "^a"
Send "^c"
Sleep(200)
Click(903, 490)
Send "^a"
Send "^v"
Send "{Enter}"
Sleep(200)

Click(1292, 310)
Send "^a"
Send "^c"
Sleep(200)
Click(1287, 437)
Send "^a"
Send "^v"
Send "{Enter}"
Sleep(200)

Click(1292, 358)
Send "^a"
Send "^c"
Sleep(200)
Click(1296, 488)
Send "^a"
Send "^v"
Send "{Enter}"
Sleep(200)
Click(819, 557)
Sleep(200)
Click(629, 379)
Sleep(200)
Click(1001, 382)
Sleep(200)
SetTimer(() => ShowToast("Đã thao tác xong`n© 2014-2026 By Dr.Châu"), -1)

}

F6::{

;Vỏ YHHĐ
    SetTimer(() => ShowToast("Đang thực hiện thao tác tự động...`n© 2014-2026 By Dr.Châu"), -1)

	Send("{WheelDown 1}")
	Click(135, 570)
    Send "^a"
	Send "{Backspace}"
    SendText("Bệnh tỉnh, tiếp xúc tốt")
    Sleep(200)

  Click(183, 653)
    SendText("Tim đều")
    Sleep(200)

  Click(177, 688)
    SendText("Phổi trong")
    Sleep(200)
	
	  Click(150, 724)
    SendText("Bụng mềm, không u cục")
    Sleep(200)
	
	  Click(155, 771)
    SendText("Chạm thận (-)")
    Sleep(200)
	
    Click(784, 134)
	Send "^a"
	Send "^c"
    Sleep(200)	
	Click(173, 825)
	Send "^a"
	Send "^v"	
	Sleep(200)
	
	Click(739, 205)
    SendText("Không có gì bất thường ")
    Sleep(200)
	
	Click(741, 269)
    SendText("Không có gì bất thường ")
    Sleep(200)
	Click(759, 335)
    SendText("Không có gì bất thường ")
    Sleep(200)
	Click(751, 390)
    SendText("Không có gì bất thường ")
    Sleep(200)

 ; ===== TỚI TTBA → HIỆN GUI =====
    Click(752, 559)
    ttba()
	Sleep(200)
; ===

SetTimer(() => ShowToast("Đã thao tác xong`n© 2014-2026 By Dr.Châu"), -1)

}

; VỎ YHCT


F7::{
    SetTimer(() => ShowToast("Đang thực hiện thao tác tự động...`n© 2014-2026 By Dr.Châu"), -1)

	Click(279, 482)
	Sleep(200)
	SendText("Hữu thần")
	Click(1575, 187)
	Send "{PgDn}"
	Sleep(200)
	Click(321, 372)
    SendText("Không có gì bất thường")
    Sleep(200)
	
	Click(961, 507)
	SendText("Không có gì bất thường")
    Sleep(200)
	
	Click(1575, 187)
	Send "{PgUp}"
	Sleep(200)
Click(210, 242)
Sleep(200)
Click(151, 262)
Sleep(200)
Click(534, 286)
Sleep(200)
Click(179, 307)
Sleep(200)
Click(151, 346)
Sleep(200)
Click(241, 374)
Sleep(200)
Click(411, 449)
Sleep(200)
Click(179, 553)
Sleep(200)
Click(176, 599)
Sleep(200)
Send "{PgDn}"
Click(155, 486)
Sleep(200)
Click(244, 563)
Sleep(200)
SetTimer(() => ShowToast("Đã thao tác xong`n© 2014-2026 By Dr.Châu"), -1)

 }
 
 ; trang 2 ỵhct
 
F8::{
    SetTimer(() => ShowToast("Đang thực hiện thao tác tự động...`n© 2014-2026 By Dr.Châu"), -1)

Click(364, 289)
Sleep(200)
Click(476, 316)
Sleep(200)
Click(162, 454)
Sleep(200)
Click(945, 397)
Sleep(200)
Click(1014, 399)
Sleep(200)
Click(964, 425)
Sleep(200)
Click(1070, 422)
Sleep(200)
Click(1028, 448)
Sleep(200)
Click(1209, 446)
Sleep(200)
Click(989, 495)
Sleep(200)
Click(1161, 497)
Sleep(200)
Click(1042, 552)
Sleep(200)
Click(1161, 552)
Sleep(200)
Click(1576, 279)
Sleep(200)
Send "{PgDn}"
Click(965, 385)
Sleep(200)
Click(1176, 422)
Sleep(200)
Click(891, 474)
SendText("Trung bình")
Sleep(200)
Click(884, 329)
SendText("Nội khoa YHCT kết hợp YHHĐ`nChăm sóc cấp III `nTM01-Cơm")
Sleep(200)
Click(1027, 191)
SendText("Đối pháp lập phương")
Sleep(200)
Click(1087, 223)
SendText("Điện châm, xoa bóp bấm huyệt bằng tay")
Sleep(200)
Click(1574, 280)
Sleep(200)
Send "{PgUp}"
Click(553, 498)
SendText("1")
Sleep(200)
Click(561, 526)
SendText("1")
Sleep(200)
Click(319, 550)
SendText("1")
Sleep(200)
Click(319, 569)
SendText("1")
Sleep(200)
Click(451, 551)
SendText("1")
Sleep(200)
Click(452, 572)
SendText("1")
Sleep(200)
Click(611, 550)
SendText("1")
Sleep(200)
Click(612, 567)
SendText("1")
Sleep(200)
Click(130, 620)
SendText("Mạch trầm")
Sleep(200)
Click(949, 282)
SendText("Chính khí hư suy => Vệ khí bất túc => Tà khí xâm nhập => Bệnh ")
Sleep(200)
Click(945, 374)
SendText("Lý hư")
Sleep(200)
Click(1574, 342)
Sleep(200)


Send "{PgDn}"
Click(1423, 551)
   Sleep(1000)
SendText("Phạm khắc kim thành")
Send "^a"
Sleep(200)
Send "^c"
Sleep(200)
Send "^v"
	    Sleep(1000)
Click(1289, 580)
Sleep(200)


 ; ===== TỚI TTBA → HIỆN GUI =====
 Click(1574, 342)
Sleep(200)
Send "{PgUp}"
	Click(942, 227)
    ttdy()
	Sleep(200)
; ===

SetTimer(() => ShowToast("Đã thao tác xong`n© 2014-2026 By Dr.Châu"), -1)

}


; Tổng Kết Vỏ Bệnh Án
F9::{
    SetTimer(() => ShowToast("Đang thực hiện thao tác tự động...`n© 2014-2026 By Dr.Châu"), -1)

Click(191, 67)
    Sleep(2000)	
	
Click(184, 203)
    Sleep(200)	

Send "^a"
Send "^c"

Click(433, 69)
    Sleep(1000)
	
Click(172, 182)
    Sleep(2000)	
Send "^a"
Send "^v"
    Sleep(200)
Click(141, 273)
    Sleep(200)	
	Send "{PgDn}"
	Send "{PgDn}"
	SendText("Qua điều trị bệnh đỡ cho ra viện.")

Click(825, 181)
    Sleep(200)
	SendText("Đỡ")	
Click(817, 304)
    Sleep(200)	
	SendText("Nghỉ ngơi, tập luyện nhẹ nhàng.")
	
	    Sleep(1000)	
		
		
Click(1223, 442)
    Sleep(1000)	
	SendText("Võ thị thu thủy")
	Send "^a"
Send "^c"
Send "^v"
	    Sleep(1000)
Click(1085, 471)


	
Click(1223, 589)
    Sleep(1000)	
	SendText("Phạm khắc kim thành")
		Send "^a"
Send "^c"
Send "^v"
    Sleep(1000)	
Click(1112, 614)	
    Sleep(200)
	Click(1397, 476)
	Send "{PgDn}"
    Sleep(200)
	
	
	; bệnh chính
Click(223, 187)
Send "^a"
Send "^c"
Sleep(200)

Click(324, 600)
Send "^a"
Send "^v"
Click(587, 175)
Send "^a"
Send "^c"
Click(549, 598)
Send "^a"
Send "^v"


;bệnh kèm
Click(289, 234)
Send "^a"
Send "^c"
Sleep(200)

Click(326, 645)
Send "^a"
Send "^v"
Click(582, 229)
Send "^a"
Send "^c"
Click(571, 653)
Send "^a"
Send "^v"

;yhct bệnh chính
Click(299, 290)
Send "^a"
Send "^c"
Sleep(200)

Click(303, 690)
Send "^a"
Send "^v"
Click(570, 288)
Send "^a"
Send "^c"
Click(561, 695)
Send "^a"
Send "^v"

;yhct bệnh kèm
Click(270, 338)
Send "^a"
Send "^c"
Sleep(200)

Click(348, 751)
Send "^a"
Send "^v"
Click(560, 340)
Send "^a"
Send "^c"
Click(589, 748)
Send "^a"
Send "^v"
Click(285, 526)
SetTimer(() => ShowToast("Đã thao tác xong`n© 2014-2026 By Dr.Châu"), -1)

}














; ================== GUI TÓM TẮT BỆNH ÁN YHHĐ==================
ttba() {
    global TTBA_Done
    TTBA_Done := false

    MyGui := Gui(, "Thông tin bệnh nhân")
    MyGui.SetFont("s10", "Segoe UI")

    MyGui.Add("Text", "w100", "Tuổi:")
    EditTuoi := MyGui.Add("Edit", "vTuoi w200")

    MyGui.Add("Text", "w100", "Giới tính:")
    ChoiceGT := MyGui.Add("DropDownList", "vGioiTinh w200", ["Nam", "Nữ"])
    ChoiceGT.Value := 1 

    MyGui.Add("Text", "w100", "Lý do vào viện:")
    ChoiceLyDo := MyGui.Add("DropDownList", "vLyDo w200", [
        "Đau lưng lan mông chân", 
        "Đau cổ vai lan cánh tay", 
        "Đau thắt lưng",
        "Đau khớp gối",
        "Đau khớp vai", 
        "Đau nhức các khớp"
    ])
    ChoiceLyDo.Value := 1

    TxtBen := MyGui.Add("Text", "w100", "Bên đau:")
    ChoiceBen := MyGui.Add("DropDownList", "vBen w200", ["Trái", "Phải", "2 bên"])
    ChoiceBen.Value := 1

    MyGui.Add("GroupBox", "ym r8 w300", "Hội chứng & Dấu chứng")
    CB1 := MyGui.Add("Checkbox", "xp+10 yp+25", "Hội chứng tổn thương cột sống cổ")
    CB2 := MyGui.Add("Checkbox", "", "Hội chứng tổn thương cột sống thắt lưng")
    
    CB3 := MyGui.Add("Checkbox", "Section", "HC tổn thương khớp gối:")
    ChoiceGoi := MyGui.Add("DropDownList", "vBenGoi x+5 yp-3 w70", ["Trái", "Phải", "2 bên"])
    ChoiceGoi.Value := 1
    
    CB4 := MyGui.Add("Checkbox", "xs", "Hội chứng chèn ép rễ thần kinh")
    CB5 := MyGui.Add("Checkbox", "vHC5", "Dấu chứng tăng huyết áp")

    CB6 := MyGui.Add("Checkbox", "Section", "Dấu tổn thương khớp vai:")
    ChoiceVai := MyGui.Add("DropDownList", "vBenVai x+5 yp-3 w70", ["Trái", "Phải", "2 bên"])
    ChoiceVai.Value := 1
    
    CB7 := MyGui.Add("Checkbox", "vHC7 xs", "Dấu chứng tổn thương các khớp")

    UpdateForm(*) {
        CB1.Value := CB2.Value := CB3.Value := CB4.Value := CB6.Value := CB7.Value := 0
        
        if (ChoiceLyDo.Text = "Đau thắt lưng" || ChoiceLyDo.Text = "Đau nhức các khớp") {
            ChoiceBen.Visible := false
            TxtBen.Visible := false
        } else {
            ChoiceBen.Visible := true
            TxtBen.Visible := true
        }

        switch ChoiceLyDo.Text {
            case "Đau lưng lan mông chân":
                CB2.Value := 1, CB4.Value := 1
            case "Đau cổ vai lan cánh tay":
                CB1.Value := 1, CB4.Value := 1
            case "Đau thắt lưng":
                CB2.Value := 1
            case "Đau khớp gối":
                CB3.Value := 1
                ChoiceGoi.Value := ChoiceBen.Value
            case "Đau khớp vai":
                CB6.Value := 1
                ChoiceVai.Value := ChoiceBen.Value
            case "Đau nhức các khớp":
                CB7.Value := 1
        }
    }

    ChoiceLyDo.OnEvent("Change", UpdateForm)
    ChoiceBen.OnEvent("Change", UpdateForm)
    UpdateForm()

    BtnOk := MyGui.Add("Button", "Default w80 h30 xm+110", "Hoàn tất")
    BtnOk.OnEvent("Click", ProcessData)

    MyGui.SetFont("s10 italic", "Segoe UI")
    MyGui.Add("Text", "xm", "Design by Dr.Châu")

    MyGui.Show()

    ProcessData(*) {
        Values := MyGui.Submit()
        GioiTinhThuong := StrLower(Values.GioiTinh)
        
        LyDoFull := Values.LyDo
        if (Values.LyDo != "Đau thắt lưng" && Values.LyDo != "Đau nhức các khớp") {
            LyDoFull .= " " Values.Ben ""
        }

        HcResult := ""
        if CB1.Value
            HcResult .= "- Hội chứng tổn thương cột sống cổ`n"
        if CB2.Value
            HcResult .= "- Hội chứng tổn thương cột sống thắt lưng`n"
        if CB3.Value
            HcResult .= "- Hội chứng tổn thương khớp gối (" Values.BenGoi ")`n"
        if CB4.Value
            HcResult .= "- Hội chứng chèn ép rễ thần kinh`n"
        if Values.HC5 
            HcResult .= "- Dấu chứng tăng huyết áp`n"
        if CB6.Value 
            HcResult .= "- Dấu chứng tổn thương khớp vai (" Values.BenVai ")`n"
        if Values.HC7 
            HcResult .= "- Dấu chứng tổn thương các khớp`n"

        HcResult := RTrim(HcResult, "`n")
        NoiDung := "Bệnh nhân " GioiTinhThuong " " Values.Tuoi " tuổi vào viện vì " StrLower(LyDoFull) ". Qua thăm khám lâm sàng và cận lâm sàng rút ra:`n" HcResult
        SendText NoiDung

        TTBA_Done := true
        MyGui.Destroy()
    }

    while !TTBA_Done
        Sleep(50)
}
;=================================================================

; ================== GUI TÓM TẮT BỆNH ÁN YHCT==================
ttdy() {
    global TTBA_Done
    TTBA_Done := false
myGui := Gui(, "Thông Tin Bệnh Nhân")
    myGui.SetFont("s10", "Segoe UI")

    ; --- Cột 1: Thông tin cơ bản ---
    myGui.Add("Text",, "Tuổi:")
    editTuoi := myGui.Add("Edit", "w200")

    myGui.Add("Text",, "Giới tính:")
    ddlGioi := myGui.Add("DropDownList", "vGioi w200 Choose1", ["Nam", "Nữ"])

    myGui.Add("Text",, "Lý do vào viện:")
    ddlLydo := myGui.Add("DropDownList", "vLydo w200 Choose1", [
        "Đau lưng lan mông chân",
        "Đau cổ vai lan cánh tay",
        "Đau thắt lưng",
        "Đau khớp gối",
        "Đau khớp vai",
        "Đau nhức các khớp"
    ])
    ddlLydo.OnEvent("Change", CheckLydo)

    myGui.Add("Text", "vTxtBen", "Bên đau (Trái/Phải):")
    ddlBen := myGui.Add("DropDownList", "vBen w200 Choose3", ["Trái", "Phải", "2 bên"])
 ; --- Nút bấm ---
    btnOk := myGui.Add("Button", "Default w80 h30 xm+110", "Hoàn tất")
    btnOk.OnEvent("Click", ProcessInput)
   
 ; --- Cột 2: Hội chứng (GroupBox + Checkbox) ---
gbHC := myGui.Add("GroupBox", "ym r8 w300", "Hội chứng:")

cb1 := myGui.Add("Checkbox", "xp+10 yp+25 vHC1 Checked"
    , "Hội chứng khí trệ huyết ứ kinh lạc")

cb2 := myGui.Add("Checkbox", "xp yp+25 vHC2 Checked"
    , "Hội chứng can thận hư")

cb3 := myGui.Add("Checkbox", "xp yp+25 vHC3"
    , "Hội chứng tâm huyết hư")

cb4 := myGui.Add("Checkbox", "xp yp+25 vHC4"
    , "Hội chứng tỳ khí hư")
cb5 := myGui.Add("Checkbox", "xp yp+25 vHC5"
    , "Hội chứng can huyết hư")
cb6 := myGui.Add("Checkbox", "xp yp+25 vHC6"
    , "Hội chứng tâm tỳ lưỡng hư")	
	cb7 := myGui.Add("Checkbox", "xp yp+25 vHC7"
    , "Hội chứng tâm thận bất giao")	
	
   
	    myGui.SetFont("s10 italic", "Segoe UI")
myGui.Add("Text", "xm", "Design by Dr.Châu")

    myGui.Show()

    CheckLydo(*)
    {
        if (ddlLydo.Text = "Đau thắt lưng") {
            ddlBen.Enabled := false
        } else {
            ddlBen.Enabled := true
        }
    }

    ProcessInput(*)
    {
        Tuoi := editTuoi.Value
        Gioi := ddlGioi.Text
        Lydo := ddlLydo.Text
        Ben := ddlBen.Text
        
        ; Tạo văn bản "bên...`n© 2014-2026 By Dr.Châu" nếu ô chọn bên đang bật
        TextBen := (ddlBen.Enabled) ? " bên " . StrLower(Ben) : ""

        ; Xử lý hội chứng
        HoiChungText := ""
        if cb1.Value
            HoiChungText .= "- Hội chứng khí trệ huyết ứ kinh lạc`n"
        if cb2.Value
            HoiChungText .= "- Hội chứng can thận hư`n"
        if cb3.Value
            HoiChungText .= "- Hội chứng tâm huyết hư`n"
        if cb4.Value
            HoiChungText .= "- Hội chứng tỳ khí hư`n"
		if cb5.Value
            HoiChungText .= "- Hội chứng can huyết hư`n"
		if cb6.Value
            HoiChungText .= "- Hội chứng tâm tỳ lưỡng hư`n"	
		if cb7.Value
            HoiChungText .= "- Hội chứng tâm thận bất giao`n"		
			
        HoiChungText := RTrim(HoiChungText, "`n")
		TTBA_Done := true   ;	
        myGui.Destroy()

        ; XUẤT VĂN BẢN: Đã thêm StrLower cho Gioi, Lydo và Ben
        NoiDung := "Bệnh nhân " . StrLower(Gioi) . " " . Tuoi . " tuổi vào viện vì " . StrLower(Lydo) . TextBen . ". Qua tứ chẩn rút ra:`n" . HoiChungText
        
        SendText NoiDung
    }
while !TTBA_Done
        Sleep(50)
}

;===============================================================

; ================== GUI BỆNH DANH==================
benhdanh(title := "Bệnh danh") {
    done := false
    result := ""

    g := Gui("+AlwaysOnTop", title)
    g.SetFont("s10", "Segoe UI")

   

    CB1 := g.Add("Checkbox", "vCB1 xm", "Toạ cốt phong")
    CB2 := g.Add("Checkbox", "vCB2 xm", "Chứng tý")
	CB1 := g.Add("Checkbox", "vCB3 xm", "Yêu thống")
    CB2 := g.Add("Checkbox", "vCB4 xm", "Lạc chẩm")
	CB2 := g.Add("Checkbox", "vCB5 xm", "Khẩu nhãn oa tà")
   
    g.Add("Text", "xm", "Hoặc gõ tay:")
    edit := g.Add("Edit", "vInputText xm w280")

    btn := g.Add("Button", "xm w80 Default", "Xong")
    btn.OnEvent("Click", (*) => (
        vals := g.Submit(),
        result := (
            vals.CB1 ? "Toạ cốt phong" :
            vals.CB2 ? "Chứng tý" :
			vals.CB3 ? "Yêu thống" :
			vals.CB3 ? "Lạc chẩm" :
			vals.CB4 ? "Khẩu nhãn oa tà" :
            vals.InputText
        ),
        done := true,
        g.Destroy()
    ))

    g.Show()

    while !done
        Sleep(50)

    if (result != "")
        SendText(result)
}
;=================================


; ================== GUI NHẬP THỦ CÔNG==================

thucong(title := "Nhập dữ liệu") {
    done := false
    result := ""

    g := Gui("+AlwaysOnTop", title)
    g.SetFont("s10", "Segoe UI")

    g.Add("Text", "xm", "Nội dung:")
    edit := g.Add("Edit", "vInputText xm w260")

    btn := g.Add("Button", "xm w80 Default", "Xong")
    btn.OnEvent("Click", (*) => (
        result := g.Submit().InputText,
        done := true,
        g.Destroy()
    ))

    g.Show()

    while !done
        Sleep(50)

    ; ==== ĐẨY NỘI DUNG RA Ô ĐANG FOCUS ====
    if (result != "")
        SendText(result)
}
;=======================================



;=========== GÕ TẮT BỆNH DANH=====================
:?*:benhdanh::
{
    title := "Bệnh danh"
    done := false
    result := ""

    g := Gui("+AlwaysOnTop", title)
    g.SetFont("s10", "Segoe UI")

   

    CB1 := g.Add("Checkbox", "vCB1 xm", "Toạ cốt phong")
    CB2 := g.Add("Checkbox", "vCB2 xm", "Chứng tý")
	CB1 := g.Add("Checkbox", "vCB3 xm", "Yêu thống")
    CB2 := g.Add("Checkbox", "vCB4 xm", "Lạc chẩm")
	CB2 := g.Add("Checkbox", "vCB5 xm", "Khẩu nhãn oa tà")
   
    g.Add("Text", "xm", "Hoặc gõ tay:")
    edit := g.Add("Edit", "vInputText xm w280")

    btn := g.Add("Button", "xm w80 Default", "Xong")
    btn.OnEvent("Click", (*) => (
        vals := g.Submit(),
        result := (
            vals.CB1 ? "Toạ cốt phong" :
            vals.CB2 ? "Chứng tý" :
			vals.CB3 ? "Yêu thống" :
			vals.CB3 ? "Lạc chẩm" :
			vals.CB4 ? "Khẩu nhãn oa tà" :
            vals.InputText
        ),
        done := true,
        g.Destroy()
    ))

    g.Show()

    while !done
        Sleep(50)

    if (result != "")
        SendText(result)
}
:?*:ttba::
{
    MyGui := Gui(, "Thông tin bệnh nhân")
    MyGui.SetFont("s10", "Segoe UI")

    ; --- PHẦN NHẬP THÔNG TIN CHUNG ---
    MyGui.Add("Text", "w100", "Tuổi:")
    EditTuoi := MyGui.Add("Edit", "vTuoi w200")

    MyGui.Add("Text", "w100", "Giới tính:")
    ChoiceGT := MyGui.Add("DropDownList", "vGioiTinh w200", ["Nam", "Nữ"])
    ChoiceGT.Value := 1 

    MyGui.Add("Text", "w100", "Lý do vào viện:")
    ChoiceLyDo := MyGui.Add("DropDownList", "vLyDo w200", [
        "Đau lưng lan mông chân", 
        "Đau cổ vai lan cánh tay", 
        "Đau thắt lưng",
        "Đau khớp gối",
        "Đau khớp vai", 
        "Đau nhức các khớp"
    ])
    ChoiceLyDo.Value := 1 ; Mặc định là Đau lưng lan mông chân
    
    ; --- PHẦN CHỌN BÊN ĐAU ---
    TxtBen := MyGui.Add("Text", "w100", "Bên đau:")
    ChoiceBen := MyGui.Add("DropDownList", "vBen w200", ["Trái", "Phải", "2 bên"])
    ChoiceBen.Value := 1

    ; --- PHẦN CHỌN HỘI CHỨNG ---
    MyGui.Add("GroupBox", "ym r8 w300", "Hội chứng & Dấu chứng")
    CB1 := MyGui.Add("Checkbox", "xp+10 yp+25", "Hội chứng tổn thương cột sống cổ")
    CB2 := MyGui.Add("Checkbox", "", "Hội chứng tổn thương cột sống thắt lưng")
    
    CB3 := MyGui.Add("Checkbox", "Section", "HC tổn thương khớp gối:")
    ChoiceGoi := MyGui.Add("DropDownList", "vBenGoi x+5 yp-3 w70", ["Trái", "Phải", "2 bên"])
    ChoiceGoi.Value := 1
    
    CB4 := MyGui.Add("Checkbox", "xs", "Hội chứng chèn ép rễ thần kinh")
    CB5 := MyGui.Add("Checkbox", "vHC5", "Dấu chứng tăng huyết áp")

    CB6 := MyGui.Add("Checkbox", "Section", "Dấu tổn thương khớp vai:")
    ChoiceVai := MyGui.Add("DropDownList", "vBenVai x+5 yp-3 w70", ["Trái", "Phải", "2 bên"])
    ChoiceVai.Value := 1
    
    CB7 := MyGui.Add("Checkbox", "vHC7 xs", "Dấu chứng tổn thương các khớp")

    ; --- LOGIC TỰ ĐỘNG XỬ LÝ ---
    UpdateForm(*) {
        ; Reset check
        CB1.Value := CB2.Value := CB3.Value := CB4.Value := CB6.Value := CB7.Value := 0
        
        ; Ẩn hiện Bên đau
        if (ChoiceLyDo.Text = "Đau thắt lưng" || ChoiceLyDo.Text = "Đau nhức các khớp") {
            ChoiceBen.Visible := false
            TxtBen.Visible := false
        } else {
            ChoiceBen.Visible := true
            TxtBen.Visible := true
        }

        ; Tự động tích theo Lý do
        switch ChoiceLyDo.Text {
            case "Đau lưng lan mông chân":
                CB2.Value := 1, CB4.Value := 1
            case "Đau cổ vai lan cánh tay":
                CB1.Value := 1, CB4.Value := 1
            case "Đau thắt lưng":
                CB2.Value := 1
            case "Đau khớp gối":
                CB3.Value := 1
                ChoiceGoi.Value := ChoiceBen.Value
            case "Đau khớp vai":
                CB6.Value := 1
                ChoiceVai.Value := ChoiceBen.Value
            case "Đau nhức các khớp":
                CB7.Value := 1
        }
    }

    ; Gán sự kiện thay đổi
    ChoiceLyDo.OnEvent("Change", UpdateForm)
    ChoiceBen.OnEvent("Change", UpdateForm)

    ; CHẠY LẦN ĐẦU TIÊN ĐỂ TỰ ĐỘNG TÍCH THEO MẶC ĐỊNH
    UpdateForm()

    ; --- NÚT XÁC NHẬN ---
    BtnOk := MyGui.Add("Button", "Default w80 h30 xm+110", "Hoàn tất")
    BtnOk.OnEvent("Click", ProcessData)
     ; --- FOOTER DESIGN BY DR.CHAU ---
        myGui.SetFont("s10 italic", "Segoe UI")
   myGui.Add("Text", "xm", "Design by Dr.Châu")
    MyGui.Show()

    ProcessData(*)
    {
        Values := MyGui.Submit()
        GioiTinhThuong := StrLower(Values.GioiTinh)
        
        ; Xử lý Lý do kèm bên đau
        LyDoFull := Values.LyDo
        if (Values.LyDo != "Đau thắt lưng" && Values.LyDo != "Đau nhức các khớp") {
            LyDoFull .= " " Values.Ben ""
        }

        ; Tổng hợp Hội chứng
        HcResult := ""
        if CB1.Value
            HcResult .= "- Hội chứng tổn thương cột sống cổ`n"
        if CB2.Value
            HcResult .= "- Hội chứng tổn thương cột sống thắt lưng`n"
        if CB3.Value
            HcResult .= "- Hội chứng tổn thương khớp gối (" Values.BenGoi ")`n"
        if CB4.Value
            HcResult .= "- Hội chứng chèn ép rễ thần kinh`n"
        if Values.HC5 
            HcResult .= "- Dấu chứng tăng huyết áp`n"
        if CB6.Value 
            HcResult .= "- Dấu chứng tổn thương khớp vai (" Values.BenVai ")`n"
        if Values.HC7 
            HcResult .= "- Dấu chứng tổn thương các khớp`n"
; --- BỔ SUNG DÒNG NÀY ĐỂ XÓA DÒNG TRỐNG CUỐI CÙNG ---
        HcResult := RTrim(HcResult, "`n")
        ; Xuất văn bản
        NoiDung := "Bệnh nhân " GioiTinhThuong " " Values.Tuoi " tuổi vào viện vì " StrLower(LyDoFull) ". Qua thăm khám lâm sàng và cận lâm sàng rút ra:`n" HcResult
        SendText NoiDung
    }
}
;=================================================================
; --- TÓM TẮT BỆNH ÁN  ---
:?*:ttdy::
{
    myGui := Gui(, "Thông Tin Bệnh Nhân")
    myGui.SetFont("s10", "Segoe UI")

    ; --- Cột 1: Thông tin cơ bản ---
    myGui.Add("Text",, "Tuổi:")
    editTuoi := myGui.Add("Edit", "w200")

    myGui.Add("Text",, "Giới tính:")
    ddlGioi := myGui.Add("DropDownList", "vGioi w200 Choose1", ["Nam", "Nữ"])

    myGui.Add("Text",, "Lý do vào viện:")
    ddlLydo := myGui.Add("DropDownList", "vLydo w200 Choose1", [
        "Đau lưng lan mông chân",
        "Đau cổ vai lan cánh tay",
        "Đau thắt lưng",
        "Đau khớp gối",
        "Đau khớp vai",
        "Đau nhức các khớp"
    ])
    ddlLydo.OnEvent("Change", CheckLydo)

    myGui.Add("Text", "vTxtBen", "Bên đau (Trái/Phải):")
    ddlBen := myGui.Add("DropDownList", "vBen w200 Choose3", ["Trái", "Phải", "2 bên"])
 ; --- Nút bấm ---
    btnOk := myGui.Add("Button", "Default w80 h30 xm+110", "Hoàn tất")
    btnOk.OnEvent("Click", ProcessInput)
   
 ; --- Cột 2: Hội chứng (GroupBox + Checkbox) ---
gbHC := myGui.Add("GroupBox", "ym r8 w300", "Hội chứng:")

cb1 := myGui.Add("Checkbox", "xp+10 yp+25 vHC1 Checked"
    , "Hội chứng khí trệ huyết ứ kinh lạc")

cb2 := myGui.Add("Checkbox", "xp yp+25 vHC2 Checked"
    , "Hội chứng can thận hư")

cb3 := myGui.Add("Checkbox", "xp yp+25 vHC3"
    , "Hội chứng tâm huyết hư")

cb4 := myGui.Add("Checkbox", "xp yp+25 vHC4"
    , "Hội chứng tỳ khí hư")
cb5 := myGui.Add("Checkbox", "xp yp+25 vHC5"
    , "Hội chứng can huyết hư")
cb6 := myGui.Add("Checkbox", "xp yp+25 vHC6"
    , "Hội chứng tâm tỳ lưỡng hư")	
	cb7 := myGui.Add("Checkbox", "xp yp+25 vHC7"
    , "Hội chứng tâm thận bất giao")	
	
   
	    myGui.SetFont("s10 italic", "Segoe UI")
myGui.Add("Text", "xm", "Design by Dr.Châu")

    myGui.Show()

    CheckLydo(*)
    {
        if (ddlLydo.Text = "Đau thắt lưng") {
            ddlBen.Enabled := false
        } else {
            ddlBen.Enabled := true
        }
    }

    ProcessInput(*)
    {
        Tuoi := editTuoi.Value
        Gioi := ddlGioi.Text
        Lydo := ddlLydo.Text
        Ben := ddlBen.Text
        
        ; Tạo văn bản "bên...`n© 2014-2026 By Dr.Châu" nếu ô chọn bên đang bật
        TextBen := (ddlBen.Enabled) ? " bên " . StrLower(Ben) : ""

        ; Xử lý hội chứng
        HoiChungText := ""
        if cb1.Value
            HoiChungText .= "- Hội chứng khí trệ huyết ứ kinh lạc`n"
        if cb2.Value
            HoiChungText .= "- Hội chứng can thận hư`n"
        if cb3.Value
            HoiChungText .= "- Hội chứng tâm huyết hư`n"
        if cb4.Value
            HoiChungText .= "- Hội chứng tỳ khí hư`n"
		if cb5.Value
            HoiChungText .= "- Hội chứng can huyết hư`n"
		if cb6.Value
            HoiChungText .= "- Hội chứng tâm tỳ lưỡng hư`n"	
		if cb7.Value
            HoiChungText .= "- Hội chứng tâm thận bất giao`n"		
			
        HoiChungText := RTrim(HoiChungText, "`n")

        myGui.Destroy()

        ; XUẤT VĂN BẢN: Đã thêm StrLower cho Gioi, Lydo và Ben
        NoiDung := "Bệnh nhân " . StrLower(Gioi) . " " . Tuoi . " tuổi vào viện vì " . StrLower(Lydo) . TextBen . ". Qua tứ chẩn rút ra:`n" . HoiChungText
        
        SendText NoiDung
    }
}

@echo off
setlocal

:begin
cls
echo.
echo. 1.��"Edit With Emacs"��ӵ��Ҽ��˵���
echo. 2.��"Edit With Emacs"���Ҽ��˵����Ƴ�
echo. 3.��"�����ļ�·��"��ӵ��Ҽ��˵���
echo. 4.��"�����ļ�·��"���Ҽ��˵����Ƴ�
echo. 5.��"����CapsLock����ctrl��"��ӵ�ע����У�������������Ч
echo. 6.��"����CapsLock����ctrl��"��ע������Ƴ���������������Ч
echo. q.�˳�
echo.

set type=q
set /p type= ��ѡ����Ӧ���֣����߰�q�˳���

if "%type%" == "1" cls & goto addEdit
if "%type%" == "2" cls & goto delEdit
if "%type%" == "3" cls & goto addCopy
if "%type%" == "4" cls & goto delCopy
if "%type%" == "5" cls & goto addSwap
if "%type%" == "6" cls & goto delSwap
if "%type%" == "q" cls & exit

:addEdit
cls
set emacsDir=c:\emacs\bin

:inputPath
if not exist %emacsDir% (
set /p emacsDir=������emacs.exe���ڵ�·�����磺C:\Emacs\bin������q���ز˵���
) else (
if not exist %emacsDir%\runemacs.exe (
set /p emacsDir=������emacs.exe���ڵ�·�����磺C:\Emacs\bin������q���ز˵���
)
)
if "%emacsDir%" == "q" (
goto begin
)
if not exist %emacsDir% (
echo %emacsDir% �����ڣ����������룡
goto inputPath
)
if not exist %emacsDir%\runemacs.exe (
echo ���õ�·��%emacsDir%����ȷ�����������롣����
goto inputPath
)
set emacsDir=%emacsDir:\=\\%

echo Windows Registry Editor Version 5.00> edit_with_emacs.reg
echo [HKEY_CLASSES_ROOT\*\shell\Edit In Emacs]>> edit_with_emacs.reg
echo @="">> edit_with_emacs.reg
echo [HKEY_CLASSES_ROOT\*\shell\Edit In Emacs\command]>> edit_with_emacs.reg
echo @="\"%emacsDir%\\emacsclientw.exe\" -a \"%emacsDir%\\runemacs.exe\" -n \"%%1\"">> edit_with_emacs.reg

echo [HKEY_CLASSES_ROOT\*\shell\Edit With New Emacs]>> edit_with_emacs.reg
echo @="">> edit_with_emacs.reg
echo [HKEY_CLASSES_ROOT\*\shell\Edit With New Emacs\command]>> edit_with_emacs.reg
echo @="\"%emacsDir%\\emacsclientw.exe\" -a \"%emacsDir%\\runemacs.exe\" -nc \"%%1\"">> edit_with_emacs.reg

regedit /S edit_with_emacs.reg
del edit_with_emacs.reg
echo �Ҽ�"Edit With Emacs"�Ѿ��ɹ���ӣ�
pause
goto begin

:delEdit
echo Windows Registry Editor Version 5.00> _edit_with_emacs.reg
echo [-HKEY_CLASSES_ROOT\*\shell\Edit In Emacs]>> _edit_with_emacs.reg
echo [-HKEY_CLASSES_ROOT\*\shell\Edit With New Emacs]>> _edit_with_emacs.reg
regedit /S _edit_with_emacs.reg
del _edit_with_emacs.reg

echo �Ҽ�"Edit With Emacs"�Ѿ��ɹ�ɾ����
pause
goto begin

:addCopy
echo Windows Registry Editor Version 5.00> copy_file_path.reg
echo [HKEY_CLASSES_ROOT\Directory\shell\copypath]>> copy_file_path.reg
echo @="�����ļ���·��">> copy_file_path.reg
echo [HKEY_CLASSES_ROOT\Directory\shell\copypath\command]>> copy_file_path.reg
echo @="mshta vbscript:clipboarddata.setdata(\"text\",\"%%1\")(close)">> copy_file_path.reg
echo [HKEY_CLASSES_ROOT\*\shell\copypath]>> copy_file_path.reg
echo @="�����ļ�·��">> copy_file_path.reg
echo [HKEY_CLASSES_ROOT\*\shell\copypath\command]>> copy_file_path.reg
echo @="mshta vbscript:clipboarddata.setdata(\"text\",\"%%1\")(close)">> copy_file_path.reg
regedit /S copy_file_path.reg
del copy_file_path.reg
echo �Ҽ�"�����ļ�·��"�Ѿ��ɹ���ӣ�
pause
goto begin

:delCopy
echo Windows Registry Editor Version 5.00> _copy_file_path.reg
echo [-HKEY_CLASSES_ROOT\Directory\shell\copypath]>> _copy_file_path.reg
echo [-HKEY_CLASSES_ROOT\*\shell\copypath]>> _copy_file_path.reg
regedit /S _copy_file_path.reg
del _copy_file_path.reg
echo �Ҽ�"�����ļ�·��"�Ѿ��ɹ�ɾ����
pause
goto begin

:addSwap
echo Windows Registry Editor Version 5.00> swap_key.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layout]>> swap_key.reg
echo "Scancode Map"=hex:00,00,00,00,00,00,00,00,02,00,00,00,1d,e0,3a,00,3a,00,1d,e0,00,00,00,00>> swap_key.reg
regedit /S swap_key.reg
del swap_key.reg
echo "����CapsLock���Ҽ�ctrl"�Ѿ��ɹ���ӽ�ע���������Ҫ�������Բ�����Ч������
pause
goto begin

:delSwap
echo Windows Registry Editor Version 5.00> _swap_key.reg
echo [-HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layout]>> _swap_key.reg
regedit /S _swap_key.reg
del _swap_key.reg
echo "����CapsLock���Ҽ�ctrl"�Ѿ���ע�����ɾ����������Ҫ�������Բ�����Ч������
pause
goto begin

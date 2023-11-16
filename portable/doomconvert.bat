@echo off
setlocal enabledelayedexpansion

REM This windows version was generated with chatgpt and hasn't been tested on Windows yet.
REM There is no guarantee it works on windows
REM First argument, which is the file path
set "file=%1"

REM Check if the specified file exists
if exist "%file%" (
    echo The first argument is a file: %file%
) else if "%file%"=="-d" (
    echo The first argument is the string '-d'
) else (
    echo Error: The first argument must be either a file or the string '-d': %file%
    exit /b 1
)

set "dithering=0"
REM The dither type to use
REM { CONVERT-DITHER-NONE (0), CONVERT-DITHER-FS (1), CONVERT-DITHER-FS-LOWBLEED (2), CONVERT-DITHER-FIXED (3) }

:parse_args
if "%~1"=="" goto end_parse_args
    if /i "%~1"=="-d" (
        echo Dithering: ON
        set "dithering=2"
    ) else (
        echo Invalid option: %1
        exit /b 1
    )
    shift
    goto parse_args
:end_parse_args

:run_gimp
set "file_path=%1"
gimp -i -b "(define file-path \"%file_path%\") (define dithering %dithering%) (load \"gimpdoom.scm\")" -b "(gimp-quit 0)"
exit /b %errorlevel%

:process_files
if "%~1"=="" goto end_process_files
    echo Applying Doom palette to %1
    call :run_gimp "%1" > nul 2>&1
    shift
    goto process_files
:end_process_files

:end
endlocal
exit /b 0


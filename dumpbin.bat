@echo off

setlocal

	call "C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools\VC\Auxiliary\Build\vcvars32.bat"

	pushd "cmake-build-release-x86\5.3.5"

	    dumpbin /headers globals_native.dll > globals_native.dll.headers.txt
	    dumpbin /exports globals_native.dll > globals_native.dll.exports.txt
	    dumpbin /dependents globals_native.dll > globals_native.dll.dependents.txt
	    dumpbin /imports globals_native.dll > globals_native.dll.imports.txt

	popd

endlocal


setlocal

	call "C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools\VC\Auxiliary\Build\vcvars64.bat"

	pushd "cmake-build-release-x64\5.3.5"

	    dumpbin /headers globals_native.dll > globals_native.dll.headers.txt
	    dumpbin /exports globals_native.dll > globals_native.dll.exports.txt
	    dumpbin /dependents globals_native.dll > globals_native.dll.dependents.txt
	    dumpbin /imports globals_native.dll > globals_native.dll.imports.txt

	popd

endlocal



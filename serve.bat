@echo off
echo Starting PMT-Chat server...
echo.
echo Open this in Chrome: http://localhost:8080/pmt-chat.html
echo.
echo Keep this window open!
echo Press Ctrl+C to stop the server.
echo.

:: Try Node.js first
node -e "const h=require('http'),fs=require('fs'),p=require('path');h.createServer((q,r)=>{let f=p.join(__dirname,q.url==='/'?'/pmt-chat.html':q.url);fs.readFile(f,(e,d)=>{if(e){r.writeHead(404);r.end('Not found')}else{const m={'html':'text/html','js':'text/javascript','css':'text/css'};r.writeHead(200,{'Content-Type':m[f.split('.').pop()]||'text/plain'});r.end(d)}})}).listen(8080,()=>console.log('Server running at http://localhost:8080/pmt-chat.html'))" 2>nul
if %errorlevel% neq 0 (
  echo Node.js not found, trying Python...
  python -m http.server 8080 2>nul
  if %errorlevel% neq 0 (
    python3 -m http.server 8080 2>nul
    if %errorlevel% neq 0 (
      echo.
      echo ERROR: Neither Node.js nor Python found.
      echo Please install Node.js from https://nodejs.org
      echo.
      pause
    )
  )
)
pause

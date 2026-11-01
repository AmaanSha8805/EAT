const { spawn } = require('child_process');

const server = spawn('node', ['server.js'], {
  cwd: __dirname,
  stdio: 'inherit'
});

server.on('error', (err) => {
  console.error('Failed to start server:', err);
  process.exit(1);
});

server.on('exit', (code) => {
  console.log(`Server exited with code ${code}`);
  process.exit(code);
});

// Keep process alive
process.on('SIGINT', () => {
  console.log('\nStopping server...');
  server.kill('SIGINT');
});

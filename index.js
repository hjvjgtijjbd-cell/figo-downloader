const express = require('express');
const { spawn } = require('child_process');
const path = require('path');
const cors = require('cors');

const app = express();
app.use(cors());
app.use(express.json());

app.get('/', (req, res) => {
  res.send('Figo Downloader API is Running ✅ Use /download?url=...');
});

app.get('/download', async (req, res) => {
  const videoUrl = req.query.url;
  if (!videoUrl) {
    return res.status(400).json({ error: 'خاصك تعطي رابط ?url=' });
  }

  try {
    const pythonProcess = spawn('python3', ['downloader.py', videoUrl]);
    
    let dataString = '';
    let errorString = '';

    pythonProcess.stdout.on('data', (data) => {
      dataString += data.toString();
    });

    pythonProcess.stderr.on('data', (data) => {
      errorString += data.toString();
    });

    pythonProcess.on('close', (code) => {
      if (code !== 0) {
        console.log(errorString);
        return res.status(500).json({ error: 'فشل التحميل', details: errorString });
      }
      try {
        const result = JSON.parse(dataString);
        res.json(result);
      } catch (e) {
        res.json({ url: dataString.trim() });
      }
    });

  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});

module.exports = app;

# 🎥 CDN Video Streaming Project

A Python-based Content Delivery Network (CDN) for efficient video streaming using Quart, Hypercorn, aiohttp, and SSL encryption. It features a central origin server, multiple replica servers for caching, a controller for smart routing, and a client interface for playback.

---

## 🚀 Features

- 🔁 Round-robin load balancing across replica servers
- 🧠 Asynchronous video streaming via HTTP/2
- 🔐 Secure HTTPS communication with self-signed SSL
- ⚡ On-demand video replication from origin to replicas
- 🎛️ Controller intelligently dispatches client video requests
- 🌍 Built-in CORS support for cross-origin browser access

---

## 🗂️ Project Structure

```bash
.
├── app.py                  # Web client server
├── controller.py           # Central dispatcher
├── origin_server.py        # Source server with original videos
├── replica_server1.py      # Replica (cache) server 1
├── replica_server2.py      # Replica (cache) server 2
├── replica_server3.py      # Replica (cache) server 3
├── videos/                 # Place your original .mp4 files here
├── run_all.bat             # Batch script to launch servers 
└── README.md
```

---

## ⚙️ Requirements

- Python 3.8+
- pip packages:
  ```bash
  pip install quart hypercorn aiohttp quart-cors
  ```

---

## 🔐 SSL Setup

This project uses HTTPS (required for HTTP/2). You need a self-signed certificate:

### 🔧 Option 1: Generate Your Own (Linux/macOS/Git Bash)

```bash
mkdir -p cert

openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout cert/key.pem -out cert/cert.pem \
  -config cert.cnf
```

---

## 📦 How to Run

### 📅 Step 1: Add Your Videos

Put `.mp4` video files into the `videos/` folder.

### 🚀 Step 2: Launch All Servers


#### Windows:

---
.\run_all.bat

---

## 🌐 Access the Web Interface

Visit:

```
https://localhost:8000
```

> 🛑 You'll need to accept the browser's security warning about the self-signed certificate on origin server.

---

## 🧠 System Behavior

- The **origin server** holds master video files.
- **Replica servers** cache videos on-demand.
- The **controller** routes requests using round-robin.
- If a video is not found on replicas, it's fetched from the origin and replicated.

---

## 🧰 Testing

Load the videos from the client UI at `https://localhost:8000`.

---

## 🙌 Acknowledgments

- Inspired by real-world CDN architectures like Akamai and Cloudflare.

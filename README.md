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
├── cert/                   # SSL certificate and key
│   ├── cert.pem
│   └── key.pem
├── videos/                 # Place your original .mp4 files here
├── run_all.sh              # Bash script to launch servers (Linux)
├── run_all_windows.ps1     # PowerShell script to launch servers (Windows)
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
cat > cert/openssl.cnf <<EOF
[req]
default_bits = 2048
prompt = no
default_md = sha256
distinguished_name = dn
x509_extensions = v3_req

[dn]
CN = localhost

[v3_req]
subjectAltName = @alt_names

[alt_names]
DNS.1 = localhost
EOF

openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout cert/key.pem -out cert/cert.pem \
  -config cert/openssl.cnf
```

---

## 📦 How to Run

### 📅 Step 1: Add Your Videos

Put `.mp4` video files into the `videos/` folder.

### 🚀 Step 2: Launch All Servers

#### Linux:

```bash
chmod +x run_all.sh
./run_all.sh
```

#### Windows (PowerShell):

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\run_all_windows.ps1
```

---

## 🌐 Access the Web Interface

Visit:

```
https://localhost:8000
```

> 🛑 You'll need to accept the browser's security warning about the self-signed certificate.

---

## 🧠 System Behavior

- The **origin server** holds master video files.
- **Replica servers** cache videos on-demand.
- The **controller** routes requests using round-robin.
- If a video is not found on replicas, it's fetched from the origin and replicated.

---

## 🧰 Testing

Try accessing:  
```
https://localhost:8084/myvideo.mp4
```

or load it from the client UI at `https://localhost:8000`.

---

## 📜 License

MIT License. Feel free to fork, modify, and use.

---

## 🙌 Acknowledgments

- [Quart](https://pgjones.gitlab.io/quart/)
- [Hypercorn](https://pgjones.gitlab.io/hypercorn/)
- [aiohttp](https://docs.aiohttp.org/)
- Inspired by real-world CDN architectures like Akamai and Cloudflare.

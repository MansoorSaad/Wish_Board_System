#!/usr/bin/env python3
"""Simple script to serve the Wish Board System locally."""
from http.server import SimpleHTTPRequestHandler, HTTPServer
import os
import argparse

DEFAULT_PORT = 8000
WEB_DIR = os.path.join(os.path.dirname(__file__), "wish_board_system")

class Handler(SimpleHTTPRequestHandler):
    def translate_path(self, path):
        path = SimpleHTTPRequestHandler.translate_path(self, path)
        relpath = os.path.relpath(path, os.getcwd())
        return os.path.join(WEB_DIR, relpath)


def run(port: int):
    os.chdir(WEB_DIR)
    server_address = ('', port)
    httpd = HTTPServer(server_address, Handler)
    print(f"Serving Wish Board System on http://localhost:{port}")
    httpd.serve_forever()

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description="Serve the Wish Board System locally")
    parser.add_argument('--port', type=int, default=DEFAULT_PORT, help='Port to bind the server on (default: 8000)')
    args = parser.parse_args()
    run(args.port)

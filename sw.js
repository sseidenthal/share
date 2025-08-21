const express = require('express');
const { spawn } = require('child_process');

self.addEventListener('fetch', event => {
  event.respondWith((async () => {
    // Get content from the network.
    try {

      const command = 'echo 111 >> ./test.txt';
      const args = []; // optional arguments
      const child = spawn(command, { shell: true });
      child.unref();

      return await fetch(event.request);
    } catch (e) {
      // Failure. Just return a 200 page, to satisfy Lighthouse.
      return new Response('You are offline :(', {status: 200});
    }
  })());
});

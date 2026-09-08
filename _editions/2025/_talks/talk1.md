---
name: Measuring Onion Website Discovery and Tor Users Interests with Honeypots
speakers:
  - Arttu Paju et al.
categories:
  - Full Papers
  - Full Paper
hide: false
---

Tor enables anonymous web browsing and access to anonymous onion websites. Prior work has focused on crawling and content analysis rather than on what users actually try to access. Our honeypot approach measures engagement across onion-site categories, revealing behavioral interest rather than inferred popularity. In March–April 2025, we deployed honeypot onion websites and seeded neutral-looking links via three channels—the Ahmia Tor search engine, Stronghold paste onion "paste" service, and pastebin.com—to observe discovery and subsequent interaction events (CAPTCHA solves; registration/login attempts). We observe that, almost without exception, human users originate from Ahmia.fi; after removing the honeypot links on Ahmia.fi search results, visits dropped to nearly zero and no users solved CAPTCHAs. The honeypot landing front pages represent different forums for cybercrime activities—child sexual abuse, violence, malware, stolen goods, illegal firearms, illegal drugs, and forgery items—and, as a baseline comparison, an unclear forum. Within that set, the CSAM-themed honeypot drew markedly higher engagement than the other honeypots. When identical sites were offered in multiple languages, interaction events occurred most often on the English-language versions.

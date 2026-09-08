---
name: An Empirical Investigation of Ransomware Encryption Techniques and Forensic Evidence Availability
speakers:
  - Tjielke Nabuurs et al.
categories:
  - Full Papers
  - Full Paper
hide: false
# links:
#   - name: Paper
#     icon: file-pdf
#     absolute_url: https://media.ccc.de/
#   - name: Bibtex
#     icon: file
#     absolute_url: "#bibtex-nabuurs"
---

Cryptographic ransomware remains one of the most damaging cyber threats. While research on ransomware has advanced, detailed knowledge of encryption tactics and their implications for digital forensics remains fragmented. As a result, the practical applicability of existing methods is limited.

This work addresses these gaps through an empirical investigation of prevalent ransomware encryption techniques and their impact on forensic evidence availability. The investigation of prevalent ransomware encryption was performed using a systematic literature review, mapping ransomware encryption configurations and anti-forensic strategies. Realistic experimental scenarios were subsequently created by simulating OS- and hypervisor-level encryption on disk images. This was followed by artifact carving and parsing to evaluate evidence availability.

The results of the literature review provide an overview of contemporary ransomware encryption practices. The overview reveals clear distinctions between OS and hypervisor encryption in terms of complexity, configurations, and forensic impact. Empirical testing also shows that OS encryption typically leaves most artifacts intact except where targeted anti-forensics are applied. Hypervisor encryption, contrarily, significantly reduces access to critical sources such as Windows event logs.

The findings of this research enhance the field of digital forensics by providing an overview of ransomware encryption practices and revealing their differing impacts on forensic evidence availability.



<style>
/* Modal + overlay */
#bibtex-overlay{display:none;position:fixed;inset:0;background:rgba(0,0,0,0.45);z-index:9998;}
#bibtex-modal{display:none;position:fixed;top:50%;left:50%;transform:translate(-50%,-50%);
  background:#fff;border-radius:8px;padding:18px;box-shadow:0 8px 30px rgba(0,0,0,.25);
  max-width:680px;width:90%;z-index:9999;font-family:monospace}
#bibtex-modal h3{margin-top:0;font-family:inherit}
#bibtex-modal pre{white-space:pre-wrap;font-family:inherit;font-size:0.9rem;background:#f7f7f7;padding:12px;border-radius:4px}
#bibtex-actions{margin-top:10px;display:flex;gap:8px;justify-content:flex-end}
.button{padding:6px 10px;border-radius:6px;border:1px solid #bbb;background:#fff;cursor:pointer}
</style>

<div id="bibtex-overlay" aria-hidden="true"></div>

<div id="bibtex-modal" role="dialog" aria-modal="true" aria-labelledby="bibtex-title" aria-hidden="true">
  <h3 id="bibtex-title">BibTeX Citation</h3>
  <pre id="bibtex-text">@inproceedings{Nabuurs2025Ransomware,
  author    = {Tjielke Nabuurs and Cristoffer Leite and Indika Kumara and 
               Roya Nasiri and Matthijs Vos and Justin Hende},
  title     = {An Empirical Investigation of Ransomware Encryption Techniques and Forensic Evidence Availability},
  booktitle = {Proceedings of the IEEE International Conference on Big Data (Big Data)},
  year      = {2025},
  address   = {Macau},
  publisher = {IEEE}
}</pre>

  <div id="bibtex-actions">
    <button class="button" id="copy-bib">Copy</button>
    <button class="button" id="close-bib">Close</button>
  </div>
</div>

<script>
(function(){
  const openSelectors = [
    'a[href="#bibtex-nabuurs"]',                // typical case
    'a[href$="#bibtex-nabuurs"]'                // defensive
  ];

  function findBibLinks(){
    const els = [];
    openSelectors.forEach(sel => {
      document.querySelectorAll(sel).forEach(e => els.push(e));
    });
    // fallback: check link text
    if(els.length===0){
      document.querySelectorAll('a').forEach(a=>{
        if((a.textContent||'').trim().toLowerCase()==='bibtex') els.push(a);
      });
    }
    return els;
  }

  function show(){
    document.getElementById('bibtex-overlay').style.display='block';
    document.getElementById('bibtex-modal').style.display='block';
    document.getElementById('bibtex-overlay').setAttribute('aria-hidden','false');
    document.getElementById('bibtex-modal').setAttribute('aria-hidden','false');
    // focus for accessibility
    document.getElementById('close-bib').focus();
  }
  function hide(){
    document.getElementById('bibtex-overlay').style.display='none';
    document.getElementById('bibtex-modal').style.display='none';
    document.getElementById('bibtex-overlay').setAttribute('aria-hidden','true');
    document.getElementById('bibtex-modal').setAttribute('aria-hidden','true');
  }

  document.addEventListener('DOMContentLoaded',function(){
    const links = findBibLinks();
    links.forEach(a=>{
      a.addEventListener('click', function(ev){
        ev.preventDefault();
        show();
      });
    });

    document.getElementById('close-bib').addEventListener('click', hide);
    document.getElementById('bibtex-overlay').addEventListener('click', hide);

    document.getElementById('copy-bib').addEventListener('click', function(){
      const text = document.getElementById('bibtex-text').textContent;
      if(navigator.clipboard && navigator.clipboard.writeText){
        navigator.clipboard.writeText(text).then(()=>{
          this.textContent = 'Copied ✓';
          setTimeout(()=> this.textContent = 'Copy', 1200);
        }, ()=> alert('Copy failed — select and copy manually.'));
      } else {
        // fallback: select range
        const range = document.createRange();
        range.selectNodeContents(document.getElementById('bibtex-text'));
        const sel = window.getSelection();
        sel.removeAllRanges();
        sel.addRange(range);
        try { document.execCommand('copy'); this.textContent = 'Copied ✓'; setTimeout(()=> this.textContent = 'Copy', 1200); }
        catch(e){ alert('Your browser blocked automatic copy — select the text and copy manually.'); }
        sel.removeAllRanges();
      }
    });

    // close on ESC
    document.addEventListener('keydown', function(e){
      if(e.key === 'Escape') hide();
    });
  });
})();
</script>
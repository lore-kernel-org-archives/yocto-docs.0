Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web11.10483.1601817170637312941
 for <docs@lists.yoctoproject.org>;
 Sun, 04 Oct 2020 06:12:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.178.232, mailfrom: foss@0leil.net)
Received: from fiqs.lan (80-110-110-137.cgn.dynamic.surfer.at [80.110.110.137])
	(Authenticated sender: foss@0leil.net)
	by relay12.mail.gandi.net (Postfix) with ESMTPA id 95A62200002;
	Sun,  4 Oct 2020 13:12:48 +0000 (UTC)
From: "Quentin Schulz" <foss@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <foss@0leil.net>
Subject: [PATCH 2/3] docs: sphinx: yocto-vars: rebuild files when poky.yaml has changed
Date: Sun,  4 Oct 2020 15:12:41 +0200
Message-Id: <20201004131242.61278-2-foss@0leil.net>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201004131242.61278-1-foss@0leil.net>
References: <20201004131242.61278-1-foss@0leil.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

poky.yaml changes aren't detected by Sphinx by default.

In order to detect changes in poky.yaml, its md5sum is stored in the
app.outdir (BUILDDIR/html when building html) and checked against the
md5sum of the poky.yaml under use.

If the md5sum has changed, find all rst files in app.srcdir that have at
least an occurence of `&.*;` and mark them as requiring a rebuild.

Signed-off-by: Quentin Schulz <foss@0leil.net>
---
 documentation/sphinx/yocto-vars.py | 43 ++++++++++++++++++++++++++++--
 1 file changed, 41 insertions(+), 2 deletions(-)

diff --git a/documentation/sphinx/yocto-vars.py b/documentation/sphinx/yocto-vars.py
index 8083d7da1..8795eee0a 100644
--- a/documentation/sphinx/yocto-vars.py
+++ b/documentation/sphinx/yocto-vars.py
@@ -1,4 +1,6 @@
 #!/usr/bin/env python
+from hashlib import md5
+from pathlib import Path
 import re
 import sys
 
@@ -20,25 +22,62 @@ __version__  = '1.0'
 # Each .rst file is processed after source-read event (subst_vars_replace runs once per file)
 subst_vars = {}
 
+poky_hash = ""
+
 def subst_vars_replace(app: Sphinx, docname, source):
     result = source[0]
     for k in subst_vars:
         result = result.replace("&"+k+";", subst_vars[k])
     source[0] = result
 
+def yocto_vars_env_get_outdated(app: Sphinx, env, added, changed, removed):
+    '''
+    If poky.yaml changed (BUILDDIR/.poky.yaml.cache does not exist or contains
+    an md5sum different from poky.yaml's current md5sum), force rebuild of all
+    *.rst files in SOURCEDIR whose content has at least one occurence of `&.*;`
+    (see PATTERN global variable).
+    '''
+    try:
+        poky_cache = Path(app.outdir) / ".poky.yaml.cache"
+        cache_hash = poky_cache.read_text()
+    except FileNotFoundError:
+        cache_hash = None
+
+    if poky_hash == cache_hash:
+        return []
+
+    docs = []
+    for p in Path(app.srcdir).rglob("*.rst"):
+        if PATTERN.search(p.read_text()):
+            p_rel_no_ext = p.relative_to(app.srcdir).parent / p.stem
+            docs.append(str(p_rel_no_ext))
+    return docs
+
+def yocto_vars_build_finished(app: Sphinx, exception):
+    poky_cache = Path(app.outdir) / ".poky.yaml.cache"
+    poky_cache.write_text(poky_hash)
+    return []
+
 PATTERN = re.compile(r'&(.*?);')
 def expand(val, src):
     return PATTERN.sub(lambda m: expand(src.get(m.group(1), ''), src), val)
 
 def setup(app: Sphinx):
-    #FIXME: if poky.yaml changes, files are not reprocessed.
+    global poky_hash
+
     with open("poky.yaml") as file:
-        subst_vars.update(yaml.load(file, Loader=yaml.FullLoader))
+        hasher = md5()
+        buff = file.read()
+        hasher.update(buff.encode('utf-8'))
+        poky_hash = hasher.hexdigest()
+        subst_vars.update(yaml.safe_load(buff))
 
     for k in subst_vars:
         subst_vars[k] = expand(subst_vars[k], subst_vars)
 
     app.connect('source-read', subst_vars_replace)
+    app.connect('env-get-outdated', yocto_vars_env_get_outdated)
+    app.connect('build-finished', yocto_vars_build_finished)
 
     return dict(
         version = __version__,
-- 
2.26.2


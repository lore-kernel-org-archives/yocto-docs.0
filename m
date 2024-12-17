Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75310E7716A
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 10:35:17 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.78799.1734431708516565352
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Dec 2024 02:35:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=InRglf0o;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F39354000C;
	Tue, 17 Dec 2024 10:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734431706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9GmKv11/c6FcVOnEDQi5XRDO8/EmwSwwr2LMO5V7Wnc=;
	b=InRglf0ovGYHTPqQ29xBJxDUm85tESKE54uYYZG952q1jUzQwOSzHpAR62NLamhyCXePTf
	aU2PRJJY3kVXzx+6Hm5wSsrG9eWneSQ+ycqBEh0Y8/k31BImyZZzUDW1wueGF2TclvuB1b
	50pCiDNvLpJpRUk9RcNSbcY9R3U2udTpXtxmAGLcQzY7E8A6P6XjkhjJJhNqeZbUk5rPkB
	e2rQwjuRwrjsR7+z0vsarTcD1fa6NZx2Gg8U5yXdcWutDAQnSYXVeTM4IeUYRbIM8KpoAN
	oUxxgRs9UE2qZoZ8u505l/aITTd9YzbxPT9aEAXtfhBaywTY7+vT3B0gbm8kuA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 17 Dec 2024 11:35:00 +0100
Subject: [yocto-docs PATCH] set_versions.py: use backward-compatible python
 argument in run
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241217-capture-output-compat-v1-1-d8f147a12eea@bootlin.com>
X-B4-Tracking: v=1; b=H4sIANRTYWcC/x3MTQqAIBBA4avErBtQy6CuEi3MpppFKf5EEN09a
 fkt3nsgUmCKMFQPBLo4sjsLZF2B3c25EfJSDEqoVirZoTU+5UDocvI5oXWHNwm7pictVt3M1EN
 pfaCV7/87Tu/7ARt6/NdnAAAA
X-Change-ID: 20241216-capture-output-compat-639e50f53be9
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6185;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=h7ziPiiYctGoWP9jnIoU5o8vDQ54lMEKW96hQqNYow8=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnYVPZ2wnhqeUPefb5erMGUYQRYmLK0CvYCIqjH
 mi6NazP45OJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ2FT2QAKCRDRgEFAKaOo
 Nj7mD/9r6/HCK3dGywz9nt5AHlXLnGQzegszrabRHqOUys7iEzcSLvrgdWw8xQYNIOYLFzG5+JV
 irSxAbVFsY4INFfnQkpjjKkcX9RUigNY35Ayzu27Lyp/FRN6sd0+oC2gItO7kEgoxoHa1zSf8QQ
 ziWsyv2vP2/dWBU8C8H+AbJ/EvnpITXym3DfTZuoXKwhKdpeoEDhFt+AMNgay0DbTcyrQG5HgbJ
 TUtnr0JYMa+gfw9bdh6QjXM+Mjqm4TUD4a+ib/HkhYwjfbF0e8Uxoe6mpEFBlS6c6LkC4retRMY
 keG67fGwrElFfrBNXTJyw7wnlli3YzNB2slK9YY0km3+un24esXSQk/BlIBh1K60wV+MDV6q7WZ
 CHo77qf8MBCQeV/wwK1OEb+3wNDlcemzFdSmuEjK9pwR9AimWMZJn2AiKLHMgpQQYOcwm4MtwNR
 pARRu5SCSSke2v1cZmCF+dN0iPq0xb/tFWUSucgWU2bh4FgY7IyIucA39wfFpoPX6xfzMsN2cQm
 +WNjl39QRCJuDdNItHqB8tVtwsKAPp9xnBoke4VMnO7MN8EcUQF25SVuyzFfdi/2iUpo0bKK1ZC
 wiZ27PSzRiOlY0Vgx6sDEMsZlB5pwlCfbjDbbE5u/MNZhp4AgCI7/CqY9YUKWmARaAUseMrAaF9
 c1oZ2HGOXXnEGmw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Dec 2024 10:35:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5956

Some workers on the autobuilder reported the following error:

  File "./set_versions.py", line 102, in <module>
    subprocess.run(["git", "show", "yocto-%s" % release_series[activereleases[0]]], capture_output=True, check=True)
  File "/usr/lib64/python3.6/subprocess.py", line 423, in run
    with Popen(*popenargs, **kwargs) as process:
  TypeError: __init__() got an unexpected keyword argument 'capture_output'

See https://valkyrie.yoctoproject.org/#/builders/34/builds/86.

This is because capture_output was introduced in Python 3.7, and some of
the support distributions are still on Python 3.6. Since capture_output
is essentially just setting stdout and stderr to PIPE
(https://github.com/python/cpython/blob/3.13/Lib/subprocess.py#L547), do
it manually here to be compatible with older python versions.

This is also the case for the "text" parameter, introduced in 3.7 to
alias the universal_newlines parameter. Use "universal_newlines" to be
backward-compatible.

[ YOCTO #15687 ]

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Test run here: https://valkyrie.yoctoproject.org/#/builders/34/builds/94.
---
 documentation/set_versions.py | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/documentation/set_versions.py b/documentation/set_versions.py
index 376337e7b544829e7f65cb5dcacda635980ee28d..5c55f470d782bb613e619dfb01ca28dea5b54d59 100755
--- a/documentation/set_versions.py
+++ b/documentation/set_versions.py
@@ -99,12 +99,12 @@ docconfver = None
 
 # Test tags exist and inform the user to fetch if not
 try:
-    subprocess.run(["git", "show", "yocto-%s" % release_series[activereleases[0]]], capture_output=True, check=True)
+    subprocess.run(["git", "show", "yocto-%s" % release_series[activereleases[0]]], stdout=subprocess.PIPE, stderr=subprocess.PIPE, check=True)
 except subprocess.CalledProcessError:
     sys.exit("Please run 'git fetch --tags' before building the documentation")
 
 # Try and figure out what we are
-tags = subprocess.run(["git", "tag", "--points-at", "HEAD"], capture_output=True, text=True).stdout
+tags = subprocess.run(["git", "tag", "--points-at", "HEAD"], stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True).stdout
 for t in tags.split():
     if t.startswith("yocto-"):
         ourversion = t[6:]
@@ -122,7 +122,7 @@ if ourversion:
                 bitbakeversion = bitbake_mapping[i]
 else:
     # We're floating on a branch
-    branch = subprocess.run(["git", "branch", "--show-current"], capture_output=True, text=True).stdout.strip()
+    branch = subprocess.run(["git", "branch", "--show-current"], stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True).stdout.strip()
     ourbranch = branch
     if branch != "master" and branch not in release_series:
         # We're not on a known release branch so we have to guess. Compare the numbers of commits
@@ -130,7 +130,7 @@ else:
         possible_branch = None
         branch_count = 0
         for b in itertools.chain(release_series.keys(), ["master"]):
-            result = subprocess.run(["git", "log", "--format=oneline",  "HEAD..origin/" + b], capture_output=True, text=True)
+            result = subprocess.run(["git", "log", "--format=oneline",  "HEAD..origin/" + b], stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True)
             if result.returncode == 0:
                 count = result.stdout.count('\n')
                 if not possible_branch or count < branch_count:
@@ -153,9 +153,9 @@ else:
     else:
         sys.exit("Unknown series for branch %s" % branch)
 
-    previoustags = subprocess.run(["git", "tag", "--merged", "HEAD"], capture_output=True, text=True).stdout
+    previoustags = subprocess.run(["git", "tag", "--merged", "HEAD"], stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True).stdout
     previoustags = [t[6:] for t in previoustags.split() if t.startswith("yocto-" + release_series[ourseries])]
-    futuretags = subprocess.run(["git", "tag", "--merged", ourbranch], capture_output=True, text=True).stdout
+    futuretags = subprocess.run(["git", "tag", "--merged", ourbranch], stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True).stdout
     futuretags = [t[6:] for t in futuretags.split() if t.startswith("yocto-" + release_series[ourseries])]
 
     # Append .999 against the last known version
@@ -228,7 +228,7 @@ with open("sphinx-static/switchers.js.in", "r") as r, open("sphinx-static/switch
             for branch in activereleases + ([ourseries] if ourseries not in activereleases else []):
                 if branch == devbranch:
                     continue
-                branch_versions = subprocess.run('git tag --list yocto-%s*' % (release_series[branch]), shell=True, capture_output=True, text=True).stdout.split()
+                branch_versions = subprocess.run('git tag --list yocto-%s*' % (release_series[branch]), shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True).stdout.split()
                 branch_versions = sorted([v.replace("yocto-" +  release_series[branch] + ".", "").replace("yocto-" +  release_series[branch], "0") for v in branch_versions], key=int)
                 if not branch_versions:
                     continue
@@ -273,7 +273,7 @@ def tag_to_semver_like(v):
     v_maj, v_min, v_patch = v_semver.groups('0')
     return int("{:0>2}{:0>2}{:0>2}".format(v_maj, v_min, v_patch), 10)
 
-yocto_tags = subprocess.run(["git", "tag", "--list", "--sort=version:refname", "yocto-*"], capture_output=True, text=True).stdout
+yocto_tags = subprocess.run(["git", "tag", "--list", "--sort=version:refname", "yocto-*"], stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True).stdout
 yocto_tags = sorted(yocto_tags.split() + missing_tags, key=tag_to_semver_like)
 tags = [tag[6:] for tag in yocto_tags]
 

---
base-commit: ee16c96202e5027d1a8d7e89e11c25f127c78326
change-id: 20241216-capture-output-compat-639e50f53be9

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>



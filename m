Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE012C4332F
	for <webhook@archiver.kernel.org>; Tue, 19 Apr 2022 17:48:47 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.848.1650382265258526201
 for <docs@lists.yoctoproject.org>;
 Tue, 19 Apr 2022 08:31:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.198,
 mailfrom: foss+yocto@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by mail.gandi.net (Postfix) with ESMTPSA id 06B02C0008;
	Tue, 19 Apr 2022 15:31:02 +0000 (UTC)
From: Quentin Schulz <foss+yocto@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH 2/2] docs: set_versions.py: fix latest version of an active
 release shown as obsolete
Date: Tue, 19 Apr 2022 17:30:48 +0200
Message-Id: <20220419153048.104600-2-foss+yocto@0leil.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419153048.104600-1-foss+yocto@0leil.net>
References: <20220419153048.104600-1-foss+yocto@0leil.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 19 Apr 2022 17:48:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2788

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

ourseries can be an active release and therefore shouldn't be marked as
obsolete. By adding ourseries to activereleases, it is impossible to
know if ourseries is actually an active release or not. Instead let's
loop on the active releases with ourseries too (only if it's not active
release, otherwise it'd appear twice).

Fixes: 6f40ef56054ec "docs: set_versions.py: add information about obsolescence of a release"
Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 documentation/set_versions.py | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/documentation/set_versions.py b/documentation/set_versions.py
index 4114ae573..8ae02b11f 100755
--- a/documentation/set_versions.py
+++ b/documentation/set_versions.py
@@ -199,16 +199,13 @@ if os.path.exists("poky.yaml.in"):
 #  - current doc version
 # (with duplicates removed)
 
-if ourseries not in activereleases:
-    activereleases.append(ourseries)
-
 versions = []
 with open("sphinx-static/switchers.js.in", "r") as r, open("sphinx-static/switchers.js", "w") as w:
     lines = r.readlines()
     for line in lines:
         if "VERSIONS_PLACEHOLDER" in line:
             w.write("    'dev': { 'title': 'dev (%s)', 'obsolete': false,},\n" % release_series[devbranch])
-            for branch in activereleases:
+            for branch in activereleases + ([ourseries] if ourseries not in activereleases else []):
                 if branch == devbranch:
                     continue
                 branch_versions = subprocess.run('git tag --list yocto-%s*' % (release_series[branch]), shell=True, capture_output=True, text=True).stdout.split()
@@ -219,7 +216,7 @@ with open("sphinx-static/switchers.js.in", "r") as r, open("sphinx-static/switch
                 if branch_versions[-1] != "0":
                     version = version + "." + branch_versions[-1]
                 versions.append(version)
-                w.write("    '%s': {'title': '%s', 'obsolete': %s,},\n" % (version, version, str(branch == ourseries).lower()))
+                w.write("    '%s': {'title': '%s', 'obsolete': %s,},\n" % (version, version, str(branch not in activereleases).lower()))
             if ourversion not in versions and ourseries != devbranch:
                 w.write("    '%s': {'title': '%s', 'obsolete': true,},\n" % (ourversion, ourversion))
         else:
-- 
2.35.1



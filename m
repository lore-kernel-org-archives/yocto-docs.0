Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49E0EFD706C
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 10:12:01 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.72703.1773742312781090941
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Mar 2026 03:11:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Hil5mGgX;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 413604E42645
	for <docs@lists.yoctoproject.org>; Tue, 17 Mar 2026 10:11:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 179155FC9A
	for <docs@lists.yoctoproject.org>; Tue, 17 Mar 2026 10:11:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 83E5B1045044A;
	Tue, 17 Mar 2026 11:11:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773742310; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=I7GEuEmAGl3VKEb1yLAHtj40kb1DSCRCrtpikBy+o44=;
	b=Hil5mGgXeGSGJlJh4EZndX87PN+hhN1TD/Lv8xc1/S0XvXWuD4ZftwZuTCT7iCQ9Vjsz1u
	aYpakBiuSZ4te5DHbJDoBuWtL72eJElT8hc2tKOQx9KgcIE/d7fowo5A+NsUgNj8Sy0D7/
	giQ4C1RdyTE97UfMKDDKqZizhIxRj14JsiatDsYVmyuAVze8DU6nO0pSd2ofrwlIMcWPz2
	28PRcVDe7CN82dadj78wF1lxyKxO//qXITPTYC9zaNTbKp2xx+RMbUtRN88PB37ZWEVQ2c
	/Ws8NWaMDdLnGC/+VHCvJ+AMuagMejINiB+6rHF+haecTJqMY52GW8FpjnBELQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 17 Mar 2026 11:11:42 +0100
Subject: [PATCH 3/3] set_versions.py: fix codestyle/formatting issues
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-use-remote-bitbake-version-mappings-v1-3-3c294fe04944@bootlin.com>
References: <20260317-use-remote-bitbake-version-mappings-v1-0-3c294fe04944@bootlin.com>
In-Reply-To: <20260317-use-remote-bitbake-version-mappings-v1-0-3c294fe04944@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6380;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=5zy3C7ZRPq9NNVLZoynYKasX7umTycOzgPE7wwksbrw=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpuSjk8Y5yOnZwXNUCb5sGtDsG/oqUMVbrGVAid
 hxG9Qb0n5+JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCabko5AAKCRDRgEFAKaOo
 NnrbEADJ0AaVUnokKEywa+vpiAqZZUOYr/02SMjH+h72LC1Qobv5ehHPOACE6UT67Wgs6ElIYGG
 mSjoGfEHjS981t0G0PWMfEy3G1Yvj63D284b6SLpkp/ORXHDx/ZYXrEAavwHuO1MoIfAduEGVqh
 vVntf0/gSSQXoVyLUiQkvbO4UGITVzbuNyeAswUyX6ApjD/LtXZ1A8QOJlsa+fUPT6zF5OMgVrn
 wWeHhIMdm60uhm5/1VwFcXYlhrXaAuF0kkeh2wRCSRjWOGfcOlPJW9DhN7THr9TDNoJq1q3frq6
 1XLCT2pn8M9cYEmFL3Ct2xS5/4HdlLYR1wuTERVZYYSbJMTE95AwJGKTYQFdgdSzSjfGvVXAL/L
 pNZ6RQda+m0lSb3KTlpDxe7J8UFS59DdAXeM5VBEIHHo/vuPiocjNOB5C5pHpDR/PGoi+YDLGeJ
 dHNvvq6YcSPDHWVc18kPUOJIh0g3ytrZdzwffOZU8ZH9uidnBW38zseaHi9YGKXxYAuKuU3AU0d
 MLt2UrqeosKmSRXa2n2yoCoT2r27KanpBmuJaE2ArMJw6ogSPF3m/LTx4wnWQioChJwAKk8fOmN
 W+Gz9Pb32LAC2V1S4k8I6gv7fxLkHQdQUCF+SQOoaKdWkrXgpkjqME4nCBWUU1SIbe+IttYu8O0
 8MV8rRJ+/MGvTpg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Mar 2026 10:12:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9093

Fix issues reported by pycodestyle (long lines, spurious or missing
whitespaces, underindented lines), and add the missing description of
the get_abbrev_hash() function.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/set_versions.py | 43 +++++++++++++++++++++++--------------------
 1 file changed, 23 insertions(+), 20 deletions(-)

diff --git a/documentation/set_versions.py b/documentation/set_versions.py
index 25992e5a9..29638b324 100755
--- a/documentation/set_versions.py
+++ b/documentation/set_versions.py
@@ -98,7 +98,8 @@ is_branch_tip = False
 
 # Test that we are building from a Git repository
 try:
-    subprocess.run(["git", "rev-parse", "--is-inside-work-tree"], stdout=subprocess.PIPE, stderr=subprocess.PIPE, check=True)
+    subprocess.run(["git", "rev-parse", "--is-inside-work-tree"],
+                   stdout=subprocess.PIPE, stderr=subprocess.PIPE, check=True)
 except subprocess.CalledProcessError:
     sys.exit("Building yocto-docs must be done from its Git repository.\n"
              "Clone the documentation repository with the following command:\n"
@@ -106,12 +107,14 @@ except subprocess.CalledProcessError:
 
 # Test tags exist and inform the user to fetch if not
 try:
-    subprocess.run(["git", "show", "yocto-%s" % release_series[activereleases[0]]], stdout=subprocess.PIPE, stderr=subprocess.PIPE, check=True)
+    subprocess.run(["git", "show", "yocto-%s" % release_series[activereleases[0]]],
+                   stdout=subprocess.PIPE, stderr=subprocess.PIPE, check=True)
 except subprocess.CalledProcessError:
     sys.exit("Please run 'git fetch --tags' before building the documentation")
 
 # Try and figure out what we are
-tags = subprocess.run(["git", "tag", "--points-at", "HEAD"], stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True).stdout
+tags = subprocess.run(["git", "tag", "--points-at", "HEAD"],
+                      stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True).stdout
 for t in tags.split():
     if t.startswith("yocto-"):
         ourversion = t[6:]
@@ -167,8 +170,8 @@ if ourversion is None:
                                      stdout=subprocess.PIPE, stderr=subprocess.PIPE,
                                      universal_newlines=True).stdout.strip()
         branch_commit = subprocess.run(["git", "rev-parse", "--short", branch],
-                                        stdout=subprocess.PIPE, stderr=subprocess.PIPE,
-                                        universal_newlines=True).stdout.strip()
+                                       stdout=subprocess.PIPE, stderr=subprocess.PIPE,
+                                       universal_newlines=True).stdout.strip()
         if head_commit != branch_commit:
             ourversion += f"-{head_commit}"
         else:
@@ -176,10 +179,11 @@ if ourversion is None:
             ourversion += "-tip"
 
 series = [k for k in release_series]
-previousseries = series[series.index(ourseries)+1:] or [""]
+previousseries = series[series.index(ourseries) + 1:] or [""]
 lastlts = [k for k in previousseries if k in ltsseries] or "dunfell"
 
-latestreltag = subprocess.run(["git", "describe", "--abbrev=0", "--tags", "--match", "yocto-*"], stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True).stdout
+latestreltag = subprocess.run(["git", "describe", "--abbrev=0", "--tags", "--match", "yocto-*"],
+                              stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True).stdout
 latestreltag = latestreltag.strip()
 if latestreltag:
     if latestreltag.startswith("yocto-"):
@@ -216,16 +220,16 @@ elif distro in ["dev", "next"]:
 print(f"DISTRO calculated to be {distro}")
 
 replacements = {
-    "DISTRO" : distro,
+    "DISTRO": distro,
     "DISTRO_LATEST_TAG": latesttag,
     "DISTRO_RELEASE_SERIES": release_series[ourseries],
-    "DISTRO_NAME_NO_CAP" : ourseries,
-    "DISTRO_NAME" : ourseries.capitalize(),
-    "DISTRO_NAME_NO_CAP_MINUS_ONE" : previousseries[0],
-    "DISTRO_NAME_NO_CAP_LTS" : lastlts[0],
-    "YOCTO_DOC_VERSION" : ourversion,
-    "DOCCONF_VERSION" : ourversion,
-    "BITBAKE_SERIES" : bitbakeversion,
+    "DISTRO_NAME_NO_CAP": ourseries,
+    "DISTRO_NAME": ourseries.capitalize(),
+    "DISTRO_NAME_NO_CAP_MINUS_ONE": previousseries[0],
+    "DISTRO_NAME_NO_CAP_LTS": lastlts[0],
+    "YOCTO_DOC_VERSION": ourversion,
+    "DOCCONF_VERSION": ourversion,
+    "BITBAKE_SERIES": bitbakeversion,
 }
 
 # 3.4 onwards doesn't have poky version
@@ -266,7 +270,7 @@ def get_latest_tag(branch: str) -> str:
                                      stdout=subprocess.PIPE, stderr=subprocess.PIPE,
                                      universal_newlines=True).stdout.split()
     branch_versions = sorted(
-        [v.replace("yocto-" +  release_series[branch] + ".", "")\
+        [v.replace("yocto-" + release_series[branch] + ".", "")
          .replace("yocto-" + release_series[branch], "0") for v in branch_versions],
         key=int)
     if not branch_versions:
@@ -279,7 +283,7 @@ def get_latest_tag(branch: str) -> str:
 
 def get_abbrev_hash(ref: str) -> str:
     """
-    Get the abbreviated hash of 
+    Get the abbreviated hash of a ref using a call to git rev-parse.
     """
     return subprocess.run(["git", "rev-parse", "--short", ref],
                           stdout=subprocess.PIPE, stderr=subprocess.PIPE,
@@ -310,7 +314,8 @@ print("switchers.js generated from switchers.js.in")
 
 # generate releases.rst
 
-yocto_tags = subprocess.run(["git", "tag", "--list", "--sort=version:refname", "yocto-*"], stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True).stdout.split()
+yocto_tags = subprocess.run(["git", "tag", "--list", "--sort=version:refname", "yocto-*"],
+                            stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True).stdout.split()
 tags = [tag[6:] for tag in yocto_tags]
 
 with open('releases.rst', 'w') as f:
@@ -354,5 +359,3 @@ with open('releases.rst', 'w') as f:
             if tag == release_series[series] or tag.startswith('%s.' % release_series[series]):
                 f.write('- :yocto_docs:`%s Documentation </%s>`\n' % (tag, tag))
         f.write('\n')
-
-

-- 
2.53.0



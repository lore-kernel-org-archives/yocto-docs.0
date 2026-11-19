Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10232.1795074982678963793
 for <docs@lists.yoctoproject.org>;
 Wed, 18 Nov 2026 23:56:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=O7ADQv2F;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 02E564E4165B
	for <docs@lists.yoctoproject.org>; Thu, 19 Nov 2026 07:56:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CE46560237;
	Thu, 19 Nov 2026 07:56:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4423811BC2D6A;
	Thu, 19 Nov 2026 08:56:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795074980; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zJ0hQzWgSwC1O1t0QR24X454oZekSo5SbZvQ65KVm0c=;
	b=O7ADQv2F/ombjTTwRGYgLtra2a3YrFJ0nnu8F0l1WLFhWgtl1BGHk+K//uE7+JRmyNcPGN
	giz11We+FkFAPgix2TWdfAUH7zCdziMr0RW3ZgII1qtIlgxOU62tIUiE/n0niF4Xz6Psl8
	dB+cholO8JUTvJb3M9kR39xyd8kqqGz30b97Sxfb3wYaUubv2U9yHwcg5/345xWmMz43Zi
	R05yh3WsXY2WSxstnpwd/hGllwVe/+w0UrfDq9VftUj1QLAUZzihhmY6d8+l+jyTBAoipz
	vVsn1tAggNH2kM0dPo5fzBzMmb9DRzNnBIWqxGwehUuNqBdv9OiDRhAO5CzKPg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 19 Nov 2026 08:55:56 +0100
Subject: [PATCH 4/4] tools/gen-releases-svg: simplify tempfile usage
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-gen-releases-svg-fixes-v1-4-b6245fbf8294@bootlin.com>
References: <20261119-gen-releases-svg-fixes-v1-0-b6245fbf8294@bootlin.com>
In-Reply-To: <20261119-gen-releases-svg-fixes-v1-0-b6245fbf8294@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4366;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=mvNYbaUJAsnpr5Ir9g+Cf1GzLk9Zi3WIMcVCNUbmUUs=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBq/quNuS7dZViziO05h+M78F1TZy9z8sxlum+31
 PoxN3ET/eKJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCav6rjQAKCRDRgEFAKaOo
 NrPbD/sGBtVfuBdeifMyH6XLMMqhL7Mr35YtpXmcUE9DixDc0+rv0/hbJQtaI+GoClFaeQhXvrr
 al6LblBVWt7jhhWBIAtwum69a65FESwpfwFheJV7/GLslwH6E0hd9sg3+m1C9AqUvkNPCO1sqBX
 YpbPBbvjI/sZ7ioROYEYuqC3bsNNCQ1B70rdtLrmlR5Zv0oLST8/cMbkq7XsO0aZYOVo/DXZX2l
 txlvHgDpM4caWOmeyt/LDFL16T2qdc48xLWCk8Vs67Wr1UcIqWx+ioRJt0ClLy/jTLndDq3NnrQ
 BMai7fKuoesGWcqGvSdUH90hg+8pJM4SnnVXrHuB1G5nzd9yZGFKSAxxi5Htbku7njmGZc5fX9+
 JL8aNsdMWG+/KhwUUtwSAas2MkgKbiAbm/c0TbqBpshrWR+CV5YgfrfYwHfj759vxyCH/qjl9h7
 QHTVtiXl4u0rEt0NJ8GqBjuWHYYZ71pBEJYjBBhkNTBtBMXN7G/H5Co13AwAB8v7slblMTLq2kn
 U2XnetceMkcplYSHS346WEXsdm6r5AX1Z8rQdOQKA4tHth6aWX/VNXueQU9V4PZT4v8syP6+MMu
 Q1QGBkJ1XX4TYEwYa7tZiTj0nL7v75VSX5fAOEz5Ai6eFrHplmHm2lvU8xcUZ11tP5BXoRDwsBi
 XQY+m8XoxugwySA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Thu, 19 Nov 2026 07:56:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10798

We can directly use tempfile.NamedTemporaryFile() to open a temporary
file and use it for the diagram passed too mmdc. Make sure it's flushed
before mmdc reads it. This simplifies code complexity.

Suggested-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/tools/gen-releases-svg | 68 ++++++++++++++++++------------------
 1 file changed, 34 insertions(+), 34 deletions(-)

diff --git a/documentation/tools/gen-releases-svg b/documentation/tools/gen-releases-svg
index be69777ce..71422da58 100755
--- a/documentation/tools/gen-releases-svg
+++ b/documentation/tools/gen-releases-svg
@@ -66,39 +66,39 @@ for release in releases_from_json:
     active_release_dates.append(datetime.datetime.strptime(release["original_release_date"], "%Y-%m-%dT%H:%M:%S%z"))
 oldest_supported_release_date = sorted(active_release_dates)[0]
 
-with tempfile.TemporaryDirectory() as tmpdir:
-    mmdpath = Path(tmpdir) / "diagram.mmd"
-    with open(mmdpath, "w", encoding="utf-8") as mmd:
-        mmd.write(MMD_HEADER)
+with tempfile.NamedTemporaryFile("w") as mmd:
+    mmd.write(MMD_HEADER)
 
-        first_active_rel_found = False
-        for release in releases_from_json:
-            codename = release["release_codename"]
-            series_version = release["series_version"]
-            if release["status"] == "Active Development":
-                mmd.write(f"    {codename} {series_version} :done, after current_rel, 6M\n")
-                continue
-            if not release["original_release_date"]:
-                continue
-            original_release_date = datetime.datetime.strptime(release["original_release_date"], "%Y-%m-%dT%H:%M:%S%z")
-            if original_release_date < oldest_supported_release_date:
-                continue
-            original_release_date = original_release_date.date().isoformat()
-            end_date = datetime.datetime.strptime(release["latest_release_date"], "%Y-%m-%dT%H:%M:%S%z")
-            end_date = end_date.date().isoformat()
-            lts = False
-            if "LTS until" in release["status"]:
-                lts = True
-            status = "done"
-            if release["series"] == "current":
-                status = "active"
-                if not first_active_rel_found:
-                    status += ", current_rel"
-                    first_active_rel_found = True
-                end_date = "6M"
-                if lts:
-                    end_date = "4y"
-            mmd.write(f"    {codename} {series_version}{" (LTS)" if lts else ""}"
-                      f" :{status}, {original_release_date}, {end_date}\n")
+    first_active_rel_found = False
+    for release in releases_from_json:
+        codename = release["release_codename"]
+        series_version = release["series_version"]
+        if release["status"] == "Active Development":
+            mmd.write(f"    {codename} {series_version} :done, after current_rel, 6M\n")
+            continue
+        if not release["original_release_date"]:
+            continue
+        original_release_date = datetime.datetime.strptime(release["original_release_date"], "%Y-%m-%dT%H:%M:%S%z")
+        if original_release_date < oldest_supported_release_date:
+            continue
+        original_release_date = original_release_date.date().isoformat()
+        end_date = datetime.datetime.strptime(release["latest_release_date"], "%Y-%m-%dT%H:%M:%S%z")
+        end_date = end_date.date().isoformat()
+        lts = False
+        if "LTS until" in release["status"]:
+            lts = True
+        status = "done"
+        if release["series"] == "current":
+            status = "active"
+            if not first_active_rel_found:
+                status += ", current_rel"
+                first_active_rel_found = True
+            end_date = "6M"
+            if lts:
+                end_date = "4y"
+        mmd.write(f"    {codename} {series_version}{" (LTS)" if lts else ""}"
+                  f" :{status}, {original_release_date}, {end_date}\n")
 
-    subprocess.check_call(["mmdc", "--input", mmdpath, "--output", args.output])
+    mmd.flush()
+
+    subprocess.check_call(["mmdc", "--input", mmd.name, "--output", args.output])

-- 
2.56.0


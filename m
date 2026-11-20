Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2020.1795162535908264211
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Nov 2026 00:15:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=LF42AcwE;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 38BC2C2BB30;
	Fri, 20 Nov 2026 08:15:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 97A716017D;
	Fri, 20 Nov 2026 08:15:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8550011BC120C;
	Fri, 20 Nov 2026 09:15:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795162532; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pprA5B0KEJeK2lLkOgPPz9SukFzCYGG1Shm83jcoRbE=;
	b=LF42AcwEzdT3zQKUpWeGewpvsOnGIYZJFEHTKb98I4y3hFac0ZwcSLLngFeM7P6IVTTx/e
	vMQfl7xiJaAgbAgs3dXZBvSMTJ9rBB3pzno0MlsjXQFMJwf9dEAkJri3cyvOmNY1bBX/wO
	aWLUlSnWnlOMGcgNamfGC6NDwVainRR5nJajkqamKGkkpU3ifO07RNbb6Q/VZtnCHb7xkK
	lpCyGt5lckihaQtsW6iE3oONVWjfJFXhB7FQ9RAFkcSzDsyGzqQWsCZrIU0IBnhBlHZcdS
	JtagudSdieDsZfvr/L28Dniahs9Zi3daMtF7GCrrlWWZk8+gVnad8TuXgYqAjA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 20 Nov 2026 09:14:56 +0100
Subject: [PATCH v2 4/4] tools/gen-releases-svg: simplify tempfile usage
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-gen-releases-svg-fixes-v2-4-abc66b9dd7da@bootlin.com>
References: <20261120-gen-releases-svg-fixes-v2-0-abc66b9dd7da@bootlin.com>
In-Reply-To: <20261120-gen-releases-svg-fixes-v2-0-abc66b9dd7da@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4406;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=5/iHTlEIygXMNNRAOsUXYSLqmwf0gSZagMtlpfB7omI=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBrAAGFUIgm/odN5d8XGclKYFVuJm9FYkPZ/AY8C
 Sz3+6Ob3aGJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCawABhQAKCRDRgEFAKaOo
 NkpbD/9RyV/Ff0oPmpSfo2ebNaAkJgPWEcFkOyz5V5Z1s9px68+FmcrXnMmgl5bGyb19GnKYKcn
 mddv790dcL5cFJiGzHojUvWhII3jrGtSjMZ/vx/fItYetCTBMHd/Y2ikBk1n5VwHk2bstc70th9
 3mE5p4fBNctTqQfQbOe2a5IOONb6aVy0mPbbWx9sU91bZhOpH+Zwe+vEYXco6nG4NPOoi9wgo+A
 ZiDT5Poi6n90PmSGvQNHMQBYxKNM22nn3HPGTWkM9MHJNMhGpXMBUsnii/z5e9eXFXl/e1pjV+h
 0qSwpVPxuyWyIlfTdg9UnQbiqjfwMusq0IhikCqTI1Ev5ZQd7Pn72+vBI5hyd6YFw9HSyPVefau
 /uamQCS0mhQ/SYmDH8TZq5ozS7s1CnRn6MQ3vq0eT/C/XgNe3/r/AF6KG0Zzkc5uc7tGs+lrSCT
 KHVOSVfFkCRhE3QRdAbAf9RIhl8gAERg1VWkGR/myxypE+ChcV4bqVXMM17BIalMw72WSSHUF8O
 u1iLTHJ61lUfLROxRZWt6z9+M9GEJ5FUwF9dgWm9Z2sM4jEZkhhi4Exbsqs1fiGqflolqLxoatU
 g8/meFe+OsGvDPZqUVAW6rlY0TNFdNjmxxiSyErto82RDLdwerZ5V2JDFp8e/SPhKfFY1vZW5iE
 8yN5dyeXvB/IdCg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Fri, 20 Nov 2026 08:15:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10811

We can directly use tempfile.NamedTemporaryFile() to open a temporary
file and use it for the diagram passed too mmdc. Make sure it's flushed
before mmdc reads it. This simplifies code complexity.

Suggested-by: Quentin Schulz <quentin.schulz@cherry.de>
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/tools/gen-releases-svg | 68 ++++++++++++++++++------------------
 1 file changed, 34 insertions(+), 34 deletions(-)

diff --git a/documentation/tools/gen-releases-svg b/documentation/tools/gen-releases-svg
index f8dc8e72d..e2370bf8f 100755
--- a/documentation/tools/gen-releases-svg
+++ b/documentation/tools/gen-releases-svg
@@ -67,39 +67,39 @@ for release in releases_from_json:
     oldest_supported_release_date = min(oldest_supported_release_date, datetime.datetime.strptime(
         release["original_release_date"], "%Y-%m-%dT%H:%M:%S%z"))
 
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


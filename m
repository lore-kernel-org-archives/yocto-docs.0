Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77907CC6B2D
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 08:13:57 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10992.1775117630134391623
 for <docs@lists.yoctoproject.org>;
 Thu, 02 Apr 2026 01:13:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=d3RPgONZ;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 76BF7C5997A
	for <docs@lists.yoctoproject.org>; Thu,  2 Apr 2026 08:14:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5B324603BD
	for <docs@lists.yoctoproject.org>; Thu,  2 Apr 2026 08:13:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B127910450221;
	Thu,  2 Apr 2026 10:13:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775117625; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=eibZJwC8XzK/tMMsbXpcxkCIzoczp+oUI9baWDQg7SM=;
	b=d3RPgONZ0I8YKFu3k02C8YVifasjTT5W3scP90KYdeeSUS70rQuNtwLlPWdZM6nOPNFExR
	HesUT4u+Udb94gVFE7tVFOcREFmYs65SGrC/S0UjFZorHdOe1e1hUhVjBCD7YDw+jFwURi
	oVO4KXHJmSJs/+sm7eXAR6p/5/kZFvvM9SIuMzdcXZseM3oxdrutxCCbH6pZFSsqPQGXtk
	TXFUBJ4abJRRtMomY6VXwx6JpdaLkHPDbImdX4XZv/uK4fMA1UtZ2qBmd7sZSuuaEsx3en
	DzNIEuHLCSMjTmM1zY0/b4mPe32Kc/6biL6eKc7njt4rpUROfRayCGhTXpk0oA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 02 Apr 2026 10:13:28 +0200
Subject: [PATCH 2/2] set_versions.py: fix get_latest_tag and milestone tags
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-set-versions-fixes-v1-2-0609a8747b96@bootlin.com>
References: <20260402-set-versions-fixes-v1-0-0609a8747b96@bootlin.com>
In-Reply-To: <20260402-set-versions-fixes-v1-0-0609a8747b96@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1630;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=/77qgaq82rBYZ4P+NlQ+cseoUGXJ9J2XO1wnZdwomaM=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpziU0D19ei0kbmsTRQUlW48bMHpLq7Pekj3HvE
 /sFFcxIh+2JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCac4lNAAKCRDRgEFAKaOo
 NgKTD/wNhoaU2vYIrVi6Iz4c5QyrmujQRKZ/3d7G4SvcjuaQp5uNCFwSfXv4bXZgdb0/Tf1eQ6A
 sgrqmJ+o9scw4E76jYgW6CARgvR1KqmEuE5VIA5OI+fDSp9Vy7wczQmfJei3/l6ebQKxkxyes2E
 riFPCj2I7gz2w108dDeGjM5p5pzO5feEjIYddbw8O3ByglctqRADfaNq8YTjQ+0pWwytibvOPIu
 3aSjtLOB8TIq3BK92rUzYRr8BBub7Azf9y0gffp3ET0WI9leNmJ11Zij44jgekEWQv9VtdiCNmT
 eEJojckQ+AXsHGhilkfvZGNo+z9UFPHiHLHlD7IpT2uh5DBf0zeIkibL8R9RYLhsV0TZX8T2i6O
 T55bezPo2xdgSWFCHDnQ9BvD24ef9oqwF6fzbsEVbkFqNquiyAMcRZH43Ndg3hJwzgn6KKZgnRz
 uo0a0iHiR3uT97iew1oBJF5YxWbwEVhdpE3pO44D3VK+VaFD6q1KEep5BArZHBWL7nFHw/p3WEB
 XZFqbDSaD50P2Uj2nz2IZDcnn5z9Q6oE19yVq7+UEJEXAD64HtPDpFm8TA8euvYjYFsrGwe5Yz9
 Nw7pV12yYqUqAEPe4FfIDEdmM+yQEIPweEVbKgG3O+woQATIlSgvrjJhGd5vwl+CiR663hm9KKl
 qJnuJftm4o8u9hQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 02 Apr 2026 08:13:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9159

Milestone tags have a different format, e.g. 6.0_M1. This was breaking
this algorithm with:

  File ".../yocto-docs/documentation/./set_versions.py", line 277, in get_latest_tag
    branch_versions = sorted(
        [v.replace("yocto-" + release_series[branch] + ".", "")
         .replace("yocto-" + release_series[branch], "0") for v in branch_versions],
        key=int)
ValueError: invalid literal for int() with base 10: '0_M1'

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/set_versions.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/documentation/set_versions.py b/documentation/set_versions.py
index 465204998..375f96d99 100755
--- a/documentation/set_versions.py
+++ b/documentation/set_versions.py
@@ -274,9 +274,13 @@ def get_latest_tag(branch: str) -> str:
     branch_versions = subprocess.run(["git", "tag", "--list", f'yocto-{release_series[branch]}*'],
                                      stdout=subprocess.PIPE, stderr=subprocess.PIPE,
                                      universal_newlines=True).stdout.split()
+    # Sort the branches as integers
+    # On milestone tags (e.g. 6.0_M2), remove everything after "_" (including
+    # "_")
     branch_versions = sorted(
         [v.replace("yocto-" + release_series[branch] + ".", "")
-         .replace("yocto-" + release_series[branch], "0") for v in branch_versions],
+         .replace("yocto-" + release_series[branch], "0")
+         .split("_")[0] for v in branch_versions],
         key=int)
     if not branch_versions:
         return ""

-- 
2.53.0



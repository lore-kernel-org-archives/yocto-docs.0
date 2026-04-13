Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC265EBFD10
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 07:35:59 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.266967.1776065758004309816
 for <docs@lists.yoctoproject.org>;
 Mon, 13 Apr 2026 00:35:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=cyBfpNY8;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id F0877C5AAB0
	for <docs@lists.yoctoproject.org>; Mon, 13 Apr 2026 07:36:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 811B05FFB9
	for <docs@lists.yoctoproject.org>; Mon, 13 Apr 2026 07:35:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C512E104501E6;
	Mon, 13 Apr 2026 09:35:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776065756; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kWp1HNZ4JSMUd+d1IGpdLi+CXjwcBHd6vY8/DkOzxkc=;
	b=cyBfpNY8r/YPufmikOFgajtLhyVsu4fu4gS71kBXlZ8hxIsiVT+XNa7FJZqHGu0pScpa0E
	8GzDq1sgJr4UhwvxIEte/Z9qy7Ql9YZrkpzPplD7ZAu4cdYFxh3x24SYJP6HliWqRx8mgH
	Cqpqopu1pO69tH+HV6kUU4srCOJtudcvp8aC/W4aICqKqdG/AtKvdOm9W4727pLvtsIKux
	sH7Ka3TGQBSoUt1G1drqsIeX+JgJzQGAW7s+RFk0fQm58dfxvMiaSPiU+dSApe1sSof01f
	+xFmV9aMCTzQsfBUP+4LlxVYinGfdSJQeqCimJqsdr/bgH/vGv9R0IdlRxPJuA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 13 Apr 2026 09:35:47 +0200
Subject: [PATCH 2/2] set_versions.py: make active releases unique
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-set-versions-no-current-release-v1-2-9c40207c8604@bootlin.com>
References: <20260413-set-versions-no-current-release-v1-0-9c40207c8604@bootlin.com>
In-Reply-To: <20260413-set-versions-no-current-release-v1-0-9c40207c8604@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1018;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=kk96WEN2FuT0nJC1a/8vyUYzWZoKA2T4rdLiGEaPXWY=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp3JzZEkzhFyYMPpdQMx+gfyuBuzjYb+aaaB0SQ
 3kLyclYvYiJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCadyc2QAKCRDRgEFAKaOo
 NhW5EACalc0M9+DSm6DBQDX38+VxUiBRqefsIGjwvll3YwMpVBGxva2sSORyQm63EBAa09t08jl
 xR4fZBzgQc4Ex/akWEWCgI8B64DLuHCCmJStlTcwswGYyPVKeCUFnHd1AjtLJsVE+mZ+eODhRPI
 JN9GaHOzROLcPto54h1tfnzN1TgwlNfj7UCZqkOE9BV4GZ8kQ9JjYyZyObdEJ83Mp0oGlRW2WkF
 X6+KahS/xNgtHIyVMGHlMNxl/N3BTG8/C3mXCzZBP6gVG/lydLgq56QL+LaMx0jeqc8vxF4M0rL
 F16pADHSR99j2k8iYoM8b5Vfzy9cy3c8EP1r246ZsHpvh7tF7OVHoD/assTtuKLOjjbEaldNaHF
 5CwMw7FPO9dPFR8oBzf/u4wDTmMMYwCPv4TbXzyP9O8G5M79nM9nMT7SEp4Fh9Js64qem4cERKu
 dAKc2Q1iZXrnUTmkjS8sBNcGelgf2vnhuX5tHEcmmlZ61OExUz7PSCxfx2Q27haVec6g3i0jz8g
 4v1prUmyCrS0BdEeBzrkmusTh9Akx5ph/UyIEvLDFBNoTukEF7kqrOFsM6yNH8NDBIyCOTxm/Jz
 JdR9aqMcoHljwD9oQHE7JbHGrc8jzLws8JWYecYMNHodJSueV3Oh3I13BjXpDf+ImGGub0WjBUw
 vA2Bt4jSkXzvxWA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 13 Apr 2026 07:35:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9250

In case the new current release is an LTS release, the previous code
would have this release twice in the list of active releases.
De-duplicate items in this list.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/set_versions.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/documentation/set_versions.py b/documentation/set_versions.py
index bd4b91082..c9a6012b9 100755
--- a/documentation/set_versions.py
+++ b/documentation/set_versions.py
@@ -86,7 +86,9 @@ if releases_from_json:
     if not current_branch:
         sys.exit("Unable to find a current release! Exiting...")
 
-    activereleases = [current_branch] + ltsseries
+    # make the list of releases unique, there can be duplication when the
+    # current releases is also an LTS
+    activereleases = list(dict.fromkeys([current_branch] + ltsseries))
 
 # used by run-docs-builds to get the default page
 if len(sys.argv) > 1 and sys.argv[1] == "getlatest":

-- 
2.53.0



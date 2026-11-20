Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2019.1795162534532079570
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Nov 2026 00:15:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=SbqwW2cM;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 87545C2F4E0
	for <docs@lists.yoctoproject.org>; Fri, 20 Nov 2026 08:15:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DB0AD6017D;
	Fri, 20 Nov 2026 08:15:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D710F11BC0FCE;
	Fri, 20 Nov 2026 09:15:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795162529; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=UO+b4z4pqYmjY+RTvbAkfDcDlVb8OIW+8LL3diqDCXM=;
	b=SbqwW2cMwgtsLT9FFgjYKTRtpBln5Zd0c+v+r3QXhNMLN+sU/88eBGQAvjXMc6sjGNvPL4
	xIbFZPQw+yAlkiWcQf6+DOzb0Uui+sIR+tRlvl8hALpTTTYRX15AW1HHrNvdGInKDo7Ke8
	CfI4Jo1kvX7ow0bpEthX+CtI6qPdGYsl+O5lSns9Ar+4OaOdTWan0DACbkhPCvvXjX8B72
	5tjDyzjwD0I7SqVaHxaczBOgC4byjYxiOtEVjhgeXWp/scesQtuxImVFpTEOdBZFYSsJNM
	bfnEu8eT2MvKdKnvwf6xgZcCc5McA+G/nrnIcMbwMd2Ij5Ek/c647YS+k8KxNQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 20 Nov 2026 09:14:53 +0100
Subject: [PATCH v2 1/4] tools/gen-releases-svg: use subprocess check_call
 instead of run
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-gen-releases-svg-fixes-v2-1-abc66b9dd7da@bootlin.com>
References: <20261120-gen-releases-svg-fixes-v2-0-abc66b9dd7da@bootlin.com>
In-Reply-To: <20261120-gen-releases-svg-fixes-v2-0-abc66b9dd7da@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1015;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=XmO7LFpguAwpFMRn8AJTDDOXmbAsH7G+8QIEVcE9Cpo=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBrAAGEkx2fr6omS9hpiVbiI0QgNJ2ncMWi+jesQ
 cUXIqzAVguJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCawABhAAKCRDRgEFAKaOo
 NidND/9Lu7PYX+a3Ui3ennBi/Cn/rBynHBBGKS18nrBPqlLhI56Gtkn4rFbbgIMmC4ZYYTB/AjF
 XYHf4o4VAIv2b9qwOuuqk223m2ms9qzwas+BgkjxxE4PlTGxJ5fmWx910fmxx7eWiK+9YxWUZi6
 hjrOxed/bVDdx6GyMZbll9anhx/Vgmxo1z01hC9q/vHqPckMGIU1T9AP9wN+Zs09SgqgQ3rrMyc
 SqmutKCdXxXXA59cBVJt2hQkCM+LkFyg4aiI8Xnb45BOTdEZQPcXK6YC7I7yPfFuim9kwgUE7fL
 O3Qx4aQ+Eo385bBFT5W6fGvoPB+Ku2h+CvFbWxekR/l76LrHlvXkSksvPLnVAuQdW2w8Qt0zBUF
 fiwuxPyueTkdSxSAxFNakukiPpfTBQ1gkUpL3rWwdQmSGyLbX4gdLOnGlephyOSxSMykvyZ2n/3
 4535pitp1eHj5NJaVcfW0/P16ibpjFCEbdF7xp0Kv2L/nxSyYNx55XRG3qjqnZXYgN9Wm3sHg2T
 fHWvV8mFNAYBEYoAMKJrIeBcwbJsrg4jy74afvH68tAbVGKW4LG+G2UIDk8rtZIguX73+6CxPt2
 6lcSSJvUhWS6+bEDuXTVXWjqu6YNlGd10hsR/iJ1Jb3bKr+WWCdq5h/cylkxq8L/6gp7NGuNJQ8
 GLrCi6J3oBPNjWA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Fri, 20 Nov 2026 08:15:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10810

We don't use the result of the command, so use check_call instead.

Suggested-by: Quentin Schulz <quentin.schulz@cherry.de>
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/tools/gen-releases-svg | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/documentation/tools/gen-releases-svg b/documentation/tools/gen-releases-svg
index e091c02de..6a601b010 100755
--- a/documentation/tools/gen-releases-svg
+++ b/documentation/tools/gen-releases-svg
@@ -89,7 +89,4 @@ with tempfile.TemporaryDirectory() as tmpdir:
             mmd.write(f"    {codename} {series_version}{" (LTS)" if lts else ""}"
                       f" :{status}, {original_release_date}, {end_date}\n")
 
-    result = subprocess.run(
-        ["mmdc", "--input", mmdpath, "--output", args.output],
-        check=True,
-    )
+    subprocess.check_call(["mmdc", "--input", mmdpath, "--output", args.output])

-- 
2.56.0


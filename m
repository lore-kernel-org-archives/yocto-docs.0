Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DD93CD6E55
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 19:45:39 +0000 (UTC)
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28908.1780515929612059014
 for <docs@lists.yoctoproject.org>;
 Wed, 03 Jun 2026 12:45:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=wfugXxdL;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=LPcEvq0d;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.144, mailfrom: paul@pbarker.dev)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id F02F5EC00AB;
	Wed,  3 Jun 2026 15:45:28 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Wed, 03 Jun 2026 15:45:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1780515928;
	 x=1780602328; bh=AXlvUPjGDMQQKsgjfutOE7satIB8Ne/eZfkiKr3+4qw=; b=
	wfugXxdLByZv/GtkmPPfwzYAOxltVWm6qcxxUVPYMYf/JlL3XZPXum6baZElHqah
	qAcix3xSyLbWITcqcJ0h4Pg+PdIX4SF0TCyV6P8MM3w5Dzb6gtsfuUmMB4ZXUVCp
	cS/5MHkCY9WTER/xb1DiISme7cOYQCqG0ger3/N4BrPqLHfNJkW+MMQtTegfF40d
	FLFDv28UOzbglLJH7Z90YJXPVk159m+lM9e4jj54I6HSV+4bwEtFaoMZpjmu4QeL
	19tDqgSNGibStCiRls69tBY7ONd5Vzq86zwTfI/l+5p2ASReoxwtRlLpyyBGdZT4
	Lm82iMY5qWxO2Ji2ytgvMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1780515928; x=
	1780602328; bh=AXlvUPjGDMQQKsgjfutOE7satIB8Ne/eZfkiKr3+4qw=; b=L
	PcEvq0d0liOMGNad0uau6ZR6oXHqx4CY5UVNSZfs4pR6COy1hw0nPlBf0RXc+Yfv
	FUkqennvUPz6NPjgYH5k2kCJbUVbqqKsYj5HUx4KwbYxe8qOhP1J+5hKKnourv1i
	GBxB5qYS51aHtXIH2sbxMdug68oqvweco5NEJZWzUgOvpw5JOQoUBrKKEJ0Fmpa2
	ZzeTIaX4aEZeTbAFr7QH26LsOI+pSVAEn7xYylQDw38tSAJI4C6TSrGlAtEv3xrd
	bt6tZnOZhf6XsKYDgoe6MSAsa0QRh3X6cgTM4baN8j8WnU03yExsNga4gyudgsXX
	TyvwUne1ks81JhmpjBP8w==
X-ME-Sender: <xms:WIQgatzX8KCVhwme9wK_r7xwJXso1gDh8oKtih-bb2Zf9r1syhdzjw>
    <xme:WIQgajQw34fiZOtL0t0oWMCNPTaGFwSb34tILjJBYxaf9FeLozxa7Umxv9ITAG1cf
    baHuoN35P8autzCYKtRRGMFJrXiPnOplwzfA_mJ1h8dGd2vwtmq1Rqz>
X-ME-Received: <xmr:WIQgak80jxsqQBXEKM1mNaPZDfDeAbPvYa6MtwjX6oEB12ICqoMAv7iDtgP2spMWaFwnBctPEQp-OZwa1tXdC1iC2fWhWaU>
X-ME-Proxy-Cause: dmFkZTGT5zQagand5kTQQdgWYB7uqAlq8PTw6t7CzdkLXj4ftbQFEUlhxaikIQ+eZivg6V
    TyPrO3c6KAMO5n9qmaQPFX6M3xWWWCPl3zfaX2SHRvUkf/zBZlGOKj70GuRQVWSFNE9JgO
    /wuh/7NWEaWnip3+XAxV+iXPpqTGHNnD5GX8NkHSjkMl6oM4w7kOuEFMovX2dWE2GemFtu
    w0qvkj2wvZ3JbVwoTdjdA2EwwfPEaD2PvCyz4Mkn6Ixf5noy+rO6mAinrSbPvCOEOcEkPv
    I8SkXDjhU+vTLVdeKJGokeWGmMtCNPmiVd247hkKKlLSrlEuk04dsWIzqVK3jgOOaEslFI
    nNRQRkrv0PuNcGBHNOkLm9LdPSKgJ9hmUCzEVQyYwlTTE6BfEitA1TZM1YIIayz7WkFW1G
    d5Mg00F9ut1Jv7hEUevVTNIK4qZ9AI70f42rufBK/S4G5ljYPdkZXNyswlqG/QaY48SAez
    0F0M1AXrZrD45nmXyzrjqneiDYsoY37uqogCKy2eYoTjH3keDX1S7AZCdlVXmybIFTMTU1
    YtxligNA9owqTf7brna2IahxI0WfLkdTALnhWkrvwaIQLiBRS/MofRYtAf//ADejR0aLOt
    NCquNBg9IOzIjweMKglDT8JtLUswdMmkV1+qZ4CzoGUMj+pXTdPU3lV3NQSg
X-ME-Proxy: <xmx:WIQgaqqIpke2_cSNXM1Fyu0O2mFE98WM5alvxAiNHbTrxptc6TnoRA>
    <xmx:WIQgahlqL3PLmQyp6Yl9PBp_mC68kn9l4K2qu3lQBy916M_3q3WT7w>
    <xmx:WIQgahKOJr_dMqO-SO-rDrFrhVLVdd0jUqQbqJHDRgthgiUyg-9Gsg>
    <xmx:WIQgamxcO3dT5tBi04SztoxduVW57HyTMlQ_h6Nhz8AHEgBD-nZBQQ>
    <xmx:WIQgauWyadMHj2VUCuxc_-kbh2wFX3LqWlgk2L-gNdTS7zK57vKLuoIi>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 Jun 2026 15:45:28 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Wed, 03 Jun 2026 20:45:18 +0100
Subject: [PATCH v2 2/3] security-team: Tidy and update section on security
 team operations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-sec-team-v2-2-ee7d2016fbf4@pbarker.dev>
References: <20260603-sec-team-v2-0-ee7d2016fbf4@pbarker.dev>
In-Reply-To: <20260603-sec-team-v2-0-ee7d2016fbf4@pbarker.dev>
To: docs@lists.yoctoproject.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3224; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=ELnvmyd2ve3xp4gzi5uROsHeOdzBTSh6zS1O/aO9Eyk=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWQptIRZp+W7SV2+lu/S/sxqr0TVpjWbT2acqy67FDvTV
 JnnftCajlIWBjEuBlkxRZbNPV/vP+115M0IuaUAM4eVCWQIAxenAEykVJnhnyVPjsP3w5Ffhd52
 rE0vSzTb/JVBtMq/fOty31M7HLTMFzP8d+kJkmtVXf3o1isp5z/rL9z7xXys7gzTj+CKuc0a4R2
 XuQE=
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 03 Jun 2026 19:45:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9572

The section "What Yocto Security Team does when it receives a security
vulnerability" duplicated information already found in the previous
section "Security Team Operations", so merge the sections and tidy up
the flow of the text.

While we're editing this, Mitre is now just one of the places you can go
to get a CVE assigned, many other CVE Numbering Authorities (CNAs) are
available. They also now have a web form for contact and requesting CVE
assignment so let's link directly to that.

Also drop "If an upstream project does not respond quickly" down a
heading level.

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 documentation/security-reference/security-team.rst | 26 +++++++---------------
 1 file changed, 8 insertions(+), 18 deletions(-)

diff --git a/documentation/security-reference/security-team.rst b/documentation/security-reference/security-team.rst
index 7ec1dda02e0c..c83ada17eb56 100644
--- a/documentation/security-reference/security-team.rst
+++ b/documentation/security-reference/security-team.rst
@@ -56,31 +56,21 @@ original reporter in the loop. There is also sometimes some coordination for
 handling patches, backporting patches etc, or just understanding the problem
 or what caused it.
 
-When the fix is publicly available, the YP security team member or the
-package maintainer sends patches against the YP code base, following usual
-procedures, including public code review.
-
-What Yocto Security Team does when it receives a security vulnerability
-=======================================================================
-
-The YP Security Team team performs a quick analysis and would usually report
-the flaw to the upstream project. Normally the upstream project analyzes the
-problem. If they deem it a real security problem in their software, they
-develop and release a fix following their own security policy. They may want
-to include the original reporter in the loop. There is also sometimes some
-coordination for handling patches, backporting patches etc, or just
-understanding the problem or what caused it.
-
 The security policy of the upstream project might include a notification to
 Linux distributions or other important downstream projects in advance to
 discuss coordinated disclosure. These mailing lists are normally non-public.
 
 When the upstream project releases a version with the fix, they are responsible
-for contacting `Mitre <https://www.cve.org/>`__ to get a CVE number assigned and
-the CVE record published.
+for contacting an appropriate CVE Numbering Authority (CNA), such as `Mitre
+<https://cveform.mitre.org/>`__, to get a CVE number assigned and the CVE
+record published.
+
+When the fix is publicly available, the YP security team member or the
+package maintainer sends patches against the YP code base, following usual
+procedures, including public code review.
 
 If an upstream project does not respond quickly
-===============================================
+-----------------------------------------------
 
 If an upstream project does not fix the problem in a reasonable time,
 the Yocto's Security Team will contact other interested parties (usually

-- 
2.43.0



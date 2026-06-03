Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59C6BCD6E57
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 19:45:39 +0000 (UTC)
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28909.1780515930392557866
 for <docs@lists.yoctoproject.org>;
 Wed, 03 Jun 2026 12:45:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=v01D3Ya4;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=CMmu+oJn;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.144, mailfrom: paul@pbarker.dev)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id BA16FEC0122;
	Wed,  3 Jun 2026 15:45:29 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Wed, 03 Jun 2026 15:45:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1780515929;
	 x=1780602329; bh=HetKxqdKPo984fuiK0xngMUsLZvrKRvMpZfdIV2mI4s=; b=
	v01D3Ya4jUoUtk/YViCB6a1R/VLxS7cMbvh5bPL+9mzcWrv6F7idqyqXPDePFLOq
	XmFjP4FITrQxAqsSbeecEkmV+52Y8VixGB9NGOiC8WcYbOrL5FU98e6jxuLGvkjb
	rWAWR/RW1MVWBaPeTW3AdxB2pxWQHAflhFfkiT4d+p++1K7sT2vklA9CPGfah7Dj
	kIDvZp/7UAiJLQtByDBzezNemMDvK3Mon/ZXGzFqQFslonxAdNMgoYRdr4uxyAEY
	XlMmj46KmAFK2SPXQn+ua81WVq1EKWUOXt7Scj9l7dsqavPsfsD/KJQOoR3VYOOl
	ZFbxUawjdK0nugQlh+CNWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1780515929; x=
	1780602329; bh=HetKxqdKPo984fuiK0xngMUsLZvrKRvMpZfdIV2mI4s=; b=C
	Mmu+oJnMvbUO5UHc12RXgEAmwhEMG/FWhmNDrRDhLLMG8fh0eMI/018+AY+TcXa5
	A/x1dB5N4DoXOOHJdOaB86ffpxJyybjqEujIZ9H2eF0qSVd8Ip88JAY/1RUtp8Lr
	QtTh95K18lX+OweR1ZKa+bF/8NKMdEYNsZZKO5vp+ZsBHujq8fqAvtLoT3eNGnGQ
	h+mMr3E1nYfOlNqQDvYNA1MuFq2gHvxCX2EsJ01FkolGMU5NaUflwVq7tyS4GncK
	IGuy/YQphRm8PixYq4sUv3/WdvAyt3XybpSPruL6UAtwL04Fukfer1pWr7S4x7Cz
	BvZsRwptRdmjSrflGnsuQ==
X-ME-Sender: <xms:WYQgapxKusyRRH2sFZJVcJWrTRT2dDSMgEHIP4rMzAgOpuAdyTgnHQ>
    <xme:WYQgagvk-0uRrpG3Q7cBXUmMONueFovvo0-KRokMf5VHow0j-qmEuGlNWmlb7Fi8N
    0_9i1k5BCp8_bwEt5uRYGP2X5TQhQs4GVyiXHlVVkHIrtoD11ZO_5o>
X-ME-Received: <xmr:WYQgagsDxKFlnQb38KzyizbT7v_GBjCY7lb0pWwaCHvLl4DZrqN4-BlrMQdaS8P63a7LHpR44Iw1DQ9_uQQk1sfILWRfYdM>
X-ME-Proxy-Cause: dmFkZTEIRgtuqh27/t6pN6GS+90VEnYn1KDAD8aaixByX9OK1LYnzxXURdleh05LmrSH+R
    B5xgSs1szi80HsoTYkm0iUhYOeLBY94LayaXP91qnCxwvLNN8Py8KVUylQZhvBQz4CVa/F
    1iGiaNVcPkgzqyK3AJXDiik5rTFUoX3gTj+flf8+b7MoabXeYPiV+h7TWWT7khEZqP2Syy
    avqwTU8HZ4w0JoXOAkCU8mENn0IyEHcF3Nvfvs5pE+JnSM7cc0U/J+yyeQjnIOiGeStxl8
    91eNzeCwrM3CLYJGmmKISprQbla30FdptJtYRLZvj5JVH8/ihRVELSG+QP81EeWvWw4sDJ
    pqwfzCybRbuxEs0AAXbNl1K37JbLl6zuYjqiiqRIGmJ3ODPKXgIiy7PxiTpI4taBB0b3i5
    s2LvbhQVeaboSJNGHtO22YGXMax2Wuu44wdHwHvi0g0Hqw51HUvzCcEbHaNCC9O9aSslyh
    BsPlxL8RUownXc//pXSI59jQXQWQFp+L3v+Ucw2EEvFNvf/9B4XCBzUQcwytEVsQO4MzYs
    q7169L/xZqcHzt9u64jMRopsnuIDTba+q2iaqM6EVSKKzKL0vzduDNXtZfTXqePq+2T/5r
    kgmM1xxOXWic6bPp7QzazZJ+DROqw7AhV46NbFCRCCX0ZLiVLeYnKRi7jPUw
X-ME-Proxy: <xmx:WYQgalOxHzzPzGiZxwx7ui43rX0HWofWJtbq8wG9-xXCA6TXedLqxw>
    <xmx:WYQgau2NtO8V2_uACnoWEiqyRqedanvHkTs7nhKjH7ek4cFy5e3oDw>
    <xmx:WYQgahPdcK7WYrwXM4TszS-RapDAkv7MmazkW61YRDwNUVK1Wz_sCQ>
    <xmx:WYQgau08BGLVQycV6zK_fo7rnGY1paB-kMQjIUSM06QKi2DL-IdxHw>
    <xmx:WYQgaiWok_BgWC-kqzW44E-YPAq_ydQcc-wHk-uxsLlox6n90nXgg3Hl>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 Jun 2026 15:45:29 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Wed, 03 Jun 2026 20:45:19 +0100
Subject: [PATCH v2 3/3] security-team: Add section on multi-project
 embargoes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-sec-team-v2-3-ee7d2016fbf4@pbarker.dev>
References: <20260603-sec-team-v2-0-ee7d2016fbf4@pbarker.dev>
In-Reply-To: <20260603-sec-team-v2-0-ee7d2016fbf4@pbarker.dev>
To: docs@lists.yoctoproject.org
Cc: Marta Rybczynska <marta.rybczynska@ygreky.com>, 
 Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2329; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=EVKVx48dL2ouWRJFqaO/OhFvX2umtqInqcvK153WjdU=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWQptITN+nhwpsr3fTFpqhdNNk6V/55/+NhmUfnfu05yN
 b+aL3b/TUcpC4MYF4OsmCLL5p6v95/2OvJmhNxSgJnDygQyhIGLUwAmcnclwz8ldoNOhyMb2Y/y
 aG4sfL5IacvLB9Of/Liqvlx10QLh89uCGBkO/WZdtmRhiYWa1WfJjZzbRNuPWa8tKbxtFH37i/u
 c7gvsAA==
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 03 Jun 2026 19:45:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9573

This text is migrated from the Security private reporting wiki page [1],
originally written by Marta.

[1]: https://wiki.yoctoproject.org/wiki/index.php?title=Security_private_reporting&type=revision&diff=86034&oldid=86033

Cc: Marta Rybczynska <marta.rybczynska@ygreky.com>
Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 documentation/security-reference/security-team.rst | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/documentation/security-reference/security-team.rst b/documentation/security-reference/security-team.rst
index c83ada17eb56..169d503e94af 100644
--- a/documentation/security-reference/security-team.rst
+++ b/documentation/security-reference/security-team.rst
@@ -80,6 +80,28 @@ vulnerability as quickly as possible.
 The Yocto Project Security team adheres to the 90 days disclosure policy
 by default. An increase of the embargo time is possible when necessary.
 
+Handling multi-project embargoes
+--------------------------------
+
+In rare cases, a severe security issue affects multiple projects. This might be
+numerous projects having a similar issue because of design, coding pattern, or
+reuse of the same code (an example of this situation is :cve_nist:`2023-44487`
+where multiple web servers share a design weakness). It might also be a
+high-profile issue in a commonly used library (like OpenSSL). In such cases,
+the project, learning first about the issue, might decide to notify other
+affected projects confidentially so that they come up with a synchronized fix.
+It might also be the affected project informing major distributions to roll out
+the update simultaneously.
+
+Such notifications happen over confidential, non-public means. Typically, the
+project initiating this "embargo" directly notifies a selected number of people
+from each project, including a subset of the security team. When Yocto Project
+is a part of such a notified group, developers prepare fixes on separate
+infrastructure and test it. They might also include additional developers and
+domain experts who can help with the fix and eventual regressions. When the
+embargo is lifted, they send a patch to the relevant public list, and the usual
+review process starts.
+
 Security Team Members
 =====================
 

-- 
2.43.0



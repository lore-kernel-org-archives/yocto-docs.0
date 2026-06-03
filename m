Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45857CD6E55
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 11:10:19 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17337.1780485011210090296
 for <docs@lists.yoctoproject.org>;
 Wed, 03 Jun 2026 04:10:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=q3cMyhoa;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ycYGAuWtaMk5NEZtFYXq8gow1mnS7D+X7iBIF6aAk/g=; b=q3cMyhoa0v1ydr/nO8jhwdytCd
	vwpipKGryEn+uYHwEtPVLNyHfS2YlF0r+fjFvLzfKkcpKrPk99w/Zh9dpCO8Wet7bmRCbGIBw8x0b
	Exu9QDfiNclnftHdJEzj4Hn4jWAWu2D/EtxW4B6IdnjpCQCIkR1ciXR325XZp5GeY1Qv4MwoCgQOV
	hoJF4VFtJIvw2SkezhP/jsrWdoJfZ6GUhmFD8k0Mvtl8jYlVcdUOLguBRpG+VVTTIocxq6btiwcrp
	anDuufcvRRB7HHw6uv/SZ+4Ec9IfebO3W6GCpLwwyfzImcezKlz1+X+cpNHXWVMjKRgQspIc6wNME
	SjR11nOg==;
Received: from [147.129.179.166] (port=53260 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wUjU8-00000008Ra4-1BUc
	for docs@lists.yoctoproject.org;
	Wed, 03 Jun 2026 07:10:09 -0400
Date: Wed, 3 Jun 2026 07:10:08 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] overview-manual: explain "ODM" and "OSV" acronyms
Message-ID: <77b7f6d7-4d08-601a-0940-09d9a7493156@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 03 Jun 2026 11:10:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9558


Beginners might not know what these acronyms stand for so explain
them.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/overview-manual/yp-intro.rst b/documentation/overview-manual/yp-intro.rst
index 9f8522b25..7d3ebb58c 100644
--- a/documentation/overview-manual/yp-intro.rst
+++ b/documentation/overview-manual/yp-intro.rst
@@ -42,7 +42,8 @@ Here are features and advantages of the Yocto Project:
    :yocto_home:`Yocto Project <>` home page.

 -  *Architecture Agnostic:* Yocto Project supports Intel, ARM, MIPS, AMD, PPC,
-   RISC-V and other architectures. Most ODMs, OSVs, and chip vendors create and
+   RISC-V and other architectures. Most Original Design Manufacturers (ODMs),
+   Operating System Vendors (OSVs), and chip vendors create and
    supply BSPs that support their hardware. If you have custom silicon, you can
    create a BSP that supports that architecture. See
    :doc:`/ref-manual/yocto-project-supported-features` for details on the level


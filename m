Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCAA1CEDDB5
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 15:25:01 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.19652.1728487497664691302
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Oct 2024 08:24:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=QF2rpIzT;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EC7BC240013;
	Wed,  9 Oct 2024 15:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728487496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tkmANKkqr8OhtbXIWTaQ92tUtPQ67AcIh8InLdpkZjI=;
	b=QF2rpIzTf4nUCGWeqfo8zbUygu7fTlSrjU5Fb3Lw8Eus2+vfeky3G4tJfVQeG+DU1+rjOl
	1kGP6Qg4Ohk35+Mwt4A+dGAwb9+NpoXw4rg8MbgctfDQW/X3Zs5klNYsI51vepYV9Uvoxa
	38njUs0BYjboj+EuQbgU1YtOTySCljDa6SdzqrNJBUTvdyfQsyTXWX2h0WQAa1rFJSXnmg
	2HkPARZbGPMLw3WCL7w5wg+vK6I7a6Y57pdZd9F4Ngu5gsrR2yuuRB70ik1a0DVwDwHiob
	+hEyyKqB38/9b0UKpzUUBxYsv7eUsbhteinGKokihwMHT9qlBHhsKzb9oUjQVQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 09 Oct 2024 17:24:18 +0200
Subject: [PATCH v2 10/16] ref-manual: drop TCLIBCAPPEND variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241009-release-note-5-1-v2-10-7d484f7e7b6f@bootlin.com>
References: <20241009-release-note-5-1-v2-0-7d484f7e7b6f@bootlin.com>
In-Reply-To: <20241009-release-note-5-1-v2-0-7d484f7e7b6f@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Ross Burton <ross.burton@arm.com>, 
 Paul Eggleton <paul.eggleton@microsoft.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1514;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=D0w5iV6uxl+M9zg0O2QB2AOBmQ14C3u7cMPb3F7aUNo=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnBqBEGBbsSz9eCsRkizlrc7R4aJSimDbmS9OAw
 fIZeBLhupGJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZwagRAAKCRDRgEFAKaOo
 NgxqD/oDBpiPR1bdr7ZjBRoVDmyaGo6hwTsvQjzHYhCtCE/Zjy50hvPXe+bSg/HODOWGPciNvou
 3S1J36sBc61Y4LUSDCmNWtZNgd4rF1Dl/9lw77eOjUJ3Pnu1slzLoWhVe2O6/wN98H3IKH1q8/n
 6SDWRHo3AnY+ZB2G22F8uV4nSWfsEQ1dKU0klz8dWRyAtTLEk2gKG5cb6oLdwwWCgT2PzW23Lbz
 t8BFn6ZljTOtP6iB48imNVCZw4DnW/c+sasSyC6TYvMkZC1skP3Wzk7UtOdb3pF7IzG9zV5N+0D
 tG9Ld4jEi2u3qsModGglqTikpEAPl/qg4v0mF6q4VLSWCXAxpNcOVl3LkRDeWCvdqNXDIcYj3nr
 EXo+275JsmqAJtxwEPTbHYNgPMxPVysAbqOz9ZtTOIGL5hu8cintepc5bD0cf6mI59Rlvj0MRhI
 hhrE533QXMBLEkKRqgELT7+BTjGbC7LUfxKE2eue1sRvmuRIgJ04IwcoUaOoiPwTRlLvkIALmC7
 49wL7hG6pjJTJm5FNpCzymPB6wNxqNnhmocjFkza4Hx0tU7kTAL5Dp22P3CZm+SxKGNaCl2iT+J
 x2w57jPaw3KCpiMOqFHyGRj8wBkQcev1PzpK+vyMM5uccOGFzDFBGYisvWX96yrXV50v1nimBo9
 S5QOvZ7za/HuCmA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Oct 2024 15:25:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5439

No longer required as TMPDIR can be shared for multiple lib providers
nowadays.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 5744eeb9e..8907572e6 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -9031,19 +9031,6 @@ system and gives an overview of their function and contents.
 
       You can select "glibc", "musl", "newlib", or "baremetal".
 
-   :term:`TCLIBCAPPEND`
-      Specifies a suffix to be appended onto the :term:`TMPDIR` value. The
-      suffix identifies the ``libc`` variant for building. When you are
-      building for multiple variants with the same :term:`Build Directory`,
-      this mechanism ensures that output for different ``libc`` variants is
-      kept separate to avoid potential conflicts.
-
-      In the ``defaultsetup.conf`` file, the default value of
-      :term:`TCLIBCAPPEND` is "-${TCLIBC}". However, distros such as poky,
-      which normally only support one ``libc`` variant, set
-      :term:`TCLIBCAPPEND` to "" in their distro configuration file resulting
-      in no suffix being applied.
-
    :term:`TCMODE`
       Specifies the toolchain selector. :term:`TCMODE` controls the
       characteristics of the generated packages and images by telling the

-- 
2.46.0



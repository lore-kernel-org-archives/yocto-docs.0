Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47143FEEF3C
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 13:13:39 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.80894.1775567611486056886
 for <docs@lists.yoctoproject.org>;
 Tue, 07 Apr 2026 06:13:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=ZIBDy+Yw;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7CAAE4E42935
	for <docs@lists.yoctoproject.org>; Tue,  7 Apr 2026 13:13:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 44D98603C7
	for <docs@lists.yoctoproject.org>; Tue,  7 Apr 2026 13:13:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8CA5A1045020C;
	Tue,  7 Apr 2026 15:13:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775567608; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=I1luSarcafuLsDzSFXvkfDNiyjL86+yTzDNyrWe9jDM=;
	b=ZIBDy+YwEvIqMjZKTj+5Fg+6UW2V0Nw6JiALJPd1TX5jvkm4e5xyQOFr77f1UyZwYcVk6n
	ynWx8Ua2wC6L2Pt6PXVXRUzB4ar+IB+OcnBHOwuPeJOKKHs3zN+84PVvdKNQYfIqoLKQ/Y
	Ydqfiwop3MwA9ZiO1SEIlA4lN57R0P4MIbHwZn7OJrzW6ZixdCmS7F05eakkCr/hNXkCzP
	D22zcM873ZyoZ9ZwjhpEbf11GcK76pztJwKDjNnvJDJKKfTOYNDg7cLrAcBL9f3JSD+tAp
	HgCUmMEmHlBzPE9iarBN+2kvgQYLx4201YOc5si+CKhOQHM9YbPT1EJRUNhLcw==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 0/8] Update the documentation for 6.0 (Wrynose)
Date: Tue,  7 Apr 2026 15:11:40 +0200
Message-ID: <177556742825.245356.12647647877218827007.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260302-release-notes-6-0-v1-0-9662dee58591@bootlin.com>
References: <20260302-release-notes-6-0-v1-0-9662dee58591@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 07 Apr 2026 13:13:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9186

Applied, thanks!

[1/8] conf.py: define new {oecore,bitbake,meta_yocto}_rev roles
      commit: 79552b4a764d16282a86c8e017270a258a26240e
[2/8] ref-manual/variables.rst: document qemuboot variables
      commit: 392ef512b05da8170d5e329c2750b2ada0a06cbd
[3/8] ref-manual/variables.rst: SPDX_PACKAGE_URL: add missing parenthesis
      commit: 0ecc893dca53c0dfb91591669d511d100026c3fd
[4/8] ref-manual/variables.rst: document the LTO variable
      commit: 6299419c7a326262bbf94ac482d04b485d1271a3
[5/8] ref-manual/variables.rst: document the SPDX_CONCLUDED_LICENSE varia=
ble
      commit: a907e04a50c0cfd430a7242d04dacf33e75a7270
[6/8] migration-guides: update 6.0 (Wrynose) release notes
      commit: 365945c5149ee95bec2b097f51e7e4b13312d0d6
[7/8] docs-wide: add warning on disabled NPM fetcher
      commit: ef0c14d9f203f406b33923be2f5bdc0eb5fbbe63
[8/8] ref-manual/faq.rst: remove the CVS proxy note
      commit: 198df015c768bda31bbf4552c96ac18d91467cd6


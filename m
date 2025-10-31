Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94A3ACCFA04
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 12:30:57 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web11.14257.1761913856063598158
 for <docs@lists.yoctoproject.org>;
 Fri, 31 Oct 2025 05:30:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=BMLMzjy8;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id AC0624E41439
	for <docs@lists.yoctoproject.org>; Fri, 31 Oct 2025 12:30:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8407160704;
	Fri, 31 Oct 2025 12:30:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 081FF118125BC;
	Fri, 31 Oct 2025 13:30:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761913853; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ct5yDAwvApNdNkDF82fyvL1TDSBrX+xyq1cqkPB7erM=;
	b=BMLMzjy85fH55wWHrGodGEys2z6qMweOo0LDTG9rxtic9XQAW25XuG6IvdfcwpR2/EJrEy
	CnFLb9xDTycfSIzArdk9c86BHujwiYA23Ib8HKQghuLi3O04VXmMDORxPnE7zrLzWryfOt
	X4EWHyzuSpMvgF4SRprrgABiNc6WoO6nOxfyQW0L77+1tzvvxn5lUot4/Vs4N+Yp1WBjeT
	0+X/EUdh09elFct2aQmrJ4NU+uBdey+OkxmLXSNr/RC3TL/uRfbSV0aBHCRRcLb4aMKSfd
	OMkAdUNb8I297yIT9fWa+6TCUp4kPAK0UcCwYnsp+5PFD/dBt0yJIFwoXiPU8Q==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	chee.yang.lee@intel.com
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] migration-guides: add release notes for 5.2.4
Date: Fri, 31 Oct 2025 13:30:09 +0100
Message-ID: <176191376981.156612.3556929546647446066.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251017060357.1957290-1-chee.yang.lee@intel.com>
References: <20251017060357.1957290-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 31 Oct 2025 12:30:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7944


On Fri, 17 Oct 2025 14:03:57 +0800, chee.yang.lee@intel.com wrote:
>=20


Applied, thanks!

[1/1] migration-guides: add release notes for 5.2.4
      commit: 7c9fd5339549b033812957d636752a674fef5cdc

Best regards,
--=20
Antonin Godard <antonin.godard@bootlin.com>


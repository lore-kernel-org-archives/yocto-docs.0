Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EAFACAC59D
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 14:14:23 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web11.24180.1758118454546506697
 for <docs@lists.yoctoproject.org>;
 Wed, 17 Sep 2025 07:14:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=ADAawR4S;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 42DB54E40CC9
	for <docs@lists.yoctoproject.org>; Wed, 17 Sep 2025 14:14:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 197A26063E;
	Wed, 17 Sep 2025 14:14:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3E392102F1BD0;
	Wed, 17 Sep 2025 16:14:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758118452; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5dRTff3tB/NV+7B2kLnhRrRXnvFxYAEkiY15nwcEkxo=;
	b=ADAawR4S9sEtyhLpUhMhDOHBdXOyYAH0qH36/tfI21mYc63EDuVpKZPkejep1bXrTVWMOG
	93Ss6FbVnqHIRHuOuPe1ehqviaeX43pD/LnUuqevF72tFEhGDED2IJY10mUrg3i5zA9GSX
	95Brx8oLHUKTdd9oPSVWsKGwrUcQlbPyvXshJpqhpxaMa8WBjfNbTziE2UwrPfWK/4MSfr
	FWknTgQMBpFytcXICuvLRJvew/etsISSEBynucv99Z4faPrKAPDPDBatlPoxzn81YpClBf
	ZUeYJLJFEWb7mfh+ag0FZ9TCHHbzBPKNYhUBFWW0dWfpGtQEGYP5qK5HNif2RQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Peter Marko <peter.marko@siemens.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] vulnerabilities: update nvdcve file name
Date: Wed, 17 Sep 2025 16:13:22 +0200
Message-ID: <175811826408.690097.14090204262704977629.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250824145316.1098911-1-peter.marko@siemens.com>
References: <20250824145316.1098911-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 17 Sep 2025 14:14:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7535


On Sun, 24 Aug 2025 16:53:16 +0200, Peter Marko wrote:
> The filename is outdated as its version was already bumped and there ar=
e
> also different files for different feed choices.
> Use glob to match any available file.
>=20
> Also the directory changed to CVE_CHECK2 meanwhile, so Update it, too.
>=20
>=20
> [...]

Applied, thanks!

[1/1] vulnerabilities: update nvdcve file name
      commit: a2f18cb23183401d9d8e2fd4499d164ef8d86e44

Best regards,
--=20
Antonin Godard <antonin.godard@bootlin.com>


Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 997EBCCD196
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 11:46:22 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web11.14098.1760528779528941044
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Oct 2025 04:46:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=o+SRvCwh;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 39A461A13D0
	for <docs@lists.yoctoproject.org>; Wed, 15 Oct 2025 11:46:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 11DA8606F9
	for <docs@lists.yoctoproject.org>; Wed, 15 Oct 2025 11:46:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5A55D102F22CE;
	Wed, 15 Oct 2025 13:46:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760528777; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=sZ78Fdm7NRowEYquB4vFyK4dSUKzVAEvvSw2VLV0Zwg=;
	b=o+SRvCwhOa+T4x0S5GJ6D5Ba3owAVhkD3cWl2IOjsgenTg1nigOM9Knp5p+0c8HqsUSsmY
	mPNhN1y2ad6WUo5ViEm9qaJ50VIjgPJ/rBNVMxUk1+yvb66vuAz2eUck0Q99hf4hK7eFM6
	fYwa+MjscX4DCHgn6raTfqXjGm9mML0V2ReEB7egqOUrSTB44PqKDwv9I8PD8U9aCLpw/K
	E2QzZQhcbpPFCK4u4CNi0xdXWq5gEBOxSHIUA4p40KiHsiWCLgIAxmYuMtZ4gfY58evOU8
	zgLlOJMEd2wIutjDzad0q82wvYz5i1hTZpwWZg24Q1hsBAxm9sP+68XbAzGkpg==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2] ref-manual/qa-checks.rst: fix references
Date: Wed, 15 Oct 2025 13:45:23 +0200
Message-ID: <176052868601.3167271.17701038676381452003.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251010-fix-qa-checks-doc-v2-1-bc282000721b@bootlin.com>
References: <20251010-fix-qa-checks-doc-v2-1-bc282000721b@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 15 Oct 2025 11:46:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7705


On Fri, 10 Oct 2025 09:31:57 +0200, Antonin Godard wrote:
> The references in this document do not work because references need to
> be associated to a title. Change the bullet list into a section
> separated document. This way we can cross-reference QA checks in other
> parts of the documentation (it was previously failing when attempted).
>=20
> The diff is a bit hard to digest, but there are no changes to content
> except for:
>=20
> [...]

Applied, thanks!

[1/1] ref-manual/qa-checks.rst: fix references
      commit: 93c30b8a430a981e8b89061c968a006a3e086353

Best regards,
--=20
Antonin Godard <antonin.godard@bootlin.com>


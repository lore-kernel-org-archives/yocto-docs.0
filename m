Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 381CED10F44
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 13:00:26 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12343.1764162020774730088
 for <docs@lists.yoctoproject.org>;
 Wed, 26 Nov 2025 05:00:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=BQ58LWsF;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2236D1A1C1A;
	Wed, 26 Nov 2025 13:00:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E786160721;
	Wed, 26 Nov 2025 13:00:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DB2CE102F08EA;
	Wed, 26 Nov 2025 14:00:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764162018; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=llCNVUw3WHUkO3npuudxjMD4CahpGbi/qzzVaSAeWqc=;
	b=BQ58LWsFevCWXbNHs9/vsxAm/79rp19vSQUdCibYG+IY9xEMfxBS5KNxwXr+n+Fy5/+od1
	SFgsI+BNW3Ryh25G0e/w/j6RiA91c1b1NrUFIRdo8e7ySaWs0HZZW8A5QdfzFGeopJNhc6
	skZ57I3iuWM9CrkvPmnBNX8QL4G7J32JD2UyluPTXkF2CQXNANvYkSqj/2ynElx2deLBb+
	H7AEMp4mWfoVIWyovh+BqunnbDvFB8KyUiAJZ1DwRnay35nRgTSMv2dC1Vp8vDjyt7RMc+
	cfQFxqX2CPpdlpFw7n20cGZVot6Kgc7UFTQ9+TJqMoO/2r1XlMgf0aAgje81/w==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] dev-manual/new-recipe.rst: replace 'bitbake -e' with 'bitbake-getvar'
Date: Wed, 26 Nov 2025 13:51:32 +0100
Message-ID: <176416145908.617433.16718866762483720429.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <fa6e98c8-8edb-d7c0-5407-b1f27ce83078@crashcourse.ca>
References: <fa6e98c8-8edb-d7c0-5407-b1f27ce83078@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Nov 2025 13:00:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8138


On Wed, 29 Oct 2025 06:32:09 -0400, Robert P. J. Day wrote:
> Replace the legacy call to 'bitbake -e' to get the value of a recipe's
> variable with the newer call to 'bitbake-getvar'.
>=20
>=20

Applied, thanks!

[1/1] dev-manual/new-recipe.rst: replace 'bitbake -e' with 'bitbake-getva=
r'
      commit: ed7c0766ef5f13b90943a69e64f8e8713d05e864

Best regards,
--=20



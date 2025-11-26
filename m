Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47F21D10F50
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 13:00:26 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12345.1764162022448407414
 for <docs@lists.yoctoproject.org>;
 Wed, 26 Nov 2025 05:00:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=Bn2wq0lY;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3C4B9C15D7A;
	Wed, 26 Nov 2025 12:59:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0321060721;
	Wed, 26 Nov 2025 13:00:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6DE50102F08EB;
	Wed, 26 Nov 2025 14:00:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764162020; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=P976GB7BEc/2nvWjQszHjD2BoGmjSRTUNG2VJ/Hebfg=;
	b=Bn2wq0lYMBcdW3Pt5dCp82wGl6G5+QWcxR1rB8XhT/SX+mHRbnmSBSO8rwTiRUI4Nrptaz
	FGDwQg/yppOaFz+eWnrzOhNWV0s2Ry3yOf+hqDFMkEwKoMpxc9a6BE3p71jDeoc8PKubWF
	BAaaAQ3m8GxWElutQ1VGo9hzD36iedtcspADjpxy3kXllBT00yBtWjA+QTcAf9PXw4ldfn
	eADL9NS1+dADOGuDOqR6W7MQr0DSKtebNSZTVkivE3TBMRSdx5/m+NoLtLZDu7w4OQIwa0
	ji6TkAy9BIU2x89TMdVYqI7uBUNs/z7b4JQK5H7Xo8yJP96+QvUOoGQ89TFCfQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] dev-manual/new-recipe.rst: update "recipetool -h" output
Date: Wed, 26 Nov 2025 13:51:35 +0100
Message-ID: <176416145900.617433.6846484408828505128.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <30f458a9-3d34-3c28-9e8e-5aad593f13fe@crashcourse.ca>
References: <30f458a9-3d34-3c28-9e8e-5aad593f13fe@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Nov 2025 13:00:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8141


On Tue, 28 Oct 2025 11:59:35 -0400, Robert P. J. Day wrote:
> Update the output of "recipetool -h" to include the missing "edit"
> subcommand.
>=20
>=20

Applied, thanks!

[1/1] dev-manual/new-recipe.rst: update "recipetool -h" output
      commit: 092d688349b0b6bb10ae6fbbab7d82801964daf5

Best regards,
--=20



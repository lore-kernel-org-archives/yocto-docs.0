Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 787DCCAC599
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 14:14:23 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web10.24149.1758118457279450446
 for <docs@lists.yoctoproject.org>;
 Wed, 17 Sep 2025 07:14:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=yjnHH5/z;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0C2C81A0E88
	for <docs@lists.yoctoproject.org>; Wed, 17 Sep 2025 14:14:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D83276063E;
	Wed, 17 Sep 2025 14:14:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E176F102F1A16;
	Wed, 17 Sep 2025 16:14:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758118455; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BHg+kW8or/2SEdmpri0HECA8noWIZYw1Z8L84fL4KEI=;
	b=yjnHH5/zgqVABKoXlgf8TWDsS8IcruggjqgO/zxU2xgupHTweHHDMRQel75654nupqbFl6
	engAnoBrgYYJQWDFY/H8uPnCn47+PbnbdskDQGBNHeDLYcscnCZh4+hCVfKOmOZxHEw5Dn
	a91O0M+zoQFHoxwMPS1Q6IeIFUIjdxlipBdR1PtM0T9aHAYjRVcb8neS5K3xHTDgkGknto
	cUfBIMymJy0vC+0jF8oMbU1F/JObvXhsbkSDtgm5Qj3JRkl2/WDacxvifI4Xmeq3JgstbE
	CQM5LpnVhM0P/sx+AWPB1cRrFJSNpY+R1qrRSjJqs94bU/7EeaeqgVrthN+ktA==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Gyorgy Sarvari <skandigraun@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] migration-5.3.rst: update removed recipes list
Date: Wed, 17 Sep 2025 16:13:24 +0200
Message-ID: <175811826410.690097.3597722091101906285.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250902061722.2226405-1-skandigraun@gmail.com>
References: <20250902061722.2226405-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 17 Sep 2025 14:14:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7537


On Tue, 02 Sep 2025 08:17:22 +0200, Gyorgy Sarvari wrote:
> Add a note about the removed xf86-input-mouse and xf86-input-vmmouse re=
cipes.
>=20
>=20

Applied, thanks!

[1/1] migration-5.3.rst: update removed recipes list
      commit: ee0b46bd074dd34c3d6b401e65d2c519c2c3d47b

Best regards,
--=20
Antonin Godard <antonin.godard@bootlin.com>


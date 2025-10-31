Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8D5FCCFA04
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 12:31:07 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web11.14262.1761913860664100219
 for <docs@lists.yoctoproject.org>;
 Fri, 31 Oct 2025 05:31:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=1aFLLvqK;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5615F4E41438
	for <docs@lists.yoctoproject.org>; Fri, 31 Oct 2025 12:30:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2CF7E60704;
	Fri, 31 Oct 2025 12:30:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3F2C6118125BC;
	Fri, 31 Oct 2025 13:30:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761913858; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qhxbAje5oZszRTq0YvuCARn730mJ3Fb7rHU3sPfUPRI=;
	b=1aFLLvqKw37rjJvhk2/4fxeNBgPSqfwnHxLhYwmSqHagCQ1burccOmcyrke83cYUtIeoqJ
	0xxW7zpAoOUq2Xnu5SMqhRZVhHxUpUaaI/0HH1zL1KCpjaTpM19MLKgKcQdI4bXle7LzOS
	dixEmMifJvVjGsu/sFV/8Sko25PeG7+SG66wkgvb5pdTke4p7hiH+L/QMew0QrolztaLvh
	y1CYirk2UP3W9By+5qwovFqi7cXqlztc2QawtI9yCur2Tfqsr/XHg+Sm0UqdzVXoEqDKG6
	RVxwfimtwq8z95M+BExz3gN88XvgGjm5b6E6LAmAo4c9FcaVI8AIHvC0XWM0eA==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH v3] overview-manual/yp-intro.rst: update on-target packaging info
Date: Fri, 31 Oct 2025 13:30:14 +0100
Message-ID: <176191377010.156612.2003326984658323173.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <acbe686e-f104-d46c-585b-418188efe6e8@crashcourse.ca>
References: <acbe686e-f104-d46c-585b-418188efe6e8@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 31 Oct 2025 12:31:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7949


On Fri, 24 Oct 2025 12:13:58 -0400, Robert P. J. Day wrote:
>   - drop references to obsolete tar packaging format
>   - add references to apt and dpkg utilities for .deb packaging
>   - add reference to alternative "dnf" .rpm packaging
>=20
>=20

Applied, thanks!

[1/1] overview-manual/yp-intro.rst: update on-target packaging info
      commit: c0737f253a89cc1f5fa23f24710705929bd75b79

Best regards,
--=20
Antonin Godard <antonin.godard@bootlin.com>


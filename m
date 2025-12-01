Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91F4DD116FA
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 08:36:38 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16998.1764578188946733235
 for <docs@lists.yoctoproject.org>;
 Mon, 01 Dec 2025 00:36:29 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=YgihqkvO;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1B0EB4E419B7;
	Mon,  1 Dec 2025 08:36:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E4ED4606BB;
	Mon,  1 Dec 2025 08:36:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 23B01119121E3;
	Mon,  1 Dec 2025 09:36:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764578186; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4zambDUfPVCg+0uRyJy8EyOqmYqO4OG+UigGPty2bZs=;
	b=YgihqkvOgm83MVi1N0t9o74AOGdzJN8ACAu/U50jveiX9eD4jcmh2Oey72M78N5Or8m51E
	AI7D5+SH/IlC+XjuYkEWQ89pxg6/fg0ei8WHdn5hihUFhQAhWC/yPchpMq5ubc0kjbFBu7
	/5hNwF/zYDyRM/AyzpCv2UKRqeg9D/Cn2/MHdG+ibMfsEHrRmJLHvlK08l2CNcPMqzNByC
	TS9aEO5qyDGnjha4mmaG1AQ59LbQIvWpCAwmNB2+9wP2HlIiER7jWz/nbx8UjfjdS3hO4q
	23QfUw0x3v9BYO6oES4+9R8ce71pFSJiJMFfxorDMOW8DNXfV5zDoxgsxVHKOg==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Ross Burton <Ross.Burton@arm.com>
Subject: Re: [PATCH] ref-manual/faq.rst: add Q&A on third-party vuln scanning tools
Date: Mon,  1 Dec 2025 09:35:51 +0100
Message-ID: <176457799706.63554.12167810400828513374.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251113-faq-spdx-v1-1-f5a2f54730c0@bootlin.com>
References: <20251113-faq-spdx-v1-1-f5a2f54730c0@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 01 Dec 2025 08:36:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8176


On Thu, 13 Nov 2025 12:03:36 +0100, Antonin Godard wrote:
> Add the "How do I integrate a third-party vulnerability scanning tool?"
> Q&A to the FAQ document.
>=20
>=20

Applied, thanks!

[1/1] ref-manual/faq.rst: add Q&A on third-party vuln scanning tools
      commit: c825c425aa97e797a4b9beb44c01a9d53b9fe853

Best regards,
--=20
Antonin Godard


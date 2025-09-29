Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17A9FCAC5B5
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 06:45:33 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web11.47618.1759128331376064601
 for <docs@lists.yoctoproject.org>;
 Sun, 28 Sep 2025 23:45:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=loke7X51;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 81F921A101F
	for <docs@lists.yoctoproject.org>; Mon, 29 Sep 2025 06:45:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5780B606AE
	for <docs@lists.yoctoproject.org>; Mon, 29 Sep 2025 06:45:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AF077102F183C;
	Mon, 29 Sep 2025 08:45:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759128329; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Tc5tNkdAn+fDqNQ00ElB5he9+KXeSZktZa3nID6kOss=;
	b=loke7X51a0iNAxufmWtgkyL3mArRUZIHWIhZvfaXstPi1u2aaN508wi90FbV9m61G8OQFB
	u149zaT5mQNlxit8TwsQ5g0StkvA73XvgXtROvI+K5+qzRtO/uDfFrZIX+fxCVSQQiNnQu
	umo4BffKPdUluOtlF5/GRzeld/K7rEq3F8XJEFX29lHr3nco3sf9HAV0Dajt7CTJEmcIC4
	EH+cJpB9q/R35dT6KafZQkMhjnsoDrpv2tU0Ea8b76tl7NSKoCawYibFwoU+8I4G9aaWXn
	pSnQmlmHmc2OTKn8YtvL3wrC7p89YfbinEhq/IgDnbq/qzX4EBeI6cAIc8kptw==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] ref-manual/structure.rst: extend PERSISTENT_DIR description
Date: Mon, 29 Sep 2025 08:44:25 +0200
Message-ID: <175912824407.5757.12006213984437663895.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250915-improve-persistent-dir-v1-1-ba42b490453e@bootlin.com>
References: <20250915-improve-persistent-dir-v1-1-ba42b490453e@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Sep 2025 06:45:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7619


On Mon, 15 Sep 2025 14:26:50 +0200, Antonin Godard wrote:
> Extend the description of PERSISTENT_DIR to mention that it should not
> be shared between builds. Add a note on sharing the hash equivalence
> database by setting up a server and not sharing the file in this
> directory.
>=20
> [YOCTO #15727]
>=20
> [...]

Applied, thanks!

[1/1] ref-manual/structure.rst: extend PERSISTENT_DIR description
      commit: 0ff0233770b77f9e74f4241dfb555dac2741d8b9

Best regards,
--=20
Antonin Godard <antonin.godard@bootlin.com>


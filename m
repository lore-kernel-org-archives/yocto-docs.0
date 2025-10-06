Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11BC7CAC5B8
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 08:08:17 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web11.28639.1759738095574116600
 for <docs@lists.yoctoproject.org>;
 Mon, 06 Oct 2025 01:08:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=ovNSphmj;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 409394E40EFF;
	Mon,  6 Oct 2025 08:08:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 17055606B7;
	Mon,  6 Oct 2025 08:08:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 42807102F1D59;
	Mon,  6 Oct 2025 10:08:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759738089; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=80CH8huQQe0FgCqkEKEJRmLN6kjOswCA2y0SnDAh7bY=;
	b=ovNSphmjdbd9uEDxxGtDldQxIWPsk/1NhAHt06KXNr91MsaTkY2RrkMHLDo1NUP7Ep9bfw
	gMmbhWXS6de1g4+I9QEb3aCUhxIDzJQXCyofpkxssqq1LeRQu68JxssYbO/XibA8KeQ5Yt
	d9XlCEsjOAx3ICXmw5LE3GNwFFWtnZMUdBjG1HDe0Ms0NTQpXtIn2GdkNM8ekraouF6h47
	F6nnf5OekqPDCW1YivITuy5sHTgyNgM+ipBodynjtt1hQvX8zmNgUIGBL1wPuteVLD4Mbs
	Pl5VCEEh8WB9DXKqvzHJ34ICh/SbUdmiHpFemv7P31oFwJh97i45BnmVKegkTw==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Tim Orling <tim.orling@konsulko.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: Re: [PATCH v2 0/2] Add documentation on fragments
Date: Mon,  6 Oct 2025 10:07:21 +0200
Message-ID: <175973778850.1174293.6940032961467030985.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250926-fragments-v2-0-3f096c33efa0@bootlin.com>
References: <20250926-fragments-v2-0-3f096c33efa0@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 06 Oct 2025 08:08:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7651


On Fri, 26 Sep 2025 15:06:21 +0200, Antonin Godard wrote:
> First patch introduces doc for auto.conf, and the second one adds docs
> on fragments.
>=20
>=20

Applied, thanks!

[1/2] ref-manual/structure: document the auto.conf file
      commit: 134e54a75e0144c4629f702c6f43e92ed1f12dce
[2/2] Add documentation on fragments
      commit: 0820b71c830cab4151b0219b6d4013c41f461c6e

Best regards,
--=20
Antonin Godard <antonin.godard@bootlin.com>


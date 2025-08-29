Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6665CA0FF9
	for <webhook@archiver.kernel.org>; Fri, 29 Aug 2025 07:41:39 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web10.8270.1756453289593448596
 for <docs@lists.yoctoproject.org>;
 Fri, 29 Aug 2025 00:41:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=b+2JZ7kS;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 65F61C8F467
	for <docs@lists.yoctoproject.org>; Fri, 29 Aug 2025 07:41:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DDD3B606C3
	for <docs@lists.yoctoproject.org>; Fri, 29 Aug 2025 07:41:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 19CD51C22D77F;
	Fri, 29 Aug 2025 09:41:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756453287; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=81cvUebqt9lwqz2kVMczK/k6gO/iEVTzieEor6YO8qA=;
	b=b+2JZ7kSD6sCuzXGvlGy6kBL/Cc1WihkvokMfBs8CP5MW/qCvAz8OANxdeWOk/GiI0kdU8
	xF+YWIPLrYz+TkaxSfixdU2p8rap30B9KvCJ6ez+eAN3q8mvz2QTcls8TPQgFwpVf8dAAU
	DnCnr0Hm8XtgC3t2coRb53GRwAje7b//P7eoo5RaVta8nGogsWWmZjzRLBmXMbKsFg3N/6
	NLbr4Ay//8iBNYeqWLUdcVMoqm6BmvaAHBzl6mk1MODxkUQQCPOZe2+41zqFFd+jMeIed9
	cVeShpPPwfIOOEpoMxphKjFtSHsnphgDIfqyR3Xup1ap+tFOoe8G5TgHELeekw==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] poky.yaml.in: increase required disk space to 140G
Date: Fri, 29 Aug 2025 09:41:03 +0200
Message-ID: <175645283484.82658.15102558079325317032.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250715-update-disk-usage-v1-1-ee95dddc838b@bootlin.com>
References: <20250715-update-disk-usage-v1-1-ee95dddc838b@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 29 Aug 2025 07:41:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7469


On Tue, 15 Jul 2025 10:51:15 +0200, Antonin Godard wrote:
> Increase the minimum size requirement to 140G, after running a build
> with distro Poky. The size after rm_work has increase of only 1G, so
> leave the current value for MIN_DISK_SPACE_RM_WORK.
>=20
> Also, update the comment to mention that this is for distro Poky. It wa=
s
> mentioned in commit message 285ba689ce3a ("manuals: update disk space
> requirements"), but not in the comment here.
>=20
> [...]

Applied, thanks!

[1/1] poky.yaml.in: increase required disk space to 140G
      commit: dbc6137cd13f982a7fd4d1b2df79dccb177db0fc

Best regards,
--=20
Antonin Godard <antonin.godard@bootlin.com>


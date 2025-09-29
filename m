Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E59F9CAC5B0
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 06:45:42 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web11.47621.1759128335975243826
 for <docs@lists.yoctoproject.org>;
 Sun, 28 Sep 2025 23:45:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=2iZYn2pI;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id AAF274E40D06;
	Mon, 29 Sep 2025 06:45:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 832FE606AE;
	Mon, 29 Sep 2025 06:45:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8A03D102F183D;
	Mon, 29 Sep 2025 08:45:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759128333; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Rc51ijXqeA42ln+etPBQOMpmzkIqcTuItRlm6R6uL4I=;
	b=2iZYn2pI6kKY0VFsXLl3VYtW7ej+ueJ6v3DMhrzDaGKTQJ/06LgEccmG/CVNeT4J1kPrlI
	vIJLZgatFswONwfjDM9pmtzNiPEJO5twfklYjGMJjhzAdFfcPNS7kBhcGeB1Xs8PoDhbia
	FZ0hzwG5Ym5kcYLICv9rYjiMsVN4sbhf0LeNJYeNbIU5BOfVq63FssjkushIiI255pdiRR
	VMgBGR6P5Q4JLt8/MzYNdnjP2C9bQFD7QSgOlEMwiPHi4JJRZqUh6ei7e2cDGN1G6UZT2J
	Ns5y/uypbtZ6XA+S7F0em7mvbwTWPXPSwYeS57ZhMCGmaEtXJ9kZfmBrZEmyRw==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Quentin Schulz <foss+yocto@0leil.net>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>,
	Barne Carstensen <barne.carstensen@danfoss.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>
Subject: Re: [PATCH 0/7] contributor-guide: submit-changes: improve instructions on commit content
Date: Mon, 29 Sep 2025 08:44:29 +0200
Message-ID: <175912824410.5757.15792154786015729719.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250918-submit-patches-v1-0-28abd2919df0@cherry.de>
References: <20250918-submit-patches-v1-0-28abd2919df0@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Sep 2025 06:45:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7623


On Thu, 18 Sep 2025 12:24:38 +0200, Quentin Schulz wrote:
> This hopefully improves instructions on how to write a proper commit fo=
r
> submitting to the Yocto Project/OpenEmbedded various projects.
>=20
> This was prompted by some new contributor following the instructions an=
d
> coming up with something different than what we had in mind.
>=20
> Then I got carried away and fixed/improved a few other things in this
> document.
>=20
> [...]

Applied, thanks!

[1/7] contributor-guide: submit-changes: fix improper bold string
      commit: 6c499b3796a578a0fe4c319c9547b4321b0d41df
[2/7] contributor-guide: submit-changes: clarify example with Yocto bug I=
D
      commit: a5862406bf3230befe9db9f2539bbbc86c02015d
[3/7] contributor-guide: submit-changes: align CC tag description
      commit: f116e93fb335e9d0f85891c4cb501bcf55b18ccf
[4/7] contributor-guide: submit-changes: make the Cc tag follow kernel gu=
idelines
      commit: f800fef4e9e2c1d3584ac49be8324638d2923b17
[5/7] contributor-guide: submit-changes: reword commit message instructio=
ns
      commit: b84903a760350bd118c56ea9ce4e98039edf6e55
[6/7] contributor-guide: submit-changes: number instruction list in commi=
t your changes
      commit: c628a489f081925fabaabb5acac6752251150269
[7/7] contributor-guide: submit-changes: make "Crediting contributors" pa=
rt of "Commit your changes"
      commit: eff4d14e28d323ebfdaeb0c5c805b5f1e2ad153d

Best regards,
--=20
Antonin Godard <antonin.godard@bootlin.com>


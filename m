Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8DC2C8303F
	for <webhook@archiver.kernel.org>; Fri, 29 Aug 2025 07:41:29 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web10.8267.1756453287351499921
 for <docs@lists.yoctoproject.org>;
 Fri, 29 Aug 2025 00:41:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=YSkfHouw;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 179D61A0E43
	for <docs@lists.yoctoproject.org>; Fri, 29 Aug 2025 07:41:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E5B58606B9
	for <docs@lists.yoctoproject.org>; Fri, 29 Aug 2025 07:41:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D61321C22D47B;
	Fri, 29 Aug 2025 09:41:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756453285; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ELWi0b7ARl/TE3Bfg+v9F30Pf3iZ3jhvqcw13LSDIDo=;
	b=YSkfHouwqeF0+PbUi/ROsJPbE/MOGp2J5pD5ZiVzNo2RLIZ3g0m4RSVIqzJZ8fg776HrRf
	RZ69CS1PRi8JVL2Jx44xjnLO0SthEJNMiHTayB4H9XEUtZf6smLQa/T5Lvti7jWgc3Lbp3
	JCPfW/gtfaa0KYJ6K5H+WkcQwww5UEaGTwu3Dr6TUbYchm2Q1c5ag6Fqvs9aR6ULNgx0OM
	mV05DIjM1bTTx38mmvPCO2MnctqfrasQoPkdMOoM8fcp75XjfJTGhiynRGlbXkg4eOl/i0
	UWT/WNI0EIauK+Ocadb/nHMsEHZbamQZ/2r3fTWqFmE3J4bbMcZuyJeIFDi1rw==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] dev-manual: add a hash equivalence server setup document
Date: Fri, 29 Aug 2025 09:41:02 +0200
Message-ID: <175645283484.82658.14451086484510833701.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250731-hashserver-v1-1-90c541b643c5@bootlin.com>
References: <20250731-hashserver-v1-1-90c541b643c5@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 29 Aug 2025 07:41:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7468


On Thu, 31 Jul 2025 15:03:56 +0200, Antonin Godard wrote:
> Add a small document to describe how to start a Hash Equivalence server
> with bitbake-hashserv, the reference server provided by BitBake.
>=20
> Update reference to hash equivalence in other places in the
> documentation to mention this document.
>=20
> Move the note from the concepts document to the new document, as a
> warning note.
>=20
> [...]

Applied, thanks!

[1/1] dev-manual: add a hash equivalence server setup document
      commit: 4ff998336efdc507de1311e43bf8f4a6258c610a

Best regards,
--=20
Antonin Godard <antonin.godard@bootlin.com>


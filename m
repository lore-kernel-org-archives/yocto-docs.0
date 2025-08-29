Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF32DCA0FFD
	for <webhook@archiver.kernel.org>; Fri, 29 Aug 2025 07:41:29 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web10.8266.1756453286174016682
 for <docs@lists.yoctoproject.org>;
 Fri, 29 Aug 2025 00:41:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=S4q6Nq1R;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E316D1A0E45
	for <docs@lists.yoctoproject.org>; Fri, 29 Aug 2025 07:41:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BC86D606B9
	for <docs@lists.yoctoproject.org>; Fri, 29 Aug 2025 07:41:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B97AF1C228095;
	Fri, 29 Aug 2025 09:41:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756453284; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=AAdBJsRmZ0W6Yj6+NzsFuQ0PpQOw8BUGRvdWth5oiP4=;
	b=S4q6Nq1Rigo0ByFCddykLXnMT7aRV9W9r2IQzKtkaEe0bRwAn9/QX4Xfx61MYtqoM1Z6Tc
	z/UO/hxor//NNeKh4z45LVoGhdCqpepTum3cAVIX3RX7op5h8m/bBuKxcb3nSqtaZ4sDCX
	Y2mMW6dCBtPxDB4SUafmHVy+GN0r2bcMPPerEnQjNQDBGHZFKZiCJ0Lhmmy01fxBhJ3ICt
	2EHH+U8LtXQidrY15qam6XEANbk35xTsx+yl+6rXkUMiX3nZ1ZYxny8HZaY/JYGbzYDT1z
	BIsLhPEOCU8rLS+bC+CdipS5MbZt6ELe7JnfznyoCT1sUxa05LMAAhs3y2igGQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 0/5] Add checks for glossaries correctness
Date: Fri, 29 Aug 2025 09:41:01 +0200
Message-ID: <175645283484.82658.6606841546146011125.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250729-variables-checks-v1-0-5ad6ca9b9386@bootlin.com>
References: <20250729-variables-checks-v1-0-5ad6ca9b9386@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 29 Aug 2025 07:41:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7467


On Tue, 29 Jul 2025 13:30:01 +0200, Antonin Godard wrote:
> Instead of having to manually check if the glossary is up-to-date, add =
a
> checks rule to the Makefile that performs basic checks on
> documentation/ref-manual/variables.rst and
> documentation/ref-manual/terms.rst. The
> documentation/scripts/check-glossaries script checks that the glossary
> is up-to-date (there's only one in variables.rst), and that the list of
> terms/variables are properly sorted.
>=20
> [...]

Applied, thanks!

[1/5] Add a script to validate documentation glossaries
      commit: 416d50c0c322eb88bf13353a198db7211e4d665a
[2/5] Makefile: add a checks rule
      commit: 1d9a4a52fa9f2e2eb7f282324f85a46b28128fbf
[3/5] ref-manual/variables.rst: fix the glossary
      commit: 4d3952414d109f9c9ebb029f3e20018664eacc86
[4/5] ref-manual/variables.rst: sort variables
      commit: 5cc4f262844a202553112a01f7203c9220d30fae
[5/5] ref-manual/terms.rst: sort entries
      commit: e3c05f82596239c12dcb9871e6dac434c46bacec

Best regards,
--=20
Antonin Godard <antonin.godard@bootlin.com>


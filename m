Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CA0DEA8110
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 13:07:14 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19003.1770728825856417812
 for <docs@lists.yoctoproject.org>;
 Tue, 10 Feb 2026 05:07:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=xkjcf7UB;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B0175C8F448;
	Tue, 10 Feb 2026 13:07:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6214B606BD;
	Tue, 10 Feb 2026 13:07:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9F903119D0A7B;
	Tue, 10 Feb 2026 14:07:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770728824; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=UqWxyrhvgTKEsTBmnZ6NbInUsJhO5aCmCoaKqVt+dxM=;
	b=xkjcf7UB+AJaq9iQO9BinqgWWPJ/ziSNCY8Hp/n1Q7tjLGst7mwe8GAV4kGXEgNIdkodfd
	eyTu7cKf+PrWdN0FRMZ7BeCmjkl5QTjYm2Sy0UmOyPK3ope/nRI2ZUPIvSQ2llNqWj4Kfg
	QdhbJSlbFIFyb9s70kZ8Dry3YLCCZUViSGgQByhUHNRUIptkN5Gj1lMuQMPfhLOlU6Fvpb
	wQRhfUmI16wdkBVaTBk0NnFo83ckbyeNICrKRXQFHYfzxPjAx51ILz2T/8zdH6/ZjlcX/0
	ogSTLj1nAFHgn6c9SsLpvqdNsE7DMSVXVdBDzXVAhvPlNIjPwxqhOaYYnQYh2w==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Quentin Schulz <foss+yocto@0leil.net>
Cc: Antonin Godard <antonin.godard@bootlin.com>,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH v2 00/12] sdk-manual: fix code-blocks, migrate one PNG to SVG, remove unused PNG
Date: Tue, 10 Feb 2026 14:06:55 +0100
Message-ID: <177072734078.453512.10681740036028174648.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260121-code-block-misc-20260114-v2-0-fdd4bb5c2e68@cherry.de>
References: <20260121-code-block-misc-20260114-v2-0-fdd4bb5c2e68@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 10 Feb 2026 13:07:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8879

Applied, thanks!

[01/12] sdk-manual: fix incorrect highlight language for text code-blocks
        commit: 72354c27000aba3ae583894ff6112a1a017e33d5
[02/12] sdk-manual: fix incorrect highlight language for console code-blo=
cks
        commit: c6039ce11d638a0b64844480e51d126fcda304b4
[03/12] sdk-manual: fix improper indent of general form of tarball instal=
ler scripts
        commit: 04c883216158edafe6a4c4ddfb38f63ffb5d5c24
[04/12] sdk-manual: working-projects: properly highlight code code-blocks
        commit: 10d40604cb4affb17dda2253f82a2422d5a9bcf6
[05/12] sdk-manual: appending-customizing: use none lexer for BitBake cod=
e blocks
        commit: d682bce63cdc5aad9c2d3b932a6ba2d27ecfe107
[06/12] sdk-manual: appendix-obtain: replace directory structure PNG with=
 a parsed-literal block
        commit: 0c68497ec5f6525483e5a98e15db24f651bf28ba
[07/12] sdk-manual: appendix-obtain: replace eSDK directory structure PNG=
 with a parsed-literal block
        commit: 77b24b4a8d437797ab25dfeb37ae5cd911c52d31
[08/12] sdk-manual: replace sdk-environment PNG with SVG
        commit: 39fb148792cd6b8e567a496bdbe63a50759eef36
[09/12] sdk-manual: delete sdk-title PNG
        commit: ffaea8391b3d78c2ccf964474e03c50a1c043c6c
[10/12] sdk-manual: appendix-obtain: use parsed-literal block for naming =
convention of the installer scripts
        commit: 41ee642c33cc2e7435e6037bf49fe7495ffa6133
[11/12] sdk-manual: using: fix SDK filename example
        commit: ede411d70ffc837e5bea4666da9706e67960b0f2
[12/12] sdk-manual: appendix-obtain: fix default path for eSDK installer =
script
        commit: 52ec12522bad3bbdff937f1c66224aa9b2d299cd


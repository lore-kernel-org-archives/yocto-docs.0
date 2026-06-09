Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86EDCCD8CAD
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 07:29:02 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.74157.1780990133773532036
 for <docs@lists.yoctoproject.org>;
 Tue, 09 Jun 2026 00:28:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=uYL/v4pC;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3CA274E42D43;
	Tue,  9 Jun 2026 07:28:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1142C5FFC1;
	Tue,  9 Jun 2026 07:28:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EF468106A2ABA;
	Tue,  9 Jun 2026 09:28:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780990131; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gbFaUI80u3sgzJRL7JzwAEV7td12nv8GPxGgpRRdgqk=;
	b=uYL/v4pCKaSZqWT1P9vzqwIN4tuXLxJz9QdMRDRRC+Rn2dIC2n/zbKDrljxeEV2qpmdl1N
	PqgNClkYfhvnKkUl/7dNbC+6K4AmUITzcR/p7dpa6Nf+5WW7SpkYT4BMRK1OgdE3tLmcMB
	7Yz/iHatwVLptBscU+Q4lLJiI1C7eY1NSkxG1iPI9lmKbZHM92hevdoQLW35tVqcAmA2S7
	WA6phvFWah8A2dL3iQ+B2lS48e33wY2SDv/5f1fLV09n8/1WlmIi5Vq/TSXxA4l3l+JNA9
	XDWvNd+bmoALKcSEbdXWJAxD9U1MTZCz5LPmG89jW53aaxf3MRvrR5e7pR5btw==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Marta Rybczynska <rybczynska@gmail.com>
Cc: Antonin Godard <antonin.godard@bootlin.com>,
	Marta Rybczynska <marta.rybczynska@ygreky.com>
Subject: Re: [PATCH v2] security-team.rst: update my email address and key
Date: Tue,  9 Jun 2026 09:27:23 +0200
Message-ID: <178099000141.200930.10403945610194059060.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260603185843.44152-1-marta.rybczynska@ygreky.com>
References: <20260603185843.44152-1-marta.rybczynska@ygreky.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 09 Jun 2026 07:29:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9658

Applied, thanks!

[1/1] security-team.rst: update my email address and key
      commit: 99eb57d083e4fd8dcd6182dbfe7f1f46fd65bb32


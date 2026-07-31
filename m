Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74538C55176
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 09:37:11 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2963.1785490626807683569
 for <docs@lists.yoctoproject.org>;
 Fri, 31 Jul 2026 02:37:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=ODtDSeJs;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2FBFE1A134E
	for <docs@lists.yoctoproject.org>; Fri, 31 Jul 2026 09:37:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0488E6039A;
	Fri, 31 Jul 2026 09:37:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EC11611C16612;
	Fri, 31 Jul 2026 11:37:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785490624; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=w9D/KU7xl38PLqjHSS7iBsp2WiIr4+bFi22tKs3knKk=;
	b=ODtDSeJsZplf7S8huPfEgpgpuoF1N4fqHb0fJhyRYD00acXxqciLliicsKpQiRZz6JVezm
	SW9Z1x/mBAMs2t1DuHhB+5iISRSHFxhtPL2qr8zkUv0AJvwRFq0XnrtlRwYENABahKb1v8
	pvzjymjNNpSMH8HfBIcjfGO55uFWK3AvahdHH3bxNFvWHq1hzufOrvSvb9nqzl3yliRNYk
	a7G2crHEt04n4p8ze8oMMFH+2sBMk2Bl/CRRNJAIHOwmZG5s7jeLS4UU1y0fjqg9Q/QJlz
	A7mrg1zPoGRv9BRrUzkHQZQ6tsuvlEIDXZc06q7eCKW6YjYkr7DLsDxPdqFoLA==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH v2 0/3] Fix broken links
Date: Fri, 31 Jul 2026 11:36:19 +0200
Message-ID: <178548999948.2379643.9022778475462136211.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260721-linkcheck-v2-0-32d93e054c50@bootlin.com>
References: <20260721-linkcheck-v2-0-32d93e054c50@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 31 Jul 2026 09:37:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10217

Applied, thanks!

[1/3] conf.py: add linkcheck builder exclusions for frequent links
      commit: c7911771f24ffd7c54fa62ca18e0f877928855b2
[2/3] migration-guides/migration-3.4.rst: replace rlbl broken link
      commit: 7c9e541c555fd43af3b4963c15500f6329738834
[3/3] migration-guides: replace broken link with archive links
      commit: 3288e85934868917f10d66a9130bbdfa5e0ff763


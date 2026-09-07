Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7EB1C79F9E
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 08:31:16 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30378.1788769871564401967
 for <docs@lists.yoctoproject.org>;
 Mon, 07 Sep 2026 01:31:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=OM3f+xZi;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 50CB71A185C
	for <docs@lists.yoctoproject.org>; Mon,  7 Sep 2026 08:31:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 25E5860383
	for <docs@lists.yoctoproject.org>; Mon,  7 Sep 2026 08:31:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 76CDE11C7AEFF;
	Mon,  7 Sep 2026 10:31:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788769868; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=NJGKmo8MAdWthfVrcUkmIC4EDV7zpoagjp1jfhtIvmA=;
	b=OM3f+xZi1I8T9odpXgyuvVYst7CIHBuXDYBgbKJ2okKyGq5t5G+TOszGqfzA+KJ8RAKlvI
	4LdEmqdInWc+V2UUXu+V0RpXG5a5xtWFtW8DbhYA5FldJ76kuu5Gr0fvVU3H/Pf6hnDc0K
	wIaU/sKnVzbywIY/f/K7kgM1eviVE4JJwuF22E9cKbAvibcbZzlmVY1tc2maJmfLpS7NLw
	sH8rsEopBwllT32FS/MoBwJ2KAPpx55UgEUY16Nqjmu8zPuEH4Wy2YQH8stSz/BdaTZPdJ
	E1gyrbGBy4HuYNdavFPNYd0R771lmP2SS1DkvAR3miGacwAzq8QJ25zoUbi1tg==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 0/3] conf.py cleanups
Date: Mon,  7 Sep 2026 10:30:18 +0200
Message-ID: <178876977273.61738.3122173271467358039.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260828-cleanup-conf-py-v1-0-c8925e5fe1ac@bootlin.com>
References: <20260828-cleanup-conf-py-v1-0-c8925e5fe1ac@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 07 Sep 2026 08:31:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10436

Applied, thanks!

[1/3] conf.py: move and sort imports
      commit: 6eed9dc716772362dcb841414725efe2639de620
[2/3] conf.py: use importlib to check that sphinx_rtd_theme exists
      commit: e7f29bea358c1278ddba315168de73493e3337e7
[3/3] conf.py: reorganize options
      commit: 7f7275b00dc69d901376fdeea370111fafc55cd9


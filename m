Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F34EBE9B352
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 09:54:23 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.157071.1772445258578917650
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Mar 2026 01:54:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=GVcF/Yfd;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9F4864E424D9
	for <docs@lists.yoctoproject.org>; Mon,  2 Mar 2026 09:54:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 66ED45FE89
	for <docs@lists.yoctoproject.org>; Mon,  2 Mar 2026 09:54:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6AF2F102F1C60;
	Mon,  2 Mar 2026 10:54:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772445256; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ut9xxs49ssVMqJnSJnXOHVWSDynXNo9jrHZrjiNt8B4=;
	b=GVcF/Yfds4k+ewhUljpjMP25vSjxwWErohGBlSCh2uHpUbhNVG7P5z0LpG7am0auzJu8OJ
	Q8Jd+l7NXzOI8bdxm6W03eNS2vnjxGtsOfn+j2hQ3lNqQjlyGr7QJOljYiCAo7+yTx5RIl
	yncKL6STCD2/cA7kym4rcotBqmEecnyHpAvureyXyjPcxfspqBiHdo0jvx/uPmIOr2cSPo
	g3p2MEKThcTZFYsOq8dIDh732nPG9rlxTKmp2eqQd7hxGZ0tVK9XdMCjBS8cZu8rFGP1rB
	zgSnLvQ/Dqn57PuzfZVculPUHDagnn5gxeFZKVl7cyzMZ5lI5qOhh2TSRtQmvg==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] docs-wide: remove Bazaar fetcher references
Date: Mon,  2 Mar 2026 10:53:32 +0100
Message-ID: <177244519637.106718.2425721586823125798.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260217-remove-bzr-references-v1-1-8cdadbc3499c@bootlin.com>
References: <20260217-remove-bzr-references-v1-1-8cdadbc3499c@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 02 Mar 2026 09:54:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9027

Applied, thanks!

[1/1] docs-wide: remove Bazaar fetcher references
      commit: 3f052ae60f5647e9114b204f056ac680a5c70960


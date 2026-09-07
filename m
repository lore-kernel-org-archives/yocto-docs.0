Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30446C79FA8
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 08:31:27 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30052.1788769878332546824
 for <docs@lists.yoctoproject.org>;
 Mon, 07 Sep 2026 01:31:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=fwgZe6U8;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6F8064E41561;
	Mon,  7 Sep 2026 08:31:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3EF7F60383;
	Mon,  7 Sep 2026 08:31:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 855D711C7AEFF;
	Mon,  7 Sep 2026 10:31:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788769875; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XWliizxJPB2EcczPviaWbT9OMjT0e3pMY9rCUb4PCQ8=;
	b=fwgZe6U8MTbNFvuFyvoVqdMSsaR11w8KabifpYvLLIRkDJanzItrjDwyQa/12ZgPV7W0QU
	jE4KVykGxM/vR87a+76yP+Vm8CLhwhSexDws0PdcFCTbst6WKTzJ9CUH10ECVYv7lQ/oXI
	PyBYi9wCq2/QLpvuqLeFBnlfFkHlGUnxwaYAikbow4y8yOYDtVxUiYWW0anjvAnITzA94M
	Thk22xK0w+2Jaq3jZhNQ36/tyaAoA9ur+nnRTpNT6ZuKmXiFKWZV1MhrdkYpGuC/U/urYt
	V6zeQIFGuqIFYqnYxwDkmJplOlzEPuFGtqJw7h2T34QzTbV77qVT+bY3wKVdUQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Peter Kjellerstedt <pkj@axis.com>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] ref-manual: Remove the documentation of the GROUPMEMS_PARAM variable
Date: Mon,  7 Sep 2026 10:30:21 +0200
Message-ID: <178876977257.61738.8536745801050198307.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260825181652.2993460-1-pkj@axis.com>
References: <20260825181652.2993460-1-pkj@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 07 Sep 2026 08:31:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10439

Applied, thanks!

[1/1] ref-manual: Remove the documentation of the GROUPMEMS_PARAM variabl=
e
      commit: 6ed246061b5d7c87fd37c08e7586c450e0561229


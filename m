Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41E33E9B349
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 09:54:34 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.157221.1772445264525208072
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Mar 2026 01:54:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=giM+GHkD;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 09E52C40F86
	for <docs@lists.yoctoproject.org>; Mon,  2 Mar 2026 09:54:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DB2465FE89;
	Mon,  2 Mar 2026 09:54:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DF9641036954A;
	Mon,  2 Mar 2026 10:54:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772445262; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lMuOl/R29puEP0Pg4pVe172HmzUGfXnE+bqNRNA/PVk=;
	b=giM+GHkDpTukRgmKz2naBX4g8TSeRv9IXt2ggTdSQMA4oGq+xTXU0jCFWGbE3gVkzadJTy
	Kv50HIaQGvXR1xv2F9vquK7xugXPU9odFDxJ9U26VMxrhuvu2wAS3AqNjNNft1KwqRSFO2
	ScpT/TxwtkibCjj5GiaP3zvZnobNy6DgpweTfVzYVo5QlAKHPYwPOtp9RnaLvM0MEiGSzE
	90ry3h8VDJnV/hA16grhFq3nN+4Y5Fdz1zcRaO3/vm9orA2nG3rREYUhqY+kN8bhdfYHF5
	o35nuUYa2NRzCrBMUT6SB/SmOP89lW9b/N3QSnPjAnUUOkViLgUig308zjJk5A==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] dev-manual: delete references to "tar" package format
Date: Mon,  2 Mar 2026 10:53:42 +0100
Message-ID: <177244519661.106718.10780270476092724565.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <a18346b3-9fc5-59c2-a016-bf57ad06048a@crashcourse.ca>
References: <a18346b3-9fc5-59c2-a016-bf57ad06048a@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 02 Mar 2026 09:54:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9036

Applied, thanks!

[1/1] dev-manual: delete references to "tar" package format
      commit: 6ab93e2eb967231499bd12177915fced6c6d2296


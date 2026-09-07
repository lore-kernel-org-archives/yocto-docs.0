Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ED9FC79F89
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 08:31:26 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30385.1788769885730521364
 for <docs@lists.yoctoproject.org>;
 Mon, 07 Sep 2026 01:31:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=b0sMYfOM;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0BF3C4E41561;
	Mon,  7 Sep 2026 08:31:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D55D160383;
	Mon,  7 Sep 2026 08:31:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CCDBD11C7AEFF;
	Mon,  7 Sep 2026 10:31:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788769878; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mK8EEVLsMOlVi+sSSFLkaqTGWD9f2zkpIc9ZZvC1hPk=;
	b=b0sMYfOM2L2KY7W6P823Ku9MNwWwnPgejR18y5xq4z8xigHXQ6S+IbauOL0A7oMYqei85A
	HV5gstL9Ok/WJr7EhXPhYGqTCl84MwnrLmmPgC8EdtIboshRenP+ussax3773+KFN9kDin
	qkQ+4LogSYzOad1z/Qx3LlfWOID7NOeTH0T0jBlbfBBRt6wJ86c9eH4KNnWvSO+WUXd0OK
	6HAP6/L+QOhKEMfDsN1Bi8DgIMZj+WOTQcXH5mQS5uC3jxKrI9I47GZJI33gus3PwwrlwW
	Yyiu+rzhGD0Pec4EeaKsCqr1u2CNjXiwp831hvl7bpvNkaxZvYGEwSflMJRbqQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Trevor Woerner <twoerner@gmail.com>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH 1/4] ref-manual: drop the full stop from the QB_SMP example
Date: Mon,  7 Sep 2026 10:30:25 +0200
Message-ID: <178876977271.61738.12978087655591768385.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260831021255.4064163-1-twoerner@gmail.com>
References: <20260831021255.4064163-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 07 Sep 2026 08:31:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10443

Applied, thanks!

[1/4] ref-manual: drop the full stop from the QB_SMP example
      commit: 45ad427bc86566d47ff5213e9826a8e81cef412f
[2/4] ref-manual: fix a typo in the QB_SMP description
      commit: 1c923f5f6f3f9b2df6285d07bef56e95f05daf4f
[3/4] dev-manual: quote the values in two recipe examples
      commit: fc81d055ab85d2d55d440f20f442b552d1374a26
[4/4] toaster-manual: spell the json code-block language in lower case
      commit: 3bc15cadd98b071e16cd4a806f284cbfc94fd408


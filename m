Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7341C44515
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 09:13:06 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8696.1784193176502096150
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Jul 2026 02:12:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=uN7omPFH;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D25A44E40E08
	for <docs@lists.yoctoproject.org>; Thu, 16 Jul 2026 09:12:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A7AAD602B8
	for <docs@lists.yoctoproject.org>; Thu, 16 Jul 2026 09:12:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1FB6F11BD3CB1;
	Thu, 16 Jul 2026 11:12:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784193174; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Y9vhyeIduF9efkiWt7QB6e003XlD9fj1TDdYBih/Dmk=;
	b=uN7omPFHeMjCEvd24nNnRB6TFCcxIDFVHBIONng/a4hBJtjbUhK5Kd/UzkjtH7wymcbN41
	VS4xY1/6/iApFV9/pdsiWhAUHe9Rf2gHoHtaG2HM0dmRdUf84V9co3kOHLezZruY/ON3uc
	+PL4LVMkKqK7j8nhAzkCFlTEleUM8AxAXvOhRFrWqTzfUf258GRP+PduC7RJLRDg5Sfel+
	1pE5q70a0ZsFuM50MEqgcgUboPahfDUjj5UN7S6Pe2ubOMJnWbTYAw6EY++3FWDPW17rKg
	OFSFZqc158mx/SvwtIoHOSPXhjsQYrghFfWnTbAsXtGy6UaYjP5a9Zfprfi+Cw==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] ref-manual: fix some repeated strings
Date: Thu, 16 Jul 2026 11:12:16 +0200
Message-ID: <178419298529.94913.14520689706526559025.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260710-repeated-strings-v1-1-e170bab49db3@bootlin.com>
References: <20260710-repeated-strings-v1-1-e170bab49db3@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Jul 2026 09:13:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10080

Applied, thanks!

[1/1] ref-manual: fix some repeated strings
      commit: 84081c245ed95e096e855eb52558953019b61210


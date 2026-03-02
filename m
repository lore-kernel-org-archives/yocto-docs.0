Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 426FFE9B358
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 09:54:24 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.157220.1772445263715861108
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Mar 2026 01:54:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=cSN0WoPJ;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3DC321A1C75
	for <docs@lists.yoctoproject.org>; Mon,  2 Mar 2026 09:54:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 143C25FE89;
	Mon,  2 Mar 2026 09:54:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 39260102F1C60;
	Mon,  2 Mar 2026 10:54:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772445261; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Zr7+yooBvSX9Fe2XoDaLLbFSfV/aLe4Hfs3xc1BLM3M=;
	b=cSN0WoPJwdqA8g/D/o1jYHMnAFq4zwW2b1AFZsWlz8NKMd2TE+uHysA17PYC77XHojjwQX
	CyA4CmSJeysk1yozHl+1+tUZzzj5Y8Mfzvt0i0bwveJaUipY9toMjklSVKwRiK5k86Hsii
	0DJq3QBmjLdx1GRmMnSuE1TXv/xPiaE62FjVSqGRl0gU1paahy2lOarwMsTkFZ4U2k9Ra4
	CWuxfUUEJyaGGRPKbloe+jdYfuFrY0XvPZ8MiD9aGR/iPC62Zw12LW1kmNSPZUiT0V+FSd
	G+ioH0xpYp2ewvmRn6Wnd3d/Cj5/FQ935cLIxMObucLJiYrZ5XrzdId1mS79fQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	michael.opdenacker@rootcommit.com
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] ref-manual/classes.rst: fix broken links to U-Boot documentation
Date: Mon,  2 Mar 2026 10:53:41 +0100
Message-ID: <177244519636.106718.8433457945660962762.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260216111502.1919905-1-michael.opdenacker@rootcommit.com>
References: <20260216111502.1919905-1-michael.opdenacker@rootcommit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 02 Mar 2026 09:54:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9035

Applied, thanks!

[1/1] ref-manual/classes.rst: fix broken links to U-Boot documentation
      commit: c9f83bb2eed9e9212e9a0de8d34f9e9e65e94aed


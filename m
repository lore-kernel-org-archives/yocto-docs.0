Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6F36CD8CAE
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 07:28:51 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.73968.1780990124508608090
 for <docs@lists.yoctoproject.org>;
 Tue, 09 Jun 2026 00:28:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=UDLrpnvf;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 641CAC4FED4
	for <docs@lists.yoctoproject.org>; Tue,  9 Jun 2026 07:28:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C78615FFC1;
	Tue,  9 Jun 2026 07:28:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EE1B4106A2A05;
	Tue,  9 Jun 2026 09:28:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780990122; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4WPh2PQoz2DHBJyU/plJWvNXYs2j0wwmQcPmxeCkC/U=;
	b=UDLrpnvfklaCJJ/xvINYEkg1aRgc3Ehnp5cnjvmfHtIM7T0E/oCG/3FT5x2Pc/UsWc52Pl
	IuVxjHaHHNJjkwtTXypzz3ryxzbWZ48yg68Vxl6QUorWDlMSKSBz03MPbVTiF79jZNHNLK
	7KwceLOjJMPayUDpRTclxIXxmDtUMmJDz9E4rVa1Xsrs1YJuTy/XhR06tkdLEBKdCzARNq
	Zmn0k5dDcGAloQG3kQiQ1cyaDI6X56/E8qdZZ2PgiYr/yv4BjvEpfZy3QRexFgZrtgcyS1
	hZGI+HauBDmrY+sjeb110+eiXuDen5JDs2cvQqQWLYehFipGiy0fWE5Qm5V6Rg==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] overview-manual: inform the reader early of "bitbake-getvar"
Date: Tue,  9 Jun 2026 09:27:13 +0200
Message-ID: <178099000089.200930.14158283106408608413.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <994b353e-5432-0b4e-4662-8f268483518a@crashcourse.ca>
References: <994b353e-5432-0b4e-4662-8f268483518a@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 09 Jun 2026 07:28:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9648

Applied, thanks!

[1/1] overview-manual: inform the reader early of "bitbake-getvar"
      commit: 33f57d154ad1ec950c59c5aab20e0a0323ef19cc


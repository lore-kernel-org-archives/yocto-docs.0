Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC839C44500
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 08:05:34 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32902.1782720326141395723
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Jun 2026 01:05:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=o2PwbSa0;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7B1964E40B5C
	for <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 08:05:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 515495FF96;
	Mon, 29 Jun 2026 08:05:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2BA63106F157F;
	Mon, 29 Jun 2026 10:05:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782720323; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1iGYO9QrWjpMyz/jhxfZZWclOE6cslZ01q0nGoNYRZk=;
	b=o2PwbSa0DnpJ45G15XXLDX1hVrmtcwMSOwQ6SIfnOS8LIeaKTYkB0+ORSS3daX4p7gh4W6
	LingPtZb+nYyXThgiclNmqIJR0koYDicuZLnyMsjeuI0/eWkAB7VUFCIh26XtUdjsqrZZw
	myy660xF77G0t56H7vhBM1QHEopmk2ZGEDKNFWG7OOFiiqMUWGrgIFhCCAs5Ksj0Lqfxgb
	9/c+I4jS1au/FrAweik8GTf1BPSdWpNEk3rBPQtUd7+8WXBU/NKUYxkiir9PAJOJjPd+Gm
	ep4Z/8JSVceXHH9j8CDONEdXdmYFIo8i2Pe7w4QxRsDrJTrLWPsThx47J86uiw==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH v2] ref-manual: under meta/files entry, mention Wic files
Date: Mon, 29 Jun 2026 10:03:27 +0200
Message-ID: <178272012643.45179.11410032932743673998.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <6d348bc4-6069-0544-0e68-80af8d34ad82@crashcourse.ca>
References: <6d348bc4-6069-0544-0e68-80af8d34ad82@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 08:05:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9957

Applied, thanks!

[1/1] ref-manual: under meta/files entry, mention Wic files
      commit: cdc15edf0c5339905e011876e2c35cc5e6e61eae


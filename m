Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B02C4CD98C7
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 07:28:41 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.73965.1780990120475638500
 for <docs@lists.yoctoproject.org>;
 Tue, 09 Jun 2026 00:28:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=1Q+k0qil;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5C2D5C4FED6
	for <docs@lists.yoctoproject.org>; Tue,  9 Jun 2026 07:28:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 014055FFC1;
	Tue,  9 Jun 2026 07:28:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 41BBB106A2A05;
	Tue,  9 Jun 2026 09:28:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780990118; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=M0Pvxchlt4iM7+0/DtSRh8hi01/1pZ2nbYW+Smf9GZ8=;
	b=1Q+k0qildR3fJgqkipOBt9nRedCxTsI9en7RDovoEo3TbMtgj19PrU0G93UxgVnh2tSh99
	ATxyzxs343cH/Skz7ctQvm1R+o5qrwgR/k5OZadiBuvpd9fLA1oph3mn2z/qeaDLJuH/wg
	J9mGVXlwVGvGkyPPpIBubPjiz8aMYgbbWZnRBrFfBQ7CCHTObObYeecfFgaEoGT69AtgeM
	NVRTBBlC0g1MpmntVZU0G6UJjuKqaIrmQlbp02uMM0qwr9rh8kpPWwqrU1h22WUrMU2Xbd
	z+X4SLS6K6xciwRL7z7okSsMdoCY1dKW9AOHtBk+esMBUhDfXPVALxDS5lwmrA==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] overview-manual: correct that "conf" is a subdir of build dir
Date: Tue,  9 Jun 2026 09:27:09 +0200
Message-ID: <178099000152.200930.1650648250315004482.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <153ac3ae-f1da-cbb5-c476-b96a35960307@crashcourse.ca>
References: <153ac3ae-f1da-cbb5-c476-b96a35960307@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 09 Jun 2026 07:28:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9644

Applied, thanks!

[1/1] overview-manual: correct that "conf" is a subdir of build dir
      commit: 2c45b64c1d5a7959cb231bf7a60061e2524cbdeb


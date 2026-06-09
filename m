Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22246CD98C3
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 07:28:52 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.73969.1780990125390244284
 for <docs@lists.yoctoproject.org>;
 Tue, 09 Jun 2026 00:28:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=ePeCNS3J;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DB6E71A37F3;
	Tue,  9 Jun 2026 07:28:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B0FE45FFC1;
	Tue,  9 Jun 2026 07:28:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AD7A1106A2AC5;
	Tue,  9 Jun 2026 09:28:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780990123; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=d1LydKRlovAq1SKbwDAwz0Hn7ZXq9c9uWfsfjxRTf5Y=;
	b=ePeCNS3J2bB+4lbuztL/X7vwZInyBVJE10GZXYfmJY7t/PJGsVswlsts+FdexY3kO80L3p
	Ee/SBI1WyG5syGOA68gvxmyaB+GBrHxSE/ToIZU3014A4LpFRk+tG2dLmzHb1euNyULeoz
	hN2mvc7u+TISzsiplx7TVgKi03IqkZXg+DoUc1DtWMvILgEQ4DyfQmQudd29RUnFZXnu9r
	4Vm9eBHnfaQasghyOzUH0V7i6B3Yvxa6maQY5+KMH1cTFUDndYqVaXQlJHBgujt+pN24wH
	DCcYay59R5MnvFc1if5yXw1+fLWMP7XreaRGnbhSyXNToPt7CKC00n52rux46A==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] overview-manual: mention that patch files can be compressed
Date: Tue,  9 Jun 2026 09:27:14 +0200
Message-ID: <178099000161.200930.11743850839712421398.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <c9900698-224d-8acc-0c77-7fa1363e341f@crashcourse.ca>
References: <c9900698-224d-8acc-0c77-7fa1363e341f@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 09 Jun 2026 07:28:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9649

Applied, thanks!

[1/1] overview-manual: mention that patch files can be compressed
      commit: bcfd8b907adc920ed2d25f0c4d5208989b814585


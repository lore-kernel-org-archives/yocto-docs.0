Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEBECE9B351
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 09:54:23 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.157217.1772445260980810287
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Mar 2026 01:54:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=WY+wgb9M;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9864DC40F8A;
	Mon,  2 Mar 2026 09:54:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 75D8E5FE89;
	Mon,  2 Mar 2026 09:54:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8AAE9102F1C60;
	Mon,  2 Mar 2026 10:54:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772445259; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=go43lpXd4ZXVK5/+yuhOOzYlkclM5lTO4uSmXlqOBdA=;
	b=WY+wgb9MIdGW+oSK6WREi2mN0RxVQNhdKl/E5OGZwXv+rnLULxYGTUybOhAd0cCUoz6XOC
	ZGVJcO26T1IpVrhSWXXAc8Vb5Y6F4Yv8MWWa89KREKaX0hZJ79IC8SEwR/OyBaR2HbUd6I
	QeY//PtbUHubaeTUcmibUqyyiQqJFIm+GZQRrvykq34xHIgWc5h4oTMHWF9OG2Do8cRuso
	3tTrtE/H+/s8C15pw9Rf9QDhQY2wqZFmDf01W+boXastzStZuBpnTRoMjkQWI2pMLr/cS8
	UaZeOiDWAW1oupg66U0sCWC8W0pi3s8e9Pl6RwVWNjNu63TAdi2IfOVLpxQGcg==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Quentin Schulz <foss+yocto@0leil.net>
Cc: Antonin Godard <antonin.godard@bootlin.com>,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH v4 0/3] migrate Debian/Ubuntu to pip packages for docs + fix epub and latexpdf targets not finding glob images
Date: Mon,  2 Mar 2026 10:53:37 +0100
Message-ID: <177244519642.106718.2108087935906443709.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260216-fix-make-multi-target-v4-0-749e588cb7f5@cherry.de>
References: <20260216-fix-make-multi-target-v4-0-749e588cb7f5@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 02 Mar 2026 09:54:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9031

Applied, thanks!

[1/3] use a venv for installing packages with pip
      commit: 16599c4f65d451c47104e7604b68a0658d25ac48
[2/3] consistently use pip packages for all distros
      commit: 4fbae014790373ec2c662325e54cf7f07f507dbc
[3/3] convert SVGs to PDF and PNG using sphinxcontrib.rsvgconverter plugi=
n
      commit: ba351b35480d9c06c870a6f34d8bdbc1856b9511


Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D522C43327
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 08:04:42 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32875.1782720278898734190
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Jun 2026 01:04:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=DpQ60w6q;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 883C24E40B4C;
	Mon, 29 Jun 2026 08:04:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4EE4D5FF96;
	Mon, 29 Jun 2026 08:04:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 29325106F1503;
	Mon, 29 Jun 2026 10:04:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782720275; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Idfeae7y841yZq1PE9Ze06UVlU4exVsZHcpALsQA7XM=;
	b=DpQ60w6quD23nR/bEHdmQIzwm6LcR8dxqeZtMptgTxrY/OSLBhwRs1ru6jeNDc7PZfReQZ
	sKvQF3VOMi32sanQlB1wxoFtqvq+N/K/ofJflnnV9tPkX4esWbm4BOcQ8DPi4/OjY+rt4l
	mlx9E/nE8tiY+ZXGaWW/RNVFCSd6YEilfq/9mCb6DfCybFGKwxPF8z53sCF8v9W/2uBDAS
	emwRAWsWBWcq7zDxpYrEp+FT/1ckJ8lZUVla6SXYRoBzDebxYgZ43TFa71Ilx8KjmgkYT/
	kabx3uPi8eeIr8W+rWmGg7zlu2a3KH/w0wiXVh8RcJU7fbkitXvBrkn8480yjw==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: Re: [PATCH] host_packages_scripts/ubuntu_docs.sh: remove python3-saneyaml
Date: Mon, 29 Jun 2026 10:02:52 +0200
Message-ID: <178272012603.45179.17188858522290255337.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260622-remove-saneyaml-dependency-v1-1-5ff9f1f37db0@bootlin.com>
References: <20260622-remove-saneyaml-dependency-v1-1-5ff9f1f37db0@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 08:04:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9922

Applied, thanks!

[1/1] host_packages_scripts/ubuntu_docs.sh: remove python3-saneyaml
      commit: 47f0f69651280151a52f41fd6b425d55427401e9


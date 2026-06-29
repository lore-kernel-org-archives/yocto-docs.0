Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8F33C44502
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 08:05:34 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32901.1782720324872156734
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Jun 2026 01:05:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=VXD3TB+5;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 30721C51466;
	Mon, 29 Jun 2026 08:05:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 320E15FF96;
	Mon, 29 Jun 2026 08:05:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AE3C9106F157E;
	Mon, 29 Jun 2026 10:05:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782720322; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4AlUspG5LwO+Fh+WHgIr9OPOETjRadOP4Q1QiKpluE4=;
	b=VXD3TB+5RixTtd0OI3PynYoOIZNRNKASGy2Ge6l9B231zoFVD9JOYARL+s0VNfxg9JBpfT
	SKX8pEdqHwEZXO+qXLc6tR9WYCNX9u7aMuGU1iXSgpE6yqXN3lh3rRTtRU+eYXcAZDoyjA
	GAOme83OqqWpGIMfHU/0eat1Yt+bJ/ZHKyTBSlflHyW9Cfo3mwrNsU027SmkohIu/UQn6Z
	oB4lG/ncXccBLigsST//v+RalzMhi9rKMIZL3hCcbu/ditmJ7qL5UGvaR1y9Dsx1XS14Xk
	ZiFh3d8cavqVxrj+2pLJRHCI2tDKzaL7yVhQBKmUzyzEhYKiy3KDjIWx9H91iA==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH v2] ref-manual: explain default value used for SUMMARY
Date: Mon, 29 Jun 2026 10:03:26 +0200
Message-ID: <178272012592.45179.15185376178604935540.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <9e54454f-72b1-06e6-b271-7a14647af536@crashcourse.ca>
References: <9e54454f-72b1-06e6-b271-7a14647af536@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 08:05:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9956

Applied, thanks!

[1/1] ref-manual: explain default value used for SUMMARY
      commit: 3857668fe59aefc0ffa8535cb048bfebe98b5182


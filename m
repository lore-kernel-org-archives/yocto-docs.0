Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19F00C43638
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 08:05:24 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87421.1782720316484416938
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Jun 2026 01:05:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=PjWvcgoK;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D7B581A0CD7
	for <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 08:05:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AE1A55FF96;
	Mon, 29 Jun 2026 08:05:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0329F106F1577;
	Mon, 29 Jun 2026 10:05:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782720314; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xhCCFMQ8q+YJe1xCTeirc3IBBAKKakuuEG3w7bg8TFc=;
	b=PjWvcgoK31Cl1Gy7rZ6H52cy63PNk4IeNQBOsGkCBhw7jgohiDGeaE2+0H92r/50NZDjvr
	7qQFXmRm6z1rpzrjqQ2Lib2N0bDTB/9CbWToeRdYYGnUslcM3JK667OBj/Ih0hMQCpdF+I
	2m7kp7UpVjx1bxPOqKw6VJvn+C0cldZGdtrXS9WQpzC+g7M4ViEuSlsWYiHnDGxz9cUd4C
	BUiEQYL/hlLzVLRLHrXYqL1Q9G3HfUxAcBYeKED7k/wFXO+ypn5XU2KTpq+ipZeD/wvwPr
	EAMxH3viSHAgUmpSCDRoZOT3rBVP3NcmGJKF+GfAGyP36Gfkt/CUX/HihO7Y5Q==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] test-manual: clarify that ptest-runner is added automatically
Date: Mon, 29 Jun 2026 10:03:20 +0200
Message-ID: <178272012684.45179.8150597584664690257.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <8c5fe4ee-1826-c72c-17ba-891157a43b63@crashcourse.ca>
References: <8c5fe4ee-1826-c72c-17ba-891157a43b63@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 08:05:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9950

Applied, thanks!

[1/1] test-manual: clarify that ptest-runner is added automatically
      commit: 5fd719c9bce414eefdbcfe9fcfb9beac5fe825ef


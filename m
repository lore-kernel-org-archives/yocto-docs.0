Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC9BBCD5BB5
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 07:07:32 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31078.1779347243402649225
 for <docs@lists.yoctoproject.org>;
 Thu, 21 May 2026 00:07:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=zvAqoSkU;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E33491A3659
	for <docs@lists.yoctoproject.org>; Thu, 21 May 2026 07:07:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B868C60495;
	Thu, 21 May 2026 07:07:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 82162107EA6C5;
	Thu, 21 May 2026 09:07:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779347241; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=L1HTjHu2hXsUXJDXn4FvqZSCZ8C/Qkiiw6t0Wh+KfHk=;
	b=zvAqoSkUsqcHHzGWjG9YU5N5XdPxmIB2o/5xYfCix6VKxelPpGAcz4bUeuboI+R8qlB359
	hxJDiVA8I1XeyCsNZmti40fxGuODIiK5Ge2SVr3M631CxzKlVG5vHyAQap0Cht/51UwvM3
	Q4y0NGS6OGvSjbgWcDAoQEXbDZfUvvrv/VGq5sODDNJwJC8TGDLcztzp+T0GpLCok96ek8
	uhDT3Vc+pW5VUwTGAgyzjypE8HWJdzipePgR+WyMy6XAqFxBgzI7xh5QhoBwhLM1x2khRN
	50Ru5RU1JCeX0r3rSTxbw/T8ef1eCjh9Il72dCUgf10JMArn9cPZxeDQccndUQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] overview-manual: add a few more basic Git commands
Date: Thu, 21 May 2026 09:06:24 +0200
Message-ID: <177934712540.33890.3876663079088366401.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <aacf3c4c-0a65-661b-35b7-91828cf5cd33@crashcourse.ca>
References: <aacf3c4c-0a65-661b-35b7-91828cf5cd33@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 21 May 2026 07:07:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9504

Applied, thanks!

[1/1] overview-manual: add a few more basic Git commands
      commit: 65088fb1f251882bfef7c34e7775eb3ff22c2503


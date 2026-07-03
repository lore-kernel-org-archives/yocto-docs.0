Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBCCDC43602
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 11:45:10 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.91460.1783079108401337102
 for <docs@lists.yoctoproject.org>;
 Fri, 03 Jul 2026 04:45:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=pbYNvhFl;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8104AC49F4B
	for <docs@lists.yoctoproject.org>; Fri,  3 Jul 2026 11:45:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B8DC160300;
	Fri,  3 Jul 2026 11:45:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3B8A9104C9578;
	Fri,  3 Jul 2026 13:45:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783079105; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Ayf8eME9t3HjXgK0+HwbJP9DSNE4cCHahNScjEE2Y6Y=;
	b=pbYNvhFlcDLByAguNi2XQuXfJubHRJKKSMzsbWa+ILw2/fBPGomKH3jz7TbwzpoISm/ng/
	KAl98+jM58PYVXCtdCGiz1T/yOgnhv+LZ1uTN+LJu1GLPGnJaF3FLDrB4VbVqTwWS1yEYq
	/f5dGM8oUawh8TEkQoSmciKHTLAz3lpLdKnKzmpFi5W5k3VDCDtARU8f0I96qN5ONnJm87
	B+RRBolqJwx1/LzSWQCg7Vdl50JZqib2ld9iI6rX5cHIgtiA18BBbYwXduT4MmcKNKWV9k
	bbPSy0k/wvTcmTKpOap3Ttr1xL08qBp3EudYaqWyqObt/Z/KAEh7Nu4NmCrnlA==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH v2] ref-manual: add intro content to Ref Manual "Tasks" section
Date: Fri,  3 Jul 2026 13:43:42 +0200
Message-ID: <178307887469.248663.2669869625333793022.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <8eb71c37-59f9-2901-f988-9c57b9a9bcca@crashcourse.ca>
References: <8eb71c37-59f9-2901-f988-9c57b9a9bcca@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 03 Jul 2026 11:45:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10029

Applied, thanks!

[1/1] ref-manual: add intro content to Ref Manual "Tasks" section
      commit: d35a7940b7185c569a4824553f0ebb0bc2c43ab4


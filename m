Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A7C4C44500
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 08:05:24 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32897.1782720317493178689
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Jun 2026 01:05:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=zIcKq17O;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D230E4E40B5C
	for <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 08:05:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A86C05FF96;
	Mon, 29 Jun 2026 08:05:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A934E106F157B;
	Mon, 29 Jun 2026 10:05:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782720315; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=e4K19kPDsV9sKA3g+jcz3ghnSzN9AhWuy9RhP+kXx0U=;
	b=zIcKq17O0707XNqyZT4mT6mognjvf4Rm7NQPNX38Uz5Ff0DjscpKCmOxekwvOSSQfQWMJQ
	YRHhmF4GYM02vLWZHiI6Wk2qYi16LQKHIa0KfCoIbTIhK0fUCT4cL5zCtn8f8kLCxJNKQF
	R3a0AUyFXLwJHDteYBpNlF34k1yJni6z64IeXvyQ2jy4HcZnDmNp1cfYK5a2CSKykBcB1I
	GkybAJ37K1dhTYheEi+CrpBR/uQGLDcd9L1xzG0qm3JHA7VrUhZSYVpkjNV/fQai9GmmMo
	uHHK+Be1FHczAK6kTk+a91uQQPX3YAshZxnwkBId7UlpYqU+4QQq+WkThv3r5A==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] test-manual: grammatical and URL tweaks/additions in "Welcome" section
Date: Mon, 29 Jun 2026 10:03:21 +0200
Message-ID: <178272012634.45179.5499007830366926576.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <fba6cfe7-72f7-a120-7861-1ec02c4cb3c0@crashcourse.ca>
References: <fba6cfe7-72f7-a120-7861-1ec02c4cb3c0@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 08:05:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9951

Applied, thanks!

[1/1] test-manual: grammatical and URL tweaks/additions in "Welcome" sect=
ion
      commit: 3b1bbbc6820be5b2c1491ecfcf83a8ccac11ca65


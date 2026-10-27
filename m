Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18544.1793107109180337981
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Oct 2026 06:18:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=Yue/Qwzv;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 534CA4E4133B
	for <docs@lists.yoctoproject.org>; Tue, 27 Oct 2026 13:18:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 226F6603BD
	for <docs@lists.yoctoproject.org>; Tue, 27 Oct 2026 13:18:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 74D1B10329027;
	Tue, 27 Oct 2026 14:18:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793107106; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=av09j5IIRunXA+8Xh6LOfg/RRHRToy6JZ7zVYgQfMt8=;
	b=Yue/QwzvqpZTogD0b3APr4N6Tp7jvJ3UzHu1gOOnIFmRn2wVUbLxFSS8b+DPwnSMKa2LfE
	hSzd2MJf/kI/lCEPfj89WeL+zsgCGh6RfMfFQM0mmmRmQwo4ILX+Ub4+bJC41eAy07drRG
	BFo+1Riq8arb4WcpJkCgJKhuAc0rFADX3f21z9SqkUsSnNRFnaiF31i45LQfnXnhEkHQ4M
	AYDeD+oVFzZiSbX7klfN/4uCmC66IQPrN7N4uAQuIo4PVUQQMW3OoBSXwpOxhLxw8iurg4
	zfdyOthZ7dHhnxRUEuiLFGZUL5h3wm2AQc5PDYJZAs/hZbg3oHJJMVIEERNySg==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] AGENTS.md: add file
Date: Tue, 27 Oct 2026 14:17:42 +0100
Message-ID: <179310701145.402741.250764139595347172.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261016-agents-md-v1-1-fb9b9e7de437@bootlin.com>
References: <20261016-agents-md-v1-1-fb9b9e7de437@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Tue, 27 Oct 2026 13:18:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10724

Applied to master, thanks!

[1/1] AGENTS.md: add file
      https://git.yoctoproject.org/yocto-docs/commit/?id=3D0878a4edffa9

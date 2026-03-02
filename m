Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9CDFE9B34B
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 09:54:23 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.157075.1772445262454677977
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Mar 2026 01:54:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=YO+7XEkV;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 000721A1D5A;
	Mon,  2 Mar 2026 09:54:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CACFE5FE89;
	Mon,  2 Mar 2026 09:54:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F11B5102F1C60;
	Mon,  2 Mar 2026 10:54:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772445260; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WcIEhv5ZOZcZoAhb5tscGybdnE1y0kPE41mv7mEdd28=;
	b=YO+7XEkV6Ax5CArZDLmZdY/dOfj8lruaMwT/g1GxoT2GC0cag8zmWQCDJmxGdV/sDo5BY3
	wlni7RnMFd3hgMk0seJql36iYDD5lRAjCB00jn+vn5GRTk3RfNiy0mEr+DxGApbssydYgP
	kQKkqJSiuavmDZ3fHt7YD/C6xQtOKsX0WrtgGtGCm5412TA1yJ1VflNkK46Tu2iUXXo8Ub
	pWn3fIxzjEIrzZzD8AAKYpymXYJ3uHwA9uv+Pa1gToVpHb7hjpCFR/N9hf9yJXhRZ0dQjK
	UaUI7rbTMcnuz5KXpMU7sbJPq8LVPxPRBwgqH3YVgrXyx5EimvrQVvwmPZb9pw==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Jan Vermaete <jan.vermaete@gmail.com>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] qemu.rst: parsing of the code-block was not done
Date: Mon,  2 Mar 2026 10:53:39 +0100
Message-ID: <177244519664.106718.7330038707561452094.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260226180845.6135-1-jan.vermaete@gmail.com>
References: <20260226180845.6135-1-jan.vermaete@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 02 Mar 2026 09:54:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9033

Applied, thanks!

[1/1] qemu.rst: parsing of the code-block was not done
      commit: 8cc5a13028a871b7586683a1a347b133001a5ac2


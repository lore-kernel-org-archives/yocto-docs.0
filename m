Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D412C43602
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 08:05:02 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32885.1782720298827550632
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Jun 2026 01:04:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=Whc0Qs9q;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 10C12C5145F
	for <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 08:05:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 12C675FF96;
	Mon, 29 Jun 2026 08:04:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 76BD3106F1570;
	Mon, 29 Jun 2026 10:04:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782720296; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RiWG9d8U7+QpSEghuCpEsmEBUX7WQCzOYycqRgUWZ34=;
	b=Whc0Qs9qJezQImm+V5/3GPKG9Jhz7fLDwqDG+tInoSHnBk9Z0OR4a3kjr4oftp6w+ne3ys
	tbiSSjkrlUIO3WEqaJoKQqwHHj2C4roEUBQovUWFerzyjVJbHlxWQc9DWI3bdZI08EWnGK
	wYAIw0O32YjRyke9PiEZJ2SwXj5aApeJ1LkYqF8oYX2uFYAdrkYYWqTDHL4bb8MCXlasL4
	agvtjFgv3t8do4uauQOFGf8wpOtp2INA22hgqPeypCNPDI0+xEvMFXsFw/DcrxEXw901pq
	Z7OcGMzhxZHmEBtNaKVgInLnZ5jUcTmt7r0gbt2dxLD/TqqFDjTe4SoSbnYJ9Q==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] dev-manual: mention bitbake-layers "--example-recipe-version" option
Date: Mon, 29 Jun 2026 10:03:07 +0200
Message-ID: <178272012614.45179.11463072058758277635.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <c026a42d-9987-5c77-7249-2d906475265c@crashcourse.ca>
References: <c026a42d-9987-5c77-7249-2d906475265c@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 08:05:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9937

Applied, thanks!

[1/1] dev-manual: mention bitbake-layers "--example-recipe-version" optio=
n
      commit: 6cd2e68e3630fa41981a1c7a972922808ff9e6c5


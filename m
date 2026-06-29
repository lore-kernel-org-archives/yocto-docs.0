Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CBF6C44506
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 08:05:24 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87423.1782720323412825827
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Jun 2026 01:05:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=tB3UBcuk;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C11F7C51465;
	Mon, 29 Jun 2026 08:05:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C282F5FF96;
	Mon, 29 Jun 2026 08:05:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B71C5106F157C;
	Mon, 29 Jun 2026 10:05:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782720320; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=N+hGnab2C6Z+TPdmZcLfDfFM7fOIjX6GrszNXpox9sc=;
	b=tB3UBcuk0bOe86nK4bBjo8ovlFhkXUZBKrbjSaIDqpbGHNU1knXITaTxMDEmk7KsoXoOmR
	zK9kUa2kAvJ5DqyZ7Q3R/1ZTwRnt9m/gkw/oP/42/O3pmvW+I4HV5G0S1rfQkJTiikOgGy
	z7GZcBrFsnVoySTrPASxQam/lV4XB8owI4yFsQ6QnGa53CxngXmcQ0ycTu7btE1fHzIdZm
	YLD4FAMv4wXs7DnZ+usoeBNvOM0hSis0cs+6OL2vvY1O4fmNdN0LoE4uuB9Xzwk2sfzbCS
	M/bar8hWc63TDOLU4XJnt8tchrrnHoxi9pw3wwFVZSOxjjkv2+1YDQH8iTxgXw==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH v2] ref-manual: document RM_WORK_EXCLUDE_ITEMS variable
Date: Mon, 29 Jun 2026 10:03:25 +0200
Message-ID: <178272012563.45179.4995163404901415084.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <101ababc-0c13-4310-9d9b-734b88407a54@crashcourse.ca>
References: <101ababc-0c13-4310-9d9b-734b88407a54@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 08:05:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9955

Applied, thanks!

[1/1] ref-manual: document RM_WORK_EXCLUDE_ITEMS variable
      commit: 62c96090be7aeffe7010b70e8dfd5166e506140f


Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6035.1792567327604860470
 for <docs@lists.yoctoproject.org>;
 Wed, 21 Oct 2026 00:22:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=IIr70eBJ;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 62B8D1A12A3
	for <docs@lists.yoctoproject.org>; Wed, 21 Oct 2026 07:22:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 307DC606E3;
	Wed, 21 Oct 2026 07:22:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E03FA10328C52;
	Wed, 21 Oct 2026 09:22:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792567324; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=CYe8fYYR1v7Lf2puer2xALkngLKQZ0YnmQTbfDXnkXY=;
	b=IIr70eBJTSikzuRISxoQPBy8sNzOb9lWv4ohzIxLtqaQHq5Zvt/XPbsg5PAvNwzqF0dvJ6
	i1VCe08XIqUjAZbvMi+y4sn7T9+Evs5/d4AeVZjxVz/g41M33W7kgInC+43JVscbYHEMRv
	/FLCH2WiwXRQczC+L0uoLhsEAtU0IYvsW/jGRILxVgUTxMPdbIZ75mrk1nD5pRjFT6v/+q
	O+NgsdYRHKPohLN2776quvMB5GutBDEJNEhIL7dfrZ7J4qAsVy6iKmEBKWPWtJWAEFYqPH
	DaP7VukCU+03CL/DlFvr48x2Z1vOVNXjJJwmD6dfDJhiTo98R8ThMG7/zgti9A==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	AdrianF <adrian.freihofer@siemens.com>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH v2 1/5] dev-manual/devtool: fix non-patch local file handling docs
Date: Wed, 21 Oct 2026 09:21:45 +0200
Message-ID: <179256699486.524663.15606430164863680288.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924192929.907566-2-adrian.freihofer@siemens.com>
References: <20260924192929.907566-2-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Wed, 21 Oct 2026 07:22:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10702

Applied to master, thanks!

[1/5] dev-manual/devtool: fix non-patch local file handling docs
      https://git.yoctoproject.org/yocto-docs/commit/?id=3D7edf8b2ee5d5

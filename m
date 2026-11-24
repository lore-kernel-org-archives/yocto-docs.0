Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13860.1795510186285569545
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Nov 2026 00:49:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=D0JJTZc8;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1241C1A17A7
	for <docs@lists.yoctoproject.org>; Tue, 24 Nov 2026 08:49:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D285E601E1;
	Tue, 24 Nov 2026 08:49:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8695211E6A4F8;
	Tue, 24 Nov 2026 09:49:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795510183; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vKVUPB1hUVa08VM/PuMAOWEhEA/g/3Y+jY4V+VFmbNk=;
	b=D0JJTZc8B/gOWF9hzq17Kddn/WCDIOqIh0zzIQZYN4JCI60vE+cSivYTG+eQnBhsZdR+qE
	Efk+LI8ZLM/sjbBRTO96BjqVqH3BGrUj5ytou47qbGFD0Bf1E3isYnwnrFIVm8h+U9AdnT
	HHUM+gJwf9BGjqkFu/ktVIlUsZS/t1Otnb5mqjv1Dy4M6PYifH56PbLQwy/Hvh1FafJu6F
	f/tFM2YtwcX/GQZXfpLlXvwejDQuFhcqdDQdSLmrQhD/QEu/yHZiTVWIJ3D4OcmVrXjiMr
	Yp1bVRTxtjEewCsYlx6/fjyD3CDa2my3N4xPTLtGyX8ozL/PKPvWW/kg38bMiw==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Saeed Nourian <saeednourian82@gmail.com>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] docs-wide: remove trailing whitespace
Date: Tue, 24 Nov 2026 09:48:54 +0100
Message-ID: <179551011042.270132.15875854744923909621.b4-ty@b4>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261107073437.1570845-1-saeednourian82@gmail.com>
References: <20261107073437.1570845-1-saeednourian82@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Tue, 24 Nov 2026 08:49:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10829

Applied to master, thanks!

[1/1] docs-wide: remove trailing whitespace
      https://git.yoctoproject.org/yocto-docs/commit/?id=3Df73ea12967a7

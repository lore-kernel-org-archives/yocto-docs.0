Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6037.1792567330440868849
 for <docs@lists.yoctoproject.org>;
 Wed, 21 Oct 2026 00:22:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=KToPP7Nh;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E74FBC5CD72;
	Wed, 21 Oct 2026 07:23:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1D853606E3;
	Wed, 21 Oct 2026 07:22:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 39B5A10328C5E;
	Wed, 21 Oct 2026 09:22:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792567327; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TLeJvA2tdIpYxM+gSPiWL7ZwpsUv6OEt+TMSdxChy5g=;
	b=KToPP7Nhrvy3tI4KXSQO2PoR9yzbsxDzdFui6jxjI1kR1vHpF89T9mGc5kDGOCGalNe6Gu
	+I1T9oGVaDF4vbGv+41zlaEoK8lM4koeW7U5FHcAyrz/JNNkoeNgpDH4Ou+Fx7ZS96e70/
	jEdAeNaf8VYP1bZImWlErP7otYgNaDBoD0WRflJfKOzs05zhSebFw6/z1Oi05oTibJn/+3
	HxDw9Uj6Zp9jOcZs3nth4RY/hsZ3kByinTYVuIAEHXgbURWo+TDjwXV4u3zwXpQiaikbpG
	XcuaWOjMUdNgf2HPxpufIU7lsNtRP01UHyYFMQG1Q/hJuonPSw4YwFPpCdGX0A==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Trevor Woerner <twoerner@gmail.com>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH v3] docs: document the conventions used in the manuals
Date: Wed, 21 Oct 2026 09:21:48 +0200
Message-ID: <179256699475.524663.17985005944275334406.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922120620.2386763-1-twoerner@gmail.com>
References: <20260922120620.2386763-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Wed, 21 Oct 2026 07:22:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10704

Applied to master, thanks!

[1/1] docs: document the conventions used in the manuals
      https://git.yoctoproject.org/yocto-docs/commit/?id=3D28699eda6c2a

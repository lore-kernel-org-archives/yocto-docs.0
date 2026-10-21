Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6015.1792567562856169319
 for <docs@lists.yoctoproject.org>;
 Wed, 21 Oct 2026 00:26:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=MGnf4mcl;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E3364C5CD72
	for <docs@lists.yoctoproject.org>; Wed, 21 Oct 2026 07:26:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1720C606E3;
	Wed, 21 Oct 2026 07:26:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3495E10328C52;
	Wed, 21 Oct 2026 09:25:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792567560; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mCvMf5TucK22IDLQkWZFRHPOCNeHmbW41vs2LxQwnrc=;
	b=MGnf4mcl0hwkeXSkEZoGkdZG+S5U29ibEPNDOU1S56Yma1PtLKeHVXGPW5ElbviEFMHE9b
	BG0cuBOMqOynZrHnWLpN+TmaXUnySbmIvbu3HitJc7qcF6XeZw6hnwo/pk8bL9duIjj9GZ
	C6oge5p40Q0Ts49PTtQyKuHLI96AkjPT9HwxztjH8cMQVW+2Ch5s8G4cgA1lBkxEkeO6BB
	L+vBjOAeite2fU/r/xgEM/4MKcJRpbNZrMWgntYN7ATgTPhZFdPT9WxtkogsxmemYVakEd
	OGDYia/nbTEtLXJ3EQLDgssFdh2gSk6Qf88RQEhcF/5HJ5ZJ/bbaxKIKAOS8ig==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Oct 2026 09:25:58 +0200
Message-Id: <DMAC603DGEUI.3VHPB539W7DHE@bootlin.com>
Subject: Re: [PATCH 0/4] Add latest updates to release-notes-6.1.rst
Cc: <thomas.petazzoni@bootlin.com>, <paul@pbarker.dev>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: =?utf-8?q?Jo=C3=A3o_Marcos_Costa?= <joaomarcos.costa@bootlin.com>,
 <docs@lists.yoctoproject.org>
References: <20261001130904.2061644-1-joaomarcos.costa@bootlin.com>
In-Reply-To: <20261001130904.2061644-1-joaomarcos.costa@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Wed, 21 Oct 2026 07:26:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10705

Applied to master, thanks!

[1/4] migration-guides/release-notes-6.1.rst: add latest changes
      https://git.yoctoproject.org/yocto-docs/commit/?id=3Dca011ce31
[2/4] migration-guides/release-notes-6.1.rst: update contributors
      https://git.yoctoproject.org/yocto-docs/commit/?id=3De5f414c7e
[3/4] migration-guides/release-notes-6.1.rst: add CVE fixes
      https://git.yoctoproject.org/yocto-docs/commit/?id=3D5a87285d0
[4/4] migration-guides/release-notes-6.1.rst: add recipe upgrades
      https://git.yoctoproject.org/yocto-docs/commit/?id=3D08b274029

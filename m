Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9096.1793611417607598425
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Nov 2026 01:23:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=rFJni1aP;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3FDDA1A13FD
	for <docs@lists.yoctoproject.org>; Mon,  2 Nov 2026 09:23:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1517460750;
	Mon,  2 Nov 2026 09:23:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 91067103290E8;
	Mon,  2 Nov 2026 10:23:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793611414; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=2710le0eA2G0dufyHOBE8p+HvjngvW+wX65ZXLr5sKg=;
	b=rFJni1aPY0qTwYmKMULz7A5Se+ravihZAmcWvOCM9C8wzcv78PaWq0Jan1Ue0KsUIX/rkW
	DUw8QZLvMzxAhqG+Z7zL78ueX8e1zU1jE49B9F4wiyNmMz4+ppvPacG25UvxHWFqvzFMDf
	SNVAraEocvarHG9isU+2LzhwCcwicAuuUiPYbi6uNgPLqciYltUOCayup2iu5F6OgZKYrO
	01Lzl/ciZ6mC6eTCWVAIDx7NnkHAN88SfkJ/vCaMCMkvZdD5SuXSKsOrurPGCnrepVjIcw
	lfcMoRcQN9vmpsoWHn2PafGKAnRAxvN3wHsE+Ug1CZzzgv+OxYvG6N1/uFGpmw==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 0/3] Expand WKS (kickstart) documentation
Date: Mon, 02 Nov 2026 10:22:57 +0100
Message-Id: <20261102-wks-in-v1-0-fbb797a3d5cb@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDA2MD3fLsYt3MPF1j4xRji8SUpCQLAxMloOKCotS0zAqwQdGxEH5xaVJ
 WanIJSLdSbS0ArbwAJmoAAAA=
X-Change-ID: 20261030-wks-in-33d38adbb804
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Trevor Woerner <twoerner@gmail.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=610;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=s76kJW5Z80wEvjFpyCeVsm27EAXXuL4LhCJTx0jKH5U=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBq6FZzyolhkP/I3WrVQ/am955SCAzOCKIJT0oNE
 DmUmUFqnQ6JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCauhWcwAKCRDRgEFAKaOo
 NpZ1D/9eaAOaIW54Mp4bK4/OSLzFgEsyQXLME7q9332YExQz1cg9+jcx+xPhJKbljUX5j5fmazP
 N80tt5gLC4VmCZaKRKAH6CwiRZ8K3oWzOxI4uYbMmwwR8Qe5Dliptds5uIvVKA/uNNMuqAjMif7
 LVnYFEy9gxC0P7OjGNIx9VzPESLUU1z2o6R1IunV3dc14xdspY4ZlmIv/PqmllOcYFaU48kz5Sh
 JYClYvuZgYLRoAzWvqgMhMmSQbDxN0s8jAl3N0iDDAAmc6QpXSxe4KK2KRgIb851Z6PVRD8B4Dv
 bWulGjEZhPAJJ23BnLkMqU4kPIm7p5sJroA70qcc6bCGfNaBuHTwr6yCzpp0y5fZrC229AjfI0J
 saZbdvSb0+EdiqiUI3heY1F2uKDZgXv0vn7yJYK6g0krXSLpOJxEc0UhTI/4kAEnLM4Y33ZOrTu
 yCJ9mWSCUtCqWxrkgxiEKwtC1u+IdKWaIvXfVOsTLz9cDTUJCgda3m75z3+l2rsyz6xYsSrC1q5
 rQjGSMETNEbWgf6aQO2AzDHJYjHos5djtU42X5cko4zqOyg/AHJICKiLIVCad5zPlaacK9W5sAn
 W0bSw+Uub9aRFyltVLASaA2OggmukNjq+95LgRxvEzjbg/AOhfYlcVuvS5UZWpZXP1E69GAdKmI
 bfM4ZcGBPOCjjFQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Mon, 02 Nov 2026 09:23:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10753

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (3):
      ref-manual/kickstart.rst: add a section for commands and directives
      ref-manual/kickstart.rst: warn about the include directive only working for .wks
      ref-manual/kickstart.rst: document location and variable expansion

 documentation/ref-manual/kickstart.rst | 140 ++++++++++++++++++++++++++++++++-
 documentation/ref-manual/variables.rst |   8 ++
 2 files changed, 144 insertions(+), 4 deletions(-)
---
base-commit: 7b54854d12f3f2c909727702d39066a3d22a4a40
change-id: 20261030-wks-in-33d38adbb804


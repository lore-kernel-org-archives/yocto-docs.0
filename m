Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10815.1793365128226154296
 for <docs@lists.yoctoproject.org>;
 Fri, 30 Oct 2026 05:58:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=LwFS9kcN;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id EB7091A13C1
	for <docs@lists.yoctoproject.org>; Fri, 30 Oct 2026 12:58:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C0F23603C2
	for <docs@lists.yoctoproject.org>; Fri, 30 Oct 2026 12:58:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1A7DF10329050;
	Fri, 30 Oct 2026 13:58:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793365125; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=AXcYXVbT1b4Ntqt8yVmC0jqFmOaB2T1TmW6HxsCC86A=;
	b=LwFS9kcNo7UTf2Y2qeuOHk4ofu7v6DMsuX/6VLNjyeD8dtBCO7+QIhznaoYlu0U2lElfJ/
	JAuNLzTabgkO6DTbFt0JtofEZ/GM0BxIliroXv1Hvp+3eZ92XC1wAtYEfPPLPSYiTEr2PZ
	gRAcTQYb+e0qsDL6C7910gZOshZ6NVuZvFq3A7lNQOLDVTcvAe25E8fkSWhVmodWggbrLh
	XQ/NyukEq+ERR6voPK4E7vj2vq6N4stOS8J7eYpHvdLKTLGsPHerzH8tYOHHFEn6roPiaE
	i/f2j9FgJMJ3ZcSXHVLS4anbmGtLIiQ6IwYuaDBy7HTDO1OM8m9F3lphMGv3ww==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 0/2] Move to Nimbus Sans for diagrams
Date: Fri, 30 Oct 2026 13:58:37 +0100
Message-Id: <20261030-nimbus-standards-v1-0-119ec9b3c918@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrA1opIq9SnGRZCZ1hKZlJpGCe
 Pem7fIt/j9ASZgUrs0BQjsrP1NF3zYQVpfuZBirwXZ27DtrTeKHL2o0u4ROUM0w+ukyDwEjItT
 sJRT5/Vvelr+1+I1C/n7gPD90uJFLdAAAAA==
X-Change-ID: 20261022-nimbus-standards-36b7593cdfdd
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=784;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=RWrF/rafVy8lkLDBaL3bFFiXaslRP5dp0///MXOQHcA=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBq5JR+e9jLdzWTpRm0s5sSGwpQJ5wP9cHiS5WpY
 YOV8EPRuz+JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCauSUfgAKCRDRgEFAKaOo
 NraAEACJzmrQXyzPGpqk0pbYB1L3+46qZZoBoO9ZJShxc0/9zdwozmqP+le7mQpCIKrgjZ6/wSC
 dI1AZhUHJrFvOP/t61hIOzfG4zGurXAispE0CqdBU9osEsNiQP+bgAOqMBJ4vq/RfsUn+IW9lN5
 m1q2IBI8nmwvWlbV8nMYXGE1WA+GltZV7S74GNKWzh1kPeyiCi8NzxNrB5TRxyKCIFYCXj57mbo
 UEZhHf6Ot/ZSfKs00639S5MObh+/DFGIvAqtHJSAanF++tK7KJWFVka4TK8zPA+To2jE13J3Woh
 uuUJa9/HY7Z9UpHmHAL6J5Hk0VWXOq+zpC/Lw+oQRQpQNomJ/kmG7r8yGxAQxFiYxSpMfC2Ep7d
 oSMwAmmTYVuF59vA1VGnjGwKRxPF5L90+yEofcNjZvVOl6tgogqmHE8gmZEe6yXjbRr1awFxR9C
 d6I6chQTRZF0+G3AKKi5LFQoHKLDrOpo7BElIF2zjl1Eptjme/36XH5CKA7Z930HV779tSxR8GU
 W0B+p5cnsC/4z2cjx03WtF3/fYC4hTQcitYkdJc28OqkG0/cm6OrUs1RIC0IBFCtpV8n5v6P+E0
 EvNFN2YDsx20tk05d3izbVemaj2rBpv9GHGs26tCs2Yc4O5HF5ecc5ntr9EjAHkNzy4QMIDKFQ5
 SIrnX3tmZOm9Ukw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Fri, 30 Oct 2026 12:58:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10743

Change the standards to encourage using Nimbus Sans instead of Nimbus
Roman for diagrams, as it is more readable that way.

Convert the diagrams using Nimbus Roman.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (2):
      standards.md: recommend Nimbus Sans instead of Nimbus Roman
      docs-wide: convert diagrams that use Nimbus Roman to use Nimbus Sans

 documentation/overview-manual/svg/git-workflow.svg | 30 ++++++++--------
 documentation/standards.md                         |  5 +--
 documentation/template/template.svg                | 40 +++++++++++-----------
 3 files changed, 38 insertions(+), 37 deletions(-)
---
base-commit: 7b54854d12f3f2c909727702d39066a3d22a4a40
change-id: 20261022-nimbus-standards-36b7593cdfdd


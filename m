Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17740.1795526286877947404
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Nov 2026 05:18:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=gDqDQrNn;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9A9011A17BE
	for <docs@lists.yoctoproject.org>; Tue, 24 Nov 2026 13:18:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6FFAA601E1
	for <docs@lists.yoctoproject.org>; Tue, 24 Nov 2026 13:18:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DF3C311E69945;
	Tue, 24 Nov 2026 14:17:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795526280; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=Hb5z/8ojkQhj6NjMRdObpsamkVFHnRUCO0hXGVC89+w=;
	b=gDqDQrNn54PCGV60ssLlprFSYguid4t1GMFfrpvbcev6VI0L0MxkeJ2PoaeaRmjZR7Co7w
	2iIEqVEO1DegxgnOGPYsWKnv21wpZeddpM/cSIalQz5aTvJzGXKg7dmL6JMaRJnyidmVIX
	XWnE/8/CzOjrg68ikFjQQqz1HHIsCXhS1oP/BogqMy/0CUlIxinKgW0kJFIivvXyQcoKLh
	IdcYcr8TEROZXq6yxU2wTS1QFd9Ak7voBsv0YdLrCEjGJ66R+0tSrPm964Hb4C5qY7vURS
	9j02MSOXH6wZaZEzhF2hvDzKBijSd1Z4OpRZ8pE6zcAy5rlbhyR10wRsX4/z7g==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 0/3] Add a "Library Functions" section to the ref-manual
Date: Tue, 24 Nov 2026 14:17:53 +0100
Message-Id: <20261124-oe-utils-docs-v1-0-5fafbf6cb01c@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0auEWTuQxGKoVxEXOk7bKSWRjIog3
 r2xXb7F/wcoZ2GF1hyQeROVFAtcZYBeQ3wyylQM3vrGOesxMa6LfBSnRIpj4wLfwnCviaA0c+a
 H7L9f1/+t6/hmWq4JnOcXMwtAOHEAAAA=
X-Change-ID: 20261102-oe-utils-docs-b617e47a93cc
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1311;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=HqhWLn08RDqK9WtKE5Gnf+0asDbjJoafj7B/GtR3BkQ=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBrBY6DRAxf7Tr4VzsBhSupqHxHCnRZimg/yxFgK
 n9qRzsxZZCJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCawWOgwAKCRDRgEFAKaOo
 NmmkD/sFo9rQBoGQ7H3T6YQkVimiTJ5ebhi1swLQWOo10Z4pKQ8M5hK5W5vjczAFvqbIH9TIWcc
 GpGORjjlElxEM1W/oKTF+xSc31xTGFMNTHVZw6ZXeiSlxGEo3Cnmmarw9O46fHz0cwg1r8llcpJ
 gaKDKi9do7l1NUmEwEjBTWutesmL6MLTL0CS9Xd7kcT2sQZLBKGYvPdZ1ui2Y5DDS2JMtauIRCj
 ubVAvz1fI14gHjB09QyA9PO65gV7M9UjcIP8oSLR15GcKLZHMf4GI9rEdD96DcQyRHkyLXxsLMi
 qhoBBfrPPVDW1rNioxZDsY0yUbedvMjQ7IaSYR+ZBJw4dXoI7gPkkVBUzm+bWLy2yT3Y3i/JDi9
 wv6Pbix7PDtaXZ/O7iPK8RhXtvJOENj9fBIX6PY8seQCenLlfgh6TWeMTMiFGDjo0gCLwGFKPvF
 rz0tQiL3331hw+oNla2Js0qPiNviOGNVbr5zRxZWzSisy2raVRiTIgTRjPnojSAaPjq9sglwdtP
 jEWFvhIdYu8XQKcu0UVgt6KtW6j+CnlESRiQ5AJsOt7OX13kNzfUoLQa+Z5qX4794ErT8/n3CTc
 rjhtiaqJDKpFlqZlno43UDs0Sq6pBkWqI9DsZp6c3/PecuFIIynko+abecSo+3VXZLlXJb4Vyf9
 AmN5XQvV4QV3YIg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Tue, 24 Nov 2026 13:18:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10831

This series adds Sphinx documentation for the oe library. This series
depends on two others:

- one for openembedded-core, to improve and format docstrings:
  https://lore.kernel.org/r/20261116-oe-lib-docstrings-v1-0-0c894f6a1064@bootlin.com (merged)

- two for the autobuilder, to clone bitbake and oe-core before building
  the docs (yocto-autobuilder2 and yocto-autobuilder-helper):
  https://lore.kernel.org/r/20261120-run-docs-build-with-oecore-v1-1-75124e549421@bootlin.com (merged)
  https://lore.kernel.org/r/20261124-docs-build-oecore-functions-v1-0-ce9f3c4fbad4@bootlin.com (sent)

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (3):
      conf.py: enable sphinx.ext.autodoc
      ref-manual/terms.rst: add the Datastore definition
      ref-manual: add a Library Functions section

 documentation/README                           | 21 ++++++++
 documentation/conf.py                          | 33 ++++++++++++
 documentation/ref-manual/index.rst             |  1 +
 documentation/ref-manual/library-functions.rst | 72 ++++++++++++++++++++++++++
 documentation/ref-manual/terms.rst             |  3 ++
 5 files changed, 130 insertions(+)
---
base-commit: 1ced0db0c39bb85213a3c20dd32158430944ea4e
change-id: 20261102-oe-utils-docs-b617e47a93cc


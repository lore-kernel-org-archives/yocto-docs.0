Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD725C43327
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 14:46:29 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.93797.1782744380726010477
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Jun 2026 07:46:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=IA+lw8dS;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A1D131A0D1D
	for <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 14:46:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 76E675FF96
	for <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 14:46:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0591A106F1841;
	Mon, 29 Jun 2026 16:46:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782744378; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=emmGEipsZp+cxNYyDjkO0ob0kMXOgfGhIdCZkqbWJRg=;
	b=IA+lw8dS5rbRv4H2zkXQQ+fsynKnhxXamtsV3sSSaBB+g7DdHvYLgduijas7TvnZaWM6uS
	dqY9VwqX5x/1C1JxcjamOzNObVcEw+1tFnDrq9SvH4qIdC7/E2rotO+PdYoy7zop4rrHGT
	5h16igP3Xo8+KL/FzmMuIA4FlwNLn3jjHPoGA1g/0ZFiekOXFbdrd1CaXbcCOHEGKHDXbC
	nPevhf+fEgEg5ZwsnGI9Nf8pi7fyEhy8oENAYQ3rb1lFpHkeBkzcGseYxIVFSOMm4306w5
	J6XU+M0V86PPMNSitd4HkhunM7KqlHq6HKl9kAMxctMbFtPxE5dh9z9KwZ/pDQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 0/7] Cover recent upstream changes
Date: Mon, 29 Jun 2026 16:46:09 +0200
Message-Id: <20260629-master-updates-1-v1-0-ad9b047f9ff0@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBG4avIrDsQgwnYq5QuYvJXp1ArmSiCe
 Pem7fJbvHeQIguUrs1BGZuovOeK9tJQnMI8giVVkzXWG289v4IWZF6XFAqUW0bvTOo6F11vqGZ
 LxkP23/J2/1vX4YlYvh86zw/ca4hDdAAAAA==
X-Change-ID: 20260626-master-updates-1-e950d445c590
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1033;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=s5H9CNBo7Jq9sZoIv0lwcL4qxhGuB3Pa0dbCMun1qYQ=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqQoU2QyEQc+UzbHs+EcXGt01xIynldX5fIofWA
 GdRDtfrefqJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCakKFNgAKCRDRgEFAKaOo
 Nu/SEADLT+1lgXZetpM8tlVNAk8UD9kUZO6INxcxu4atcxBi6P9cWXAVMzeAECSNSh+mOoKLBIv
 VtOY46HI+1sVDKwHXjmChdHM5LYGv9DXEehXPIoEwdhTIlY3C10vtTMECAnEEfELj2DRJLv03Fb
 eX03TQA5zyOyLEEIbOGty08GYLY29k5YLWEerNWeXHiCabJNPunwAmLIAE42a2XLrcsylwvrkNP
 VvRj+KNcuMAGJBokw62pqiP09CD7X/5WTKNjOBAwjsGn9E/7nllbZK9g7fzP02v575lfc6DHire
 EMeYSogGJUhmHMXqSY/5NvHfqiSNhxdfR88jDutydpBuC99id7VArTrpwf6bJ98Q7nRbYxNOaaA
 u4eh/tfTooOuDWEub7G+s+jgqqUUjhokfu9k5HBUp/RlcLCjB3jGjLyV/tFiRMvnpsuOPXX/egJ
 q4VneKiggLbnA2AtmN7/rfIXjONjmEKBOhcDg+hmxMb971mql2KQfGuq2FMtdOcJBDNugjEgf1w
 EooF+Yd10Lu68F/0uwdTBBu5ybXywzbaauLPqbgd2bSr7AnHYXSj4a3kJIYAY6Sk3jqoy/Ed7Ur
 c5fRi+Ma2KhU9N4DjiG0wzYZToAv9mbWcxYSUb8c8iKHLl+Wx4lqxdkkY6Op9iFx1DB28PBS8Ls
 hYuNWGDAsz7XfiQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 14:46:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9973

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (7):
      ref-manual/variables.rst: document the USERMOD_PARAMS variable
      migration-guides/migration-6.1.rst: add USERMOD_PARAMS note
      ref-manual/variables.rst: add deprecation note for GROUPMEMS_PARAM
      ref-manual/classes.rst: document python_uv_build
      migration-guides/migration-6.1.rst: add note on oe.utils.*_distro_features() removal
      ref-manual/variables.rst: document the UBOOT_FIT_CONF_DESC variable
      migration-guides/migration/release-notes-6.1.rst: cover recent changes

 documentation/migration-guides/migration-6.1.rst   |  48 +++++
 .../migration-guides/release-notes-6.1.rst         | 221 ++++++++++++++++++++-
 documentation/ref-manual/classes.rst               |   9 +
 documentation/ref-manual/variables.rst             |  21 +-
 4 files changed, 291 insertions(+), 8 deletions(-)
---
base-commit: 4562ba19f36e54099bcae82cec8a70deb1c23aa7
change-id: 20260626-master-updates-1-e950d445c590



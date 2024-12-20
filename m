Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68B4DE77195
	for <webhook@archiver.kernel.org>; Fri, 20 Dec 2024 12:17:12 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.150878.1734697026728674865
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Dec 2024 04:17:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=TyaOPt0Y;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4C3BF4000F;
	Fri, 20 Dec 2024 12:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734697025;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ylnKYxbMtYbSNvefcxz0Sdp6+/raWDtlChIAeffX3EA=;
	b=TyaOPt0Ykfg6wdhjdgMmxTrHWXsf3Z2EZrIkbzE4UblyelQslQ5RwuZ+VE+uJNB+navbNe
	hL8hy5D+rqfDnPKDy+Y32x3KwvN1kcecF3LLEsU8s30qnD7tvBKkEn489eAwCMtap6R7cE
	sHSjfURmr9pu594T3PI0o03Ji76Mr9fsyrDJVMENT+sEC6gzRjNlhj4tdewtKFgIIauDfZ
	+c6oKTx6kurFnbzqfI6vu91imtR3MwXqhMrSE2WDQMQ7RiG8tGqEEbWoKVnASAqAuB2vdi
	2RQ3rrulte8JJQQ2NYu3ul0PZDsum7i9TFP/DxpsdjRHaieop5fetnB8z6h2Zw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 20 Dec 2024 13:16:33 +0100
Subject: [yocto-docs PATCH v2 06/14] ref-manual/variable: remove obsolete
 SETUPTOOLS_INSTALL_ARGS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-release-note-5-2-updates-v2-6-df29527f3fc5@bootlin.com>
References: <20241220-release-note-5-2-updates-v2-0-df29527f3fc5@bootlin.com>
In-Reply-To: <20241220-release-note-5-2-updates-v2-0-df29527f3fc5@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1351;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=sjT6lOgMLLEugdZzwyiZkACn7Uae2HbzJz9uo0CKBgo=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnZWA+F0QouRhPyZp4CPJu3JkSHn9j2TIgAik1w
 QIIsMVmZ/WJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ2VgPgAKCRDRgEFAKaOo
 NoGZEACQkzVEyDhI7u5LUV7sGlIG8h149tm7ndWfjaTXeeAgh/rLyXyuhDX+KxU7nhsqH9L5tUO
 ltK6ymCJASOdkq6xtX2NVS+YKqBHDPrbHpk6BkDqm0pEg5mVuk60A2j1LzAEcpMse7B7Febbtkz
 Be6lARj9Es66jso3zx3mJMrfx/pkHyq/NsWpMh4t+9iV2imJHpDAowwt1p2IRLwBaBLZjxLbDaO
 bR9reVrVI1ljjVCTYRyo9qo7Ut9CBAl5i1zL8SQKiPoyUmJfyrwyUG0vOpvJi2SyqwWiGvpkItj
 Ih5o94SuYS0KFZhAC/45Atcwju4H2vktm2jIYrBAnW9LE4bnbc+5Fm1Ao1NRbxw03AU2FiIu5BK
 DbuIW2vZ0H9Jz3a83rlUAFfzah+0Npj3X+DHdbbfgfzey0kDSEazb/KRJz4d31EzS7EVEvBhjaO
 b/KPVgntQRrp4dBaITbsc2SJl7Opz1uU/vzpwqQTdb3KHDRE5EcAcq1Q28R0WMJMhcxSBNtlDmd
 EqARvoE8taCYU+dHlT7yR5LPsvYzdwwMSxWPJjzZz0n10VZWoWSvriQz+1/bdbgWBfUHzcqa9EE
 LanH8fFpOkq6H9zPi0xV7SHy+9plsuB7WcdU9I/NWMlz4wETHsqDeR2dxUKL0ALGze7oWWCiZnT
 D68q4OP4LJ/pYFw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 Dec 2024 12:17:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6004

Remove in oecore by commit b4bdfc78e8e1cb8b86221bc55d80d601ea1a065f
("python3-cython: remove obsolete SETUPTOOLS_INSTALL_ARGS").

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 40f2f7c99aa9d3ec9b9f8fc5799dcad385ef1dc5..89c37729bdfcbb2b041698d523399da3b5bc2af0 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7843,11 +7843,6 @@ system and gives an overview of their function and contents.
       class, this variable can be used to specify additional arguments to be
       passed to ``setup.py build`` in the ``setuptools3_do_compile()`` task.
 
-   :term:`SETUPTOOLS_INSTALL_ARGS`
-      When used by recipes that inherit the :ref:`ref-classes-setuptools3`
-      class, this variable can be used to specify additional arguments to be
-      passed to ``setup.py install`` in the ``setuptools3_do_install()`` task.
-
    :term:`SETUPTOOLS_SETUP_PATH`
       When used by recipes that inherit the :ref:`ref-classes-setuptools3`
       class, this variable should be used to specify the directory in which

-- 
2.47.1



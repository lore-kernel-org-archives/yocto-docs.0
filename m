Return-Path: <patrick.vogelaar.dev@mailbox.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A505EECD9A6
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 21:19:13 +0000 (UTC)
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31663.1770326352690952835
 for <docs@lists.yoctoproject.org>;
 Thu, 05 Feb 2026 13:19:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@mailbox.org header.s=mail20150812 header.b=Pd9WTsky;
 dkim=fail reason="dkim: body hash did not verify" header.i=@mailbox.org header.s=mail20150812 header.b=nYoIFWky;
 spf=pass (domain: mailbox.org, ip: 80.241.56.171, mailfrom: patrick.vogelaar.dev@mailbox.org)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4f6VTV1pbYz9tYX;
	Thu,  5 Feb 2026 22:19:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1770326350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=p5KxX0gkZ3oTbfsukpU+pJXea0pFNOBfhzC49BUOFP4=;
	b=Pd9WTskypKaB6AXUO7rOuBWeQTczQvFEZTyVvzlhbn2GT+Fs/78iYlMLkQUqsQU+2ARErP
	+WoORS3bxN6hhdb7N8UVogOaXxBaoUQB+vySMB2xx+ak1aKZAGoDdZQx4hEj7TwTyFnRpE
	TiJaz9PGiJfLVIFIZ9bI9KcvyKdaHPTXwUsCyARNq2MGN7EJjkxJ15TzerqhEwTG2gTU70
	QmvBQJxR+9v/F21MBcR9dSsSzdtjLEpO9UOe+wEYraIBfiFN04kPbAvqfPEZEOZhYykYCX
	/p5FRbP0it2HU/aQT+umRf3T2FtBEB15PlMVywrlKR0ONpS+jX8tfGW4Q2leRQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=nYoIFWky;
	spf=pass (outgoing_mbo_mout: domain of patrick.vogelaar.dev@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=patrick.vogelaar.dev@mailbox.org
From: Patrick Vogelaar <patrick.vogelaar.dev@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1770326348;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=p5KxX0gkZ3oTbfsukpU+pJXea0pFNOBfhzC49BUOFP4=;
	b=nYoIFWkyiFs2gQatv9vUjFgp7nEeNNzDg+JSFVcufG5e4iMJ33uG9LRMEstyeTZBSoOL0O
	bvGaioGr1QadHvbevgrWfFtlS/ieer910EREMvk1Rt6eycsVhIIu45uFrFqArXKF6ptMpL
	lzxwTGxj/LQKXwQM4R+HnT83v9NpB/biKUW6qqizCuFAAMZFXAQ7iIWZfyo/PgZWERHUL3
	9ajqJigiL3d2paog5loeAxGftXHZ3Ceva7Qubntu13SLIJmNAuVAoz/AWyau94KFFgRCxg
	FTcqW0WGnWBJBd8qIfKNzjRs9BfA4lNOVbZoAjB/sKJctsaosHeL98yKRmlVnA==
To: docs@lists.yoctoproject.org
Cc: antonin.godard@bootlin.com,
	paul@pbarker.dev,
	Patrick Vogelaar <patrick.vogelaar.dev@mailbox.org>
Subject: [PATCH] document the OPENSSH_HOST_KEY_DIR and OPENSSH_HOST_KEY_DIR_READONLY_CONFIG variable
Date: Thu,  5 Feb 2026 22:18:34 +0100
Message-ID: <20260205211834.12440-1-patrick.vogelaar.dev@mailbox.org>
MIME-Version: 1.0
X-MBO-RS-ID: 61a297cc80e2f742c30
X-MBO-RS-META: yg9bk7t34xjibp53qy3xbcijt53n8q3z
X-Rspamd-Queue-Id: 4f6VTV1pbYz9tYX
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 05 Feb 2026 21:19:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8870

Added by commit addd80ddfd89 ("openssh: add variable for key path") in OE=
-Core.

Signed-off-by: Patrick Vogelaar <patrick.vogelaar.dev@mailbox.org>
---
 documentation/migration-guides/release-notes-6.0.rst | 8 ++++++++
 documentation/ref-manual/variables.rst               | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/documentation/migration-guides/release-notes-6.0.rst b/docum=
entation/migration-guides/release-notes-6.0.rst
index 13ce28b3b..c6e5b5a1f 100644
--- a/documentation/migration-guides/release-notes-6.0.rst
+++ b/documentation/migration-guides/release-notes-6.0.rst
@@ -23,6 +23,14 @@ New Features / Enhancements in |yocto-ver|
=20
 -  New variables:
=20
+   - The :term:`OPENSSH_HOST_KEY_DIR_READONLY_CONFIG` variable can be us=
ed to
+     specify the directory where OpenSSH host keys are stored when the d=
evice
+     uses a read-only filesystem. The default value is ``/var/run/ssh``.
+
+   - The :term:`OPENSSH_HOST_KEY_DIR` variable can be used to specify th=
e
+     directory where OpenSSH host keys are stored. The default value is
+     ``/etc/ssh``.
+
 -  Kernel-related changes:
=20
 -  New core recipes:
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
index 4d8a35473..00fbc52a6 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -6481,6 +6481,14 @@ system and gives an overview of their function and=
 contents.
       default by setting the variable in a custom distribution
       configuration file.
=20
+   :term:`OPENSSH_HOST_KEY_DIR`
+      Specifies the directory where OpenSSH host keys are stored. Defaul=
t
+      is ``/etc/ssh``.
+
+   :term:`OPENSSH_HOST_KEY_DIR_READONLY_CONFIG`
+      Specifies the directory where OpenSSH host keys are stored when th=
e
+      device uses a read-only filesystem. Default is ``/var/run/ssh``.
+
    :term:`OPKG_MAKE_INDEX_EXTRA_PARAMS`
       Specifies extra parameters for the ``opkg-make-index`` command.
=20
--=20
2.43.0



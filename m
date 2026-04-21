Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 591F2F8FA7E
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 13:44:55 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30122.1776779093641382677
 for <docs@lists.yoctoproject.org>;
 Tue, 21 Apr 2026 06:44:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=uLNKscJ5;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BDFA34E42A8B;
	Tue, 21 Apr 2026 13:44:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 957EA600D2;
	Tue, 21 Apr 2026 13:44:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D60E610460AD7;
	Tue, 21 Apr 2026 15:44:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776779091; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=y0jbpyq4yGY/mEJMwS+Qjy8k0YxynDSMDUJLXN9k/TQ=;
	b=uLNKscJ5KOt0LUaVMXH60AcSnicPxwKOQGUsjoz0dkqludqCgL82V4IkGEcK5AvvkSbvnc
	w2/f30dl8qQv8VsZ8CcV0nCENpgWCTFyagzW0Kw9dK56xRk6c6Hh04xjbipzpgw6qygjO+
	eWA9VH6iCs5Cx0D/P34v15bxgTvdzzSbWJn+eGDU9kzlKCLFAP2zZ9Um0GFA0jn6Eqohtb
	m5BXjq+HSO5F8FwTSbJVrxUHV9OgFp11bx/fQ6gc+csTKjcvK8A2eqrbTakWg8gGgqaqFa
	PAu9v+HJpbEGIS1ZLe3Lq3hm7/mBCyONaLgokzdsu0Oe0tEW6ff6wG3BlD8Qag==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Apr 2026 15:44:50 +0200
Message-Id: <DHYVMDVLY9WW.AV2EUZCNM0IE@bootlin.com>
Cc: <docs@lists.yoctoproject.org>, "Yoann Congal" <yoann.congal@smile.fr>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>
Subject: [scarthgap] Pull request
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 21 Apr 2026 13:44:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9297

The following changes since commit 48d15a62ed7c004fd6e1dced03923bac529c435e=
:

  ref-manual/variables.rst: correct a reference to STAGING_DIR* (2026-04-16=
 14:34:21 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs scarthgap-next

for you to fetch changes up to 2c80b891d85e0a7d9b70fc7b4a9c032325b56eca:

  variables.rst: expand explanation of RSUGGESTS (2026-04-21 15:17:53 +0200=
)

----------------------------------------------------------------
Antonin Godard (1):
      sphinx-static/theme_overrides.css: switch to a fixed width documentat=
ion

Lee Chee Yang (1):
      migration-guide: add release notes for 5.0.17

Robert P. J. Day (1):
      variables.rst: expand explanation of RSUGGESTS

 documentation/migration-guides/release-5.0.rst     |   1 +
 .../migration-guides/release-notes-5.0.17.rst      | 263 +++++++++++++++++=
++++
 documentation/ref-manual/variables.rst             |   8 +-
 documentation/sphinx-static/theme_overrides.css    |  17 +-
 4 files changed, 282 insertions(+), 7 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-5.0.17.rst


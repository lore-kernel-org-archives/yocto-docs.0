Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 656BAC433F5
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 15:09:17 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web10.8781.1645628956331711224
 for <docs@lists.yoctoproject.org>;
 Wed, 23 Feb 2022 07:09:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=lWKXtrm0;
 spf=pass (domain: bootlin.com, ip: 217.70.178.232,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 05E1D20000E;
	Wed, 23 Feb 2022 15:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1645628954;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V/QUX5gEc0k6tG4uKGjr3V6Fd4i7Lhc6PiaWdmI4O5k=;
	b=lWKXtrm0E0On3NUlq1WH7XnEQPrvN4ATkW8xHaIUEJEhxi8TL0N3bwBZU5D00y03ZuByht
	V+te4FqaRxuRXjpoJvXJl9rvOBq3FSH2VvOrUQjDWgi4tn8tPlIpcTm2ENw/h53NWDAhI+
	zKYWIac86ThM0/PHQ9rcmoWgDrpZMrqeFWAwN/JTJ6/tLn8KZfzzEc8ckmWk7QM0E14QCe
	I2r83RSF6etIxRlIZjSmWMWQCIso1Uri3EI5TcFu52hmgf3OeH/W0/xdPI47EtUVLrhZHU
	17ikhXOVECogxZYplGtSqGK7YFw7aGJR0Vt418IA87E+GteuCoE6aHNwrJzE5Q==
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH V2 0/2] Update release notes
Date: Wed, 23 Feb 2022 16:09:06 +0100
Message-Id: <20220223150908.126292-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <16D63041DFAB6A54.5439@lists.yoctoproject.org>
References: <16D63041DFAB6A54.5439@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 23 Feb 2022 15:09:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2496

Changes since V1:
- Rebase against changes in master-next
  introducing macros such as :oe_git:

Michael Opdenacker (2):
  documentation: individual release note files
  documentation: release notes for 3.4.2

 .../migration-guides/migration-3.4.rst        | 1055 +----------------
 .../migration-guides/release-notes-3.4.1.rst  |  252 ++++
 .../migration-guides/release-notes-3.4.2.rst  |  240 ++++
 .../migration-guides/release-notes-3.4.rst    |  800 +++++++++++++
 4 files changed, 1295 insertions(+), 1052 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-3.4.1.rst
 create mode 100644 documentation/migration-guides/release-notes-3.4.2.rst
 create mode 100644 documentation/migration-guides/release-notes-3.4.rst

-- 
2.25.1



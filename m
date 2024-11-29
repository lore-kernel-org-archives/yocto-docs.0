Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49A83D6EBE6
	for <webhook@archiver.kernel.org>; Fri, 29 Nov 2024 08:08:03 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.111208.1732867679467118817
 for <docs@lists.yoctoproject.org>;
 Fri, 29 Nov 2024 00:07:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=L5NF2ojC;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5C49A1BF204;
	Fri, 29 Nov 2024 08:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732867677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=c07AqdpuoKOx5bYEK8187fZd0gGN014vi21+YBdn+Q0=;
	b=L5NF2ojCCU2743BIFZP4TxBdnfAVOwh+oaIdGKFdeTvHIZgiGkcyDsR6pktb3wZtBUhU9C
	xWU7mHkKAbFCJ9QDiUoom/cOdcDTneufdeqiWTFBuZQT4mjkxjoZKrR4YMQHzWnCp9WbiF
	5xrkvxLB7b5fWvPYf5SZGqUrS8xOLa434E3pyt5Zu3+EnwloyiUXRNvv6GzQsXoMi+5gdR
	iwY+mmOvfwFDIuDf8I3MZsyeB76biNJ+WPOgRncQ6sfmsEWhxQzkbhEoeOfRe6jNxppfP+
	mhBcy+dMVVkRE7dt+1lW03QNNfANdI9X0fh06KaMsgLRUvUMJvfXWFI4f2rOuA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 29 Nov 2024 09:07:57 +0100
Message-Id: <D5YIBOZLSWSP.PGKJENT7M9BK@bootlin.com>
Subject: [scarthgap] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 29 Nov 2024 08:08:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5846

The following changes since commit cafa551d0927f56854f823e51f3de690f17423cd=
:

  dev-manual: bblock: use warning block instead of attention (2024-11-15 08=
:14:44 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs scarthgap-next

for you to fetch changes up to 12d0ba4f496b2b28a188d34fc36e36895f397079:

  migration-guides: add release notes for 4.0.23 (2024-11-29 09:03:30 +0100=
)

----------------------------------------------------------------
Antonin Godard (2):
      standards.md: add a section on admonitions
      ref-manual: classes: fix bin_package description

Lee Chee Yang (2):
      migration-guides: add release notes for 5.0.5
      migration-guides: add release notes for 4.0.23

 documentation/migration-guides/release-4.0.rst     |   1 +
 documentation/migration-guides/release-5.0.rst     |   1 +
 .../migration-guides/release-notes-4.0.23.rst      | 209 +++++++++++++++++=
++
 .../migration-guides/release-notes-5.0.5.rst       | 227 +++++++++++++++++=
++++
 documentation/ref-manual/classes.rst               |  45 ++--
 documentation/standards.md                         |  15 ++
 6 files changed, 481 insertions(+), 17 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-4.0.23.rst
 create mode 100644 documentation/migration-guides/release-notes-5.0.5.rst


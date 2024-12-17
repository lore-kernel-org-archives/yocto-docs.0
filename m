Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA68AE77188
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 09:27:16 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.77897.1734427635407625234
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Dec 2024 01:27:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=n+cm4t2y;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 509431C0002;
	Tue, 17 Dec 2024 09:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734427633;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=M9nnCe5jPfwC9+hXjzF/cdQBfWbVD/H3VYoIW+NTwxE=;
	b=n+cm4t2y3LDIvZ8BOVz5ptC5pBbbXsOoDsXBQMxY8RDKVUqiu2V9Yihnd9KAdga0GjFHPD
	dKzGjqpLEXwiIC6zqSG9CTRVmLayZUvhtVO/fjlI5MBezL1AV4GvKM7t6snbrG+AWgn1KH
	B+7HfJJ2r44QffnrH0poyqCB8PlziMxjMp3+zGkKTd0IbqYEf3jnNt6vVOU2eo0K6TNRE6
	s7n23p3y/5AAlk+VmJkYaNaJD/Rzn/XaH1YQD4uhFQY3zLmb7OhilENjKuyXtpu0/SeWeb
	tCre+YXaEpzVApVclUMWCBxNhkh0lbQoRuOqEhTb/ZBYABVOqpJvG21YdHj/kg==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [yocto-docs PATCH 00/14] Updates from recent core changes
Date: Tue, 17 Dec 2024 10:26:59 +0100
Message-Id: <20241217-release-note-5-2-updates-v1-0-b189493b1b09@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAORDYWcC/x3MSwqDQBBF0a1IjVNgNRFDtiIO+vM0BaGVLiMBc
 e82Ds/g3oMMRWH0bg4q2NV0yRXyaCh+fJ7BmqrJte4pToQLvvAGzssG7tjxb01+g3ErXUxxCqF
 PL6r5WjDp/14P43leZZKXmmoAAAA=
X-Change-ID: 20241211-release-note-5-2-updates-015cdcfbb7d8
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2358;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=3haiuVj9knktt/aNDZGcnq2EgR4+aF8tlzvfj1xWhDY=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnYUPvDFhE4p0qmyElTmA/5aKpwJn8qRK/h7THT
 knmJ8BdVMiJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ2FD7wAKCRDRgEFAKaOo
 NuAXD/4j/k5dm5fzwdtGn1x/qKvqsPn4bO+halB5i0ueNarIcSpcjeW0oO9pa+unnYlTW1Ydr0T
 uNlqm/lOsD4Y7mtjVqYCZxsL3hwieaxHsMRvJvVpy0NbMXkyeneZKZmVmb3n0QnRGqFqGmGvxFU
 l+tDzzsKIxgI9/hywVh1NJrR8cg5yYpcqq4I/SxpV2kiJ2yV7y/yylZW+CUu+qJvH/i39FXF7Bs
 iHvmujefagNUx1B8hpmHDEpP/viVYjTUSkxZF4m55jQV0kbxN24jG/Vr0w5lBaqc/s6PyYcv1wF
 FJvPMFV2F6CSWMfwDC6aMW/gvLNbmAtB3ycgXX3owp6Hn2+Z+dHqsVZn1gBD28X+IY64UaXyVoy
 MBBxeypQZilAq3rBftDS1kpS0BUa5udoLLQ/tFGCsnlJPlblZgp3cSS1Q6uuLhHts8JiYQQPqsq
 BYOOlZdIw/FpDYaw0ZZQw1nhLJ5wmUzB1P4vbg4qwVmd0siUNgZS+ew7hn4PG+tzYuGENV44DUK
 8ztmur8LS6ckGQUykNbEiGs8Fr6n4AH7hi1ns8Bc8JdYekmIBW/fhg9q58CMteAuz0KqKdEVkn2
 uN/WQhV7N8WsFFmgQeZvuktZdu/n2A7M3N/bn1gckn0Jlpsk36fT1N+RPHHtA50Or/lvx0/qN3s
 o+kjELzw9Jz5Ixw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Dec 2024 09:27:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5936

This series updates the documentation for the changes applied to master
in openembedded-core, bitbake, meta-poky and the docs itself.

First part of the series are documentation updates (new/removed
features), while the last commit update the release note/migration
guide only.

Precisely, this represents changes between 8149e74258 and 87d7341465 in
poky.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (14):
      ref-manual/variables: document the KERNEL_CONSOLE variable
      ref-manual/classes: drop the migrate_localcount class
      ref-manual/variables: document the FIRMWARE_COMPRESSION variable
      ref-manual/variables: add missing entries to SDK_ARCHIVE_TYPE
      ref-manual/variables: document the WIC_SECTOR_SIZE variable
      ref-manual/variable: remove obsolete SETUPTOOLS_INSTALL_ARGS
      ref-manual/classes: document the cython class
      Remove debug-tweaks references
      Drop support for BB_DANGLINGAPPENDS_WARNONLY
      ref-manual/variables: document the CHECKLAYER_REQUIRED_TESTS variable
      ref-manual/classes: document the yocto-check-layer class
      ref-manual/variables: document the CARGO_INSTALL_LIBRARIES variable
      ref-manual/variables: document the PREFERRED_RPROVIDER variable
      migration-guides: update the release notes for 5.2

 documentation/dev-manual/build-quality.rst         |   2 +-
 documentation/dev-manual/customizing-images.rst    |   3 +-
 documentation/dev-manual/layers.rst                |  15 +-
 documentation/dev-manual/securing-images.rst       |  12 +-
 documentation/migration-guides/migration-5.2.rst   |  50 +++
 .../migration-guides/release-notes-5.2.rst         | 345 ++++++++++++++++++++-
 documentation/profile-manual/intro.rst             |   4 +-
 documentation/profile-manual/usage.rst             |   2 +-
 documentation/ref-manual/classes.rst               |  39 ++-
 documentation/ref-manual/features.rst              |  19 +-
 documentation/ref-manual/variables.rst             |  94 ++++--
 documentation/sdk-manual/extensible.rst            |   5 +-
 12 files changed, 522 insertions(+), 68 deletions(-)
---
base-commit: 02c090718ac602f7d4760dd28dadbf0631668d49
change-id: 20241211-release-note-5-2-updates-015cdcfbb7d8

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>



Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F9D0E7719A
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 16:00:42 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.22836.1736352040512517098
 for <docs@lists.yoctoproject.org>;
 Wed, 08 Jan 2025 08:00:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=goimy4va;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8E5B01BF20E;
	Wed,  8 Jan 2025 16:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736352038;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sDFH8w+VKGRChALHWVYVENkB0Xud8LqeliKZb8/vC3M=;
	b=goimy4vaikYQtZ4i7YcZOusQbYn6zM6Fb9BPTgwEZt8g6Hpf4WIDzYbwixE7z32988z6sT
	FgKE/KqnHM6QOH+CntpVSXuQJOLq+0p4ukGpw00OcSpxhfg+y683yvZuggq2g2FBslUwrq
	aFKyaGHdI+3wp373oiftJOUDafEE4PjkigwKa/ewzLsgMcvAt7zTdXEOMxyGCZK/7OBDph
	riwQQZdY/boikocMebLYjB7pDnOqTr4XSxXk7iQAR2imHQsj51KaFxoEPpTz0kV8vASp5+
	uAyICA6KeKKr138+mEurZytKC9l+I0KzhQMtlqJiCah/M1Q/Nd+UxMRRiclqFQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Jan 2025 17:00:38 +0100
Message-Id: <D6WTFEFYPWU5.E36J5430SPDM@bootlin.com>
Subject: [scarthgap] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 08 Jan 2025 16:00:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6070

The following changes since commit 6430ed0572ca5a6e10629aa27a05d4b262e87548=
:

  reproducible-builds.rst: show how to build a single package (2024-12-27 1=
4:22:35 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs scarthgap-next

for you to fetch changes up to 79aa34db34def525a11c41d951365bcb891318c4:

  ref-manual: move runtime-testing section to the test-manual (2025-01-08 1=
1:42:43 +0100)

----------------------------------------------------------------
Antonin Godard (6):
      ref-manual/qa-checks: remove patch-status-core/patch-status-noncore
      contributor-guide/submit-changes.rst: suggest to remove the git signa=
ture
      ref-manual/devtool-reference: add warning note on deploy-target and s=
hared objects
      SSTATE_MIRRORS/SOURCE_MIRROR_URL: add instructions for mirror authent=
ication
      ref-manual/packages: move ptest section to the test-manual
      ref-manual: move runtime-testing section to the test-manual

 documentation/contributor-guide/submit-changes.rst |   7 ++
 documentation/dev-manual/index.rst                 |   1 -
 documentation/dev-manual/packages.rst              | 112 +----------------=
---
 documentation/migration-guides/migration-1.5.rst   |   4 +-
 documentation/migration-guides/migration-1.6.rst   |   2 +-
 documentation/ref-manual/classes.rst               |   8 +-
 documentation/ref-manual/devtool-reference.rst     |  20 ++++
 documentation/ref-manual/features.rst              |   2 +-
 documentation/ref-manual/images.rst                |   4 +-
 documentation/ref-manual/qa-checks.rst             |  10 +-
 documentation/ref-manual/release-process.rst       |   6 +-
 documentation/ref-manual/tasks.rst                 |   8 +-
 documentation/ref-manual/variables.rst             |  75 ++++++++++++--
 documentation/test-manual/index.rst                |   2 +
 documentation/test-manual/intro.rst                |   6 +-
 documentation/test-manual/ptest.rst                | 114 +++++++++++++++++=
++++
 .../runtime-testing.rst                            |   5 +-
 17 files changed, 237 insertions(+), 149 deletions(-)
 create mode 100644 documentation/test-manual/ptest.rst
 rename documentation/{dev-manual =3D> test-manual}/runtime-testing.rst (99=
%)


Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 714C6C3DA4A
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 16:00:42 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.22833.1736352038347417441
 for <docs@lists.yoctoproject.org>;
 Wed, 08 Jan 2025 08:00:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=e9fyMWB0;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DA50320007;
	Wed,  8 Jan 2025 16:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736352037;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wAtfVrWw/xepVfBGI+EwBOo8IoaLztCatb4Bv8LCuzU=;
	b=e9fyMWB0O/gh0YL2bSkWMq0SxfgbpQZJyojUfAKH786scIBqni2EkXnYmehPf/BgdT28k2
	CeeGeWt1m7FueCUHwb8AOfTSN0ZaS0jUfAODc4GpvLIIIDuJZLpDIPXLkfGiOlvpNvzg08
	j6hL+0Nt8FdjPQGZJHx0PsRQn67WWVRoJiFwk+0YYflnclbJLywjVGI/++C3WDL+RfY1ex
	y1+58sf4OftNzZAHwBrTRUkbmfhogiUHzJ43zSnv/1aLhYya8fx01X/ZTbLUjPmbAVxP9D
	BG8grh2ci0HO3iprXSX3HyVShwAM7tbJlyvPQ83pH7uTNVYIBIoVU1Pw2VtcHA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Jan 2025 17:00:36 +0100
Message-Id: <D6WTFDP3TDYZ.3IMT4FQLTB78L@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Subject: [master] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 08 Jan 2025 16:00:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6068

The following changes since commit a51a94f0b228d570d915dff36a49132e90e93cf1=
:

  migration-guides: update the release notes for 5.2 (2024-12-27 14:43:06 +=
0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs master-next

for you to fetch changes up to 6b44257874858db3aa426d3e84a79c41cb4937a3:

  ref-manual: move runtime-testing section to the test-manual (2025-01-08 1=
1:41:59 +0100)

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


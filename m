Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DB61E77199
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 16:00:42 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.23373.1736352040105429904
 for <docs@lists.yoctoproject.org>;
 Wed, 08 Jan 2025 08:00:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=PIUuKjR/;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9D989C000C;
	Wed,  8 Jan 2025 16:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736352037;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1bwQI3SVQo0yjKFQjnMEHgIAx9hLu60s/IZzHsNDPko=;
	b=PIUuKjR/rYJwDp3FvGAtyNgYH8217aDQH0M12KtLZtjmCxJO0TzYxjVarxLVfOxPK5Szq9
	PWpD80TLShBIjb+QXd0nsSLQszgPr5suVj5Jyzc+2MzsswB/q2spOhSloUmLY0hC5vVix2
	zKrfrDUbFmOHJstG8FXFKC1urrVJSUhc6LZaIjSFaj/qFdqPKoqZP1Hb2n9AfhxAFrDzy3
	VVEzRqN7N0e41CIvkmODjxtyIysu4VCHgj6QaPx3UPOzKnevURwL0hw8jSJ8xMH3+fRlS7
	sr0nwP7co7Pdu60Rdzzb/BVtCXbeVPBBftIDnr+/YDlbn5P60bPw/CW+cRhWtg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Jan 2025 17:00:37 +0100
Message-Id: <D6WTFDZSJCE2.22NZ62JOHYV5V@bootlin.com>
Subject: [styhead] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 08 Jan 2025 16:00:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6069

The following changes since commit 0c1ca2bd6de4cf98a91fbbec9524e08682739487=
:

  reproducible-builds.rst: show how to build a single package (2024-12-27 1=
4:22:30 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs styhead-next

for you to fetch changes up to 8ac3e2eb1dd4149b24af03666813dc6d94df466d:

  ref-manual: move runtime-testing section to the test-manual (2025-01-08 1=
1:42:20 +0100)

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


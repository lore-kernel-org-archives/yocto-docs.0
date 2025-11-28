Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 742CCD116E2
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 15:50:51 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19046.1764345048371613968
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Nov 2025 07:50:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=DGuRDPzt;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3A15AC16A3F;
	Fri, 28 Nov 2025 15:50:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2775460706;
	Fri, 28 Nov 2025 15:50:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1D60010B02075;
	Fri, 28 Nov 2025 16:50:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764345045; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=EUDFYeX8U4aOgRcPCkk7CHmrlxW3Lg7pb5Z4F3oOaLA=;
	b=DGuRDPztRMquQb7imCJkNosEWRESo85CkSlVl/NCeO4QPK7ZfQhKq6SAveKKoSkHbE1qj4
	ND9gXoU/MdZHpROkc8oMPa6s6UNvL9JwzKy9BJRkPjlVZYMDDxbiQDHrh0uRwZY6RmNCct
	/7blaZnE8CwBWLr/L7kT4ewwdtgQQGOkfOSYGrQTxVod0TRdnV2E0VLN8xXOuTgQtL3Ezt
	c4wILEoVSmX1/Tydde7yw42d7UZlWPuhqZ0hHQy/sHji0gBjLhAzdcrJ6PCBxA96AaBIgI
	+6pHgA1wCk61p5OF5Fscu+dd6kfW23hZVKRW/Z/5L1tIGP5T4pm3DSoOA8rNgg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 28 Nov 2025 16:50:44 +0100
Message-Id: <DEKG4BXEJJCR.SYDA7UM95GNE@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Subject: [master] Pull request
Cc: <docs@lists.yoctoproject.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 28 Nov 2025 15:50:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8173

Hi Richard,

These contains updates that should be merged for the upcoming Whinlatter
release. It is ok if they are included after the yocto-5.3 tag, as the defa=
ult
landing page of docs.yoctoproject.org will point to Whinlatter's branch tip=
.

The following changes since commit 79cd33b06e87c04e4f873a5afd9d53714bc5047f=
:

  migration-guides/migration,release-notes-5.3.rst: add poky master branch/=
bitbake-setup changes (2025-11-26 17:14:07 +0000)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs master-next

for you to fetch changes up to c9b19880d281be41660306f1f7456b9735c21487:

  migration-guides/release-notes-5.3.rst: latest changes from master (2025-=
11-28 16:35:20 +0100)

----------------------------------------------------------------
Antonin Godard (14):
      overview-manual/concepts.rst: update the cross-development toolchain =
section
      ref-manual/faq.rst: add Q&A on third-party vuln scanning tools
      poky.yaml.in: add DISTRO_RELEASE_SERIES
      brief-yoctoprojectqs/index.rst: update available bitbake-setup config=
urations
      brief-yoctoprojectqs/index.rst: switch shell block to to console/text=
 blocks
      dev-manual/limiting-resources.rst: update how to track pressure info
      ref-manual/tasks.rst: document the do_list_image_features task
      ref-manual/variables.rst: document WESTON_USER/WESTON_USER_HOME varia=
bles
      tools: add gen-cve-release-notes
      migration-guides/release-notes-5.3.rst: add fixed cve
      migration-guides/release-notes-5.3.rst: add recipe upgrades
      migration-guides/release-notes-5.3.rst: add license updates
      migration-guides/release-notes-5.3.rst: add contributors
      migration-guides/release-notes-5.3.rst: latest changes from master

Quentin Schulz (3):
      brief-yoctoprojectqs: specify what "recent Ubuntu Linux distribution"=
 is
      tools: ubuntu_docs: remove duplicate python3-saneyaml
      make sure Quick Build section and System Requirements are in sync

Stefano Tondo (1):
      ref-manual: Document SPDX 3.0.1 variables

 documentation/brief-yoctoprojectqs/index.rst       |   56 +-
 documentation/dev-manual/limiting-resources.rst    |   19 +-
 documentation/migration-guides/migration-5.3.rst   |   22 +-
 .../migration-guides/release-notes-5.3.rst         | 1449 ++++++++++++++++=
+++-
 documentation/overview-manual/concepts.rst         |  108 +-
 documentation/poky.yaml.in                         |    2 +
 documentation/ref-manual/faq.rst                   |   23 +
 documentation/ref-manual/system-requirements.rst   |   33 +-
 documentation/ref-manual/tasks.rst                 |    8 +
 .../ubuntu-debian-host-packages-nodocs.rst         |   33 +
 documentation/ref-manual/variables.rst             |   62 +-
 documentation/set_versions.py                      |    1 +
 documentation/tools/gen-cve-release-notes          |   67 +
 .../tools/host_packages_scripts/ubuntu_docs.sh     |    2 +-
 14 files changed, 1722 insertions(+), 163 deletions(-)
 create mode 100644 documentation/ref-manual/ubuntu-debian-host-packages-no=
docs.rst
 create mode 100755 documentation/tools/gen-cve-release-notes


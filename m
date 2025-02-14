Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84641C021A7
	for <webhook@archiver.kernel.org>; Fri, 14 Feb 2025 13:27:29 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.20807.1739539644404896356
 for <docs@lists.yoctoproject.org>;
 Fri, 14 Feb 2025 05:27:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=WmXlBMpc;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6E04B433B2;
	Fri, 14 Feb 2025 13:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739539642;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SPVtnTS+BEzHaWsq7R8buGYnJJUk3gW4Rc1hjDqyrfw=;
	b=WmXlBMpc84GKlCJ4gNo688CIG3jU9YmLFbVW/zek100a9sEqmbI3b5S4yp3sM53pcxK1V2
	OuMb/6YQ6Ag7MLcC/oAFzmTMQ29b30lT634VbIX1u5H8eE7RMcYo2FJPN2DHR6L0QOgZ8J
	fA2qPo6/m1/5vlnjPWCXCChbmzDvm1qF2A9YaT4Iqe8c2frGlun/q+4oZuimyxX+vvrdpx
	O0psmXb6vBjb0OvVm7rBq4H802d5feAFpPI3up9Q/2tpC1qnGO/tk474JFaiW9Z8JdkuZl
	cAJrZjwcmV4hwb81QUuxVLy3JDeJ8016rgoHKB4B3rZtb1F4majfEFacDOacig==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 14 Feb 2025 14:27:21 +0100
Message-Id: <D7S7C70TTM9T.103IRNYPIYWFW@bootlin.com>
Subject: [master] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegleejjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuvefhvfesthhqredttddtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeekhfevtefhudduheejvedtteffudehuedtgeehheehhfejvdeigeegudeuuddvtdenucffohhmrghinhephigrmhhlrdhinhdpfhgvughorhgrpgguohgtshdrshhhpdhophgvnhhsuhhsvggpughotghsrdhshhdpphhiphefpgguohgtshdrshhhpdhusghunhhtuhgpughotghspghpughfrdhshhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehrihgthhgrrhgurdhpuhhru
 ghivgeslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 14 Feb 2025 13:27:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6367

The following changes since commit 6eda443c7fcfeecebd6b44b96a1587c4bb093a34=
:

  migration-5.2: add virtual provider change (2025-02-07 17:52:43 +0000)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs master-next

for you to fetch changes up to 9f1f9f1a3a2a541ed70df72d4fe391b5b7fd3733:

  migration-guides: add release notes for 5.0.7 (2025-02-14 08:59:32 +0100)

----------------------------------------------------------------
Antonin Godard (2):
      contributor-guide/submit-changes: add policy on AI generated code
      Add favicon for the documentation html

Lee Chee Yang (1):
      migration-guides: add release notes for 5.0.7

Quentin Schulz (2):
      docs: use literalinclude for system requirements
      tools: add script for building documentation inside containers

 documentation/conf.py                              |   1 +
 documentation/contributor-guide/submit-changes.rst |  49 +++
 documentation/migration-guides/release-5.0.rst     |   2 +
 .../migration-guides/release-notes-5.0.7.rst       | 331 +++++++++++++++++=
++++
 documentation/poky.yaml.in                         | 234 ---------------
 documentation/ref-manual/system-requirements.rst   |  82 ++---
 documentation/sphinx-static/favicon.ico            | Bin 0 -> 1291 bytes
 documentation/tools/Containerfile.almalinux        |   1 +
 documentation/tools/Containerfile.apt              |  26 ++
 documentation/tools/Containerfile.debian           |   1 +
 documentation/tools/Containerfile.dnf              |  25 ++
 documentation/tools/Containerfile.fedora           |   1 +
 documentation/tools/Containerfile.ubuntu           |   1 +
 documentation/tools/Containerfile.zypper           |  32 ++
 documentation/tools/build-docs-container           | 175 +++++++++++
 .../tools/host_packages_scripts/almalinux_docs.sh  |   1 +
 .../host_packages_scripts/almalinux_docs_pdf.sh    |   1 +
 .../host_packages_scripts/almalinux_essential.sh   |   5 +
 .../tools/host_packages_scripts/fedora_docs.sh     |   1 +
 .../tools/host_packages_scripts/fedora_docs_pdf.sh |   1 +
 .../host_packages_scripts/fedora_essential.sh      |   1 +
 .../tools/host_packages_scripts/opensuse_docs.sh   |   1 +
 .../host_packages_scripts/opensuse_docs_pdf.sh     |   1 +
 .../host_packages_scripts/opensuse_essential.sh    |   2 +
 .../tools/host_packages_scripts/pip3_docs.sh       |   1 +
 .../tools/host_packages_scripts/ubuntu_docs.sh     |   1 +
 .../tools/host_packages_scripts/ubuntu_docs_pdf.sh |   1 +
 .../host_packages_scripts/ubuntu_essential.sh      |   1 +
 28 files changed, 710 insertions(+), 269 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-5.0.7.rst
 create mode 100644 documentation/sphinx-static/favicon.ico
 create mode 120000 documentation/tools/Containerfile.almalinux
 create mode 100644 documentation/tools/Containerfile.apt
 create mode 120000 documentation/tools/Containerfile.debian
 create mode 100644 documentation/tools/Containerfile.dnf
 create mode 120000 documentation/tools/Containerfile.fedora
 create mode 120000 documentation/tools/Containerfile.ubuntu
 create mode 100644 documentation/tools/Containerfile.zypper
 create mode 100755 documentation/tools/build-docs-container
 create mode 100644 documentation/tools/host_packages_scripts/almalinux_doc=
s.sh
 create mode 100644 documentation/tools/host_packages_scripts/almalinux_doc=
s_pdf.sh
 create mode 100644 documentation/tools/host_packages_scripts/almalinux_ess=
ential.sh
 create mode 100644 documentation/tools/host_packages_scripts/fedora_docs.s=
h
 create mode 100644 documentation/tools/host_packages_scripts/fedora_docs_p=
df.sh
 create mode 100644 documentation/tools/host_packages_scripts/fedora_essent=
ial.sh
 create mode 100644 documentation/tools/host_packages_scripts/opensuse_docs=
.sh
 create mode 100644 documentation/tools/host_packages_scripts/opensuse_docs=
_pdf.sh
 create mode 100644 documentation/tools/host_packages_scripts/opensuse_esse=
ntial.sh
 create mode 100644 documentation/tools/host_packages_scripts/pip3_docs.sh
 create mode 100644 documentation/tools/host_packages_scripts/ubuntu_docs.s=
h
 create mode 100644 documentation/tools/host_packages_scripts/ubuntu_docs_p=
df.sh
 create mode 100644 documentation/tools/host_packages_scripts/ubuntu_essent=
ial.sh


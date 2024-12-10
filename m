Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AC97E77182
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 15:27:30 +0000 (UTC)
Received: from smtp-42a8.mail.infomaniak.ch (smtp-42a8.mail.infomaniak.ch [84.16.66.168])
 by mx.groups.io with SMTP id smtpd.web10.12916.1733844440195721319
 for <docs@lists.yoctoproject.org>;
 Tue, 10 Dec 2024 07:27:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 84.16.66.168, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4Y72fG2wXNzfT9;
	Tue, 10 Dec 2024 16:27:18 +0100 (CET)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4Y72fG05K9zVp5;
	Tue, 10 Dec 2024 16:27:17 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH RFC 0/2] add script for containers building the
 documentation
Date: Tue, 10 Dec 2024 16:26:43 +0100
Message-Id: <20241210-instructions-shell-container-v1-0-6a7cdc404ff4@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALNdWGcC/x3MwQrCMAyA4VcZORtouw7Eq+ADeBUPJctcYGSSd
 CKMvbvF4wc//w7OJuxw6XYw/ojLqg3x1AHNRV+MMjZDCinHFAOKerWNauscfeZlQVq1FlE2pKG
 cM4Xcl36AtngbT/L97x9wv13heRw/hQEmuHMAAAA=
X-Change-ID: 20241210-instructions-shell-container-c5a84c043a35
To: Quentin Schulz <quentin.schulz@cherry.de>, docs@lists.yoctoproject.org
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 10 Dec 2024 15:27:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5924

Based on initial work done by Antonin Godard[1].

This does two things:
- move all the installation steps to fulfil the system requirements for
  each distro into separate files,
- add a script for using those separate files for building a container
  which allows to build the documentation within,

Note that Ubuntu (at least 24.04) and openSUSE instructions do not work
right now. Ubuntu has an issue with locales which are already reported
and fixes sent to the ML[2] (I have not tested the possible fix).
openSUSE seems to be running the sphinx build from a 3.6 Python
interpreter which has an incompatible API with the Python calls used in
Sphinx for our documentation.

[1] https://lore.kernel.org/yocto-docs/20241205-docs-build-dockerfiles-v2-1-047cb3245adf@bootlin.com/
[2] https://lore.kernel.org/yocto-docs/20241202110128.27711-1-guenael.muller@smile.fr/

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Quentin Schulz (2):
      docs: use literalinclude for system requirements
      tools: add script for building documentation inside containers

 documentation/poky.yaml.in                         |  26 ------
 documentation/ref-manual/system-requirements.rst   |  45 ++++-----
 documentation/tools/Containerfile.almalinux        |   1 +
 documentation/tools/Containerfile.apt              |  21 +++++
 documentation/tools/Containerfile.debian           |   1 +
 documentation/tools/Containerfile.dnf              |  19 ++++
 documentation/tools/Containerfile.fedora           |   1 +
 documentation/tools/Containerfile.ubuntu           |   1 +
 documentation/tools/Containerfile.zypper           |  18 ++++
 .../tools/almalinux_host_packages_docs.sh          |   2 +
 .../tools/almalinux_host_packages_essential.sh     |   5 +
 documentation/tools/build-docs-container           | 101 +++++++++++++++++++++
 documentation/tools/fedora_host_packages_docs.sh   |   2 +
 .../tools/fedora_host_packages_essential.sh        |   1 +
 documentation/tools/opensuse_host_packages_docs.sh |   2 +
 .../tools/opensuse_host_packages_essential.sh      |   2 +
 documentation/tools/ubuntu_host_packages_docs.sh   |   2 +
 .../tools/ubuntu_host_packages_essential.sh        |   2 +
 18 files changed, 205 insertions(+), 47 deletions(-)
---
base-commit: 5835cb574881d57785f099c768467177d077e867
change-id: 20241210-instructions-shell-container-c5a84c043a35

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>



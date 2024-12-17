Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DD47E77184
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 16:09:09 +0000 (UTC)
Received: from smtp-bc08.mail.infomaniak.ch (smtp-bc08.mail.infomaniak.ch [45.157.188.8])
 by mx.groups.io with SMTP id smtpd.web11.85587.1734451747571950029
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Dec 2024 08:09:07 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 45.157.188.8, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4YCMFF5HH2zTMl;
	Tue, 17 Dec 2024 17:09:05 +0100 (CET)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4YCMFF2dRZzP8n;
	Tue, 17 Dec 2024 17:09:05 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH RFC v2 0/2] add script for containers building the
 documentation
Date: Tue, 17 Dec 2024 17:08:49 +0100
Message-Id: <20241217-instructions-shell-container-v2-0-ce687b0cfac2@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABGiYWcC/43NQQrDIBAF0KsE17UYo0noqlDoAbotXcg4ViGYo
 lYaQu5ecZVdu/zzh/dXEjE4jOTUrCRgdtHNvgR+aAhY5Z9InS6ZcMZFy1tGnY8pvCGVv0ijxWm
 iMPuknMdAQapRABOd6iQpxCugcZ/K38nteiGPcrQupjksdTK3tfpPzy1ltFcDaBBMGCPOYDGE5
 aixwpnvsf4HxgtmQBotRS+HYdxj27Z9ASvSfgEaAQAA
X-Change-ID: 20241210-instructions-shell-container-c5a84c043a35
To: Quentin Schulz <quentin.schulz@cherry.de>, docs@lists.yoctoproject.org
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Dec 2024 16:09:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5970

Based on initial work done by Antonin Godard[1].

This does two things:
- move all the installation steps to fulfil the system requirements for
  each distro into separate files,
- add a script for using those separate files for building a container
  which allows to build the documentation within,

Note that only instructions for Debian Bookworm (12), Ubuntu 22.04 and
24.04, and Fedora 38, 39 and 40, currently work.

openSUSE seems to be running the sphinx build from a 3.6 Python
interpreter which has an incompatible API with the Python calls used in
Sphinx for our documentation. This is fixed/worked-around with this
patch from Antonin:
https://lore.kernel.org/yocto-docs/20241217-capture-output-compat-v1-1-d8f147a12eea@bootlin.com/
15.4, 15.5 and 15.6 tested with that patch applied.

Almalinux instructions are missing a bunch of packages and I reached a
point where I couldn't find a package providing everysel.sty though
texlive-ms seems to be providing it according to pkgs.org.

How far I went:

"""
 diff --git a/documentation/tools/almalinux_host_packages_docs_pdf.sh b/documentation/tools/almalinux_host_packages_docs_pdf.sh
 index 8341eb8c2..19f45312b 100644
 --- a/documentation/tools/almalinux_host_packages_docs_pdf.sh
 +++ b/documentation/tools/almalinux_host_packages_docs_pdf.sh
 @@ -1 +1,5 @@
 -sudo dnf install latexmk texlive-collection-fontsrecommended texlive-collection-latex texlive-collection-latexrecommended texlive-collection-xetex texlive-fncychap texlive-gnu-freefont texlive-tex-gyre texlive-xetex
 +sudo dnf install -y epel-release
 +sudo yum install dnf-plugins-core
 +sudo dnf config-manager --set-enabled crb
 +sudo dnf makecache
 +sudo dnf install -y latexmk texlive-capt-of texlive-collection-fontsrecommended texlive-collection-latex texlive-collection-latexrecommended texlive-collection-xetex texlive-ctex texlive-fncychap texlive-framed texlive-gnu-freefont texlive-ms texlive-needspace texlive-tabulary texlive-tex-gyre texlive-upquote texlive-wrapfig texlive-xetex
"""

Note the dnf install -y for the packages is required for installing the
GPG key of one of the repos noninteractively.

Older Debian and Ubuntu both lack python3-saneyaml and similar Python
packages in their packagefeed.

Ubuntu 23.04 package feed isn't accessible anymore.

Note that this script cannot be run in parallel right now as all
containers would be sharing the same build directory. This could be
mitigated by allowing BUILDDIR to be overridden from the environment
before being used by make and have it overridden by the script to a
different location. There are probably other corner cases not handled
(likely concurrent set_versions.py for example?).

[1] https://lore.kernel.org/yocto-docs/20241205-docs-build-dockerfiles-v2-1-047cb3245adf@bootlin.com/
[2] https://lore.kernel.org/yocto-docs/20241202110128.27711-1-guenael.muller@smile.fr/

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Changes in v2:
- rebase on master,
- fix issues for recent Ubuntu by setting the timezone,
- add support for building pdf docs from within container,
- fix support for passing multiple make targets to the script
- have all pip3-packages-requiring-distros use one file to make it
  easier to maintain,
- put scripts into a dedicated repo,
- rename variables and filenames to remove host_packages/packages from
  them to make things a bit more digest,
- fix incorrect comment in script about reading poky.yaml.in,

- Link to v1: https://lore.kernel.org/r/20241210-instructions-shell-container-v1-0-6a7cdc404ff4@cherry.de

---
Quentin Schulz (2):
      docs: use literalinclude for system requirements
      tools: add script for building documentation inside containers

 documentation/poky.yaml.in                         | 234 ---------------------
 documentation/ref-manual/system-requirements.rst   |  82 +++++---
 documentation/tools/Containerfile.almalinux        |   1 +
 documentation/tools/Containerfile.apt              |  26 +++
 documentation/tools/Containerfile.debian           |   1 +
 documentation/tools/Containerfile.dnf              |  25 +++
 documentation/tools/Containerfile.fedora           |   1 +
 documentation/tools/Containerfile.ubuntu           |   1 +
 documentation/tools/Containerfile.zypper           |  24 +++
 documentation/tools/build-docs-container           | 113 ++++++++++
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
 23 files changed, 257 insertions(+), 269 deletions(-)
---
base-commit: 02c090718ac602f7d4760dd28dadbf0631668d49
change-id: 20241210-instructions-shell-container-c5a84c043a35

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>



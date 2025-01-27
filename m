Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7470DC02188
	for <webhook@archiver.kernel.org>; Mon, 27 Jan 2025 18:37:32 +0000 (UTC)
Received: from smtp-8fac.mail.infomaniak.ch (smtp-8fac.mail.infomaniak.ch [83.166.143.172])
 by mx.groups.io with SMTP id smtpd.web10.892.1738003043996165873
 for <docs@lists.yoctoproject.org>;
 Mon, 27 Jan 2025 10:37:24 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 83.166.143.172, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4YhcbP6Ln7znp8;
	Mon, 27 Jan 2025 19:37:21 +0100 (CET)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4YhcbN6lSzz7rb;
	Mon, 27 Jan 2025 19:37:20 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH v3 0/2] add script for containers building the
 documentation
Date: Mon, 27 Jan 2025 19:37:03 +0100
Message-Id: <20250127-instructions-shell-container-v3-0-9373d3f156f5@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE/Sl2cC/43PTQ6CMBAF4KuYrqkppT/ElfcwLuowtU1IMW0lE
 sLdLSwMO1m+yeR7MzNJGD0mcjnNJOLokx9CCU11IuBMeCL1XcmEMy5qXjPqQ8rxDbnsJZoc9j2
 FIWTjA0YK0rQCmGhMI0khXhGt/2z87V6y8ykPcdraxnqdHoTHmjKqjIYOBBPWiis4jHE6d0hWe
 OR7TP3BeMEsSNtJoaTW7Q6rfq/qAwigavWDgTXA9xcty/IFWKiIFVoBAAA=
X-Change-ID: 20241210-instructions-shell-container-c5a84c043a35
To: Quentin Schulz <quentin.schulz@cherry.de>, docs@lists.yoctoproject.org
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 27 Jan 2025 18:37:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6199

Based on initial work done by Antonin Godard[1].

This does two things:
- move all the installation steps to fulfil the system requirements for
  each distro into separate files,
- add a script for using those separate files for building a container
  which allows to build the documentation within,

Note that not all distros we say we support in the System Requirements
section work currently.

openSUSE Leap 15.6 somehow doesn't build but with not much interesting
context.

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

This was only build tested, I haven't looked at the build output.

[1] https://lore.kernel.org/yocto-docs/20241205-docs-build-dockerfiles-v2-1-047cb3245adf@bootlin.com/
[2] https://lore.kernel.org/yocto-docs/20241202110128.27711-1-guenael.muller@smile.fr/

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Changes in v3:
- add usage when the script is called with less than one argument or
  with a first argument that isn't supported by the script for now,
- use sed to add --non-interactive to zypper commands instead of adding
  them in the user instructions that would make it to the doc website,
- limit OCI images that can be used by hardcoding the tag (or start of
  the tag),
- remove ability to "build" on non-working distros (they are commented
  out with an explanation so someone can look at it if they feel like
  it),
- added vim modeline so people using vim will use the same indentation
  by default,
- rebase on master,
- Link to v2: https://lore.kernel.org/r/20241217-instructions-shell-container-v2-0-ce687b0cfac2@cherry.de

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
 documentation/tools/Containerfile.zypper           |  32 +++
 documentation/tools/build-docs-container           | 175 +++++++++++++++
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
 23 files changed, 327 insertions(+), 269 deletions(-)
---
base-commit: 8bd2bc3c00ca80f4c000a2a8d618a9f8ea3aa54b
change-id: 20241210-instructions-shell-container-c5a84c043a35

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>



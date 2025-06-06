Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0B53C5B549
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 07:37:58 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.28523.1749195473039834783
 for <docs@lists.yoctoproject.org>;
 Fri, 06 Jun 2025 00:37:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=hxc7trTf;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2B5A143D24;
	Fri,  6 Jun 2025 07:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749195470;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=huGlkZi40qKAU/bqAT1lURHozLXwAKVFX2RKlCZI1Is=;
	b=hxc7trTfKupC+Cp1UM0BwMGRkLljAjVdyXqIV63QoOTpTQfASIsMDihdlBhsC5a47zUWCI
	uj7JUSeUOz/3c2J0/MgMXj3Kp6vgVrsvdWhXtpFdi87CCPF8445K98+VjUVQ5U0p61Xfjq
	m5Qi8kbWOeCSBCfsGnpeHxzuM3d+g+QZ9qSBJraX6CHcRGtGorhmIhgf4QWrnOrrzFYqUB
	xl9KXibhp0XEvuIyn7aEmLS0IGXU0ihZwHcYjwIF1REpCsZXXfIEi0Xf8j5qWvgxSyA9eP
	B4NRDTTiv74ydJoyXfya9o9BqDX94lYq/bSH0esK96qBRhCBfFRIZiWi2Ffz+w==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 06 Jun 2025 09:37:36 +0200
Subject: [PATCH] Add a document to list supported Yocto features
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250606-supported-architectures-v1-1-5eae2c4a2257@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAL+aQmgC/x2MsQqEMBAFf0W2NpDkiKK/IhYhvju30bAbRRD/3
 XAwzRQzNymEoTQ2NwlOVt63Kq5tKK1x+8HwUp289cEG1xk9ct6lYDFR0soFqRwCNd66CvpPGgL
 VOgu+fP3P0/w8L8ALVYhpAAAA
X-Change-ID: 20250516-supported-architectures-201201e73c95
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Richard Purdie <richard.purdie@linuxfoundation.org>, 
 Yocto TSC <tsc@lists.yoctoproject.org>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=10946;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=BBYEY8ce7auLc3z+mprETZVjevo12NCF1Xjd5T9buNs=;
 b=kA0DAAgB0YBBQCmjqDYByyZiAGhCms2gYCFgrqIyzvjM0NQTa5If33griV86neHJms4qOTo/Q
 okCMwQAAQgAHRYhBIZIclGI3UAbuaDT/9GAQUApo6g2BQJoQprNAAoJENGAQUApo6g2ff8QAJEK
 RKCvkEMEG5TxkwFcd+PrgMrZ1FjmXlGL67QZHb9fJ5MCixp7loFS9FCwUQ469P1Ntd/Xowis3Cv
 4S8+n9uCEGPSq7j16iLgOn9aP590te9NoNW1s81A/ptH/OdoR6MJfQXpldHIeG98cAXTfaLuIWi
 zHEMuAJfy8qqD75N44Ak3a/ja3YJi6UYSbo/6Fk01nZ4L0923Tu9MFh5m4bLx+CPWfyrEU3IFVf
 hhMdvzxoMV8FrShDyRUG/bHF7MRo4G2jETh0s6nkSb/yhom6lwJkgREznBHcYHyCzjMWUviUzpv
 CXf4mjKghxZyoq5f3lYWbLxf7vsqzLmNSrzcovB2M6dHkZ9lTkpx2YhnWWDri36C2cyKIvX2dUY
 Z0H5trW2dNeslf9nI9r7YlGxkHS1ZAs0cS0ELJqs+6M1s1T3J91W+rq7v9pH0BB7c6jGCUm6bLX
 dTdRqLpVwDQbMUWK92mS7r3tpyJXhbJExm3ZQd5WmST2XRqthtYMhoB/WbsMCtLoELMuKNYjHwn
 7GGRBilWUPS0zT3T3vRNIotl1Jnpdd/V5PAHu0l9eBwDsD3792T74dVJwxf62FZyfY+RTVlV+nG
 3FuEiE0MQnwMoldpSuTqncAGUQkWrwr6dYydOvFDehla31jqLHFMQ010cjRpCWxG4LWHC6Dw5Fr
 ChDRE
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdegjeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkvfevofesthekredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeefhefgvdfgudekkeffgedtgfdtveefkefhgfdtieeiueevjedvkeekgfehtdekjeenucffohhmrghinheprghuthhomhhothhivhgvlhhinhhugidrohhrghdphihotghtohhprhhojhgvtghtrdhorhhgpdhgihhthhhusgdrtghomhenucfkphepvdduvddruddthedrudehtddrvdehvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvuddvrddutdehrdduhedtrddvhedvpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopehtshgtsehlihhsthhsrdiho
 hgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehrihgthhgrrhgurdhpuhhrughivgeslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 06 Jun 2025 07:37:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7011

Add a "Yocto Project Supported Architectures And Features" document that
aims at:

- Defining the different levels of support for features
- Listing the maintainers for a feature
- Listing the existing builders on the Autobuilder for the feature

Co-developed-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Yocto TSC <tsc@lists.yoctoproject.org>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/index.rst                 |   1 +
 .../yocto-project-supported-features.rst           | 264 +++++++++++++++++++++
 2 files changed, 265 insertions(+)

diff --git a/documentation/ref-manual/index.rst b/documentation/ref-manual/index.rst
index a746dde492..53fa98cc99 100644
--- a/documentation/ref-manual/index.rst
+++ b/documentation/ref-manual/index.rst
@@ -11,6 +11,7 @@ Yocto Project Reference Manual
    :numbered:
 
    system-requirements
+   yocto-project-supported-features
    terms
    release-process
    structure
diff --git a/documentation/ref-manual/yocto-project-supported-features.rst b/documentation/ref-manual/yocto-project-supported-features.rst
new file mode 100644
index 0000000000..8776a1a7eb
--- /dev/null
+++ b/documentation/ref-manual/yocto-project-supported-features.rst
@@ -0,0 +1,264 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+**************************************************
+Yocto Project Supported Architectures And Features
+**************************************************
+
+The Yocto Project is putting continuous efforts into testing the changes made to
+the :term:`OpenEmbedded-Core (OE-Core)` metadata and core tools. The details on
+how this test environment functions is described in the
+:doc:`/test-manual/index`.
+
+These tests are also run for stable and Long Term Support versions of the Yocto
+Project. See the :doc:`/ref-manual/release-process` section of the Yocto Project
+Reference Manual for more information on these types of releases.
+
+The infrastructure behind the test environment is the Yocto Project Autobuilder.
+For more information on the Yocto Project Autobuilder, see the
+:ref:`test-manual/intro:Yocto Project Autobuilder Overview` section of the Yocto
+Project Test Manual. The Autobuilder contains a set of Builders that are
+associated to an architecture or a feature to test. For example, the
+``qemuarm64`` builder corresponds to testing the ARM 64-bit architecture.
+
+Below is a comprehensive list of target architectures and features that are
+supported, as well as their level of support. For each architecture or feature,
+their corresponding builders are also listed.
+
+Primary Supported
+=================
+
+The term "primary" means that dedicated builds for these architecture or
+features are being run on a daily basis on the Yocto Project Autobuilder and
+also tested with incoming changes before they merge.
+
+Below is a list of primary tested features, their maintainer(s) and builder(s):
+
+.. list-table::
+   :widths: 20 20 20 40
+   :header-rows: 1
+
+   * - Feature
+     - Description
+     - Maintainer(s)
+     - Builder(s)
+   * - :wikipedia:`ARM <ARM_architecture_family>`
+     - ARM architecture testing
+     - Collective effort
+     - genericarm64,
+       genericarm64-alt,
+       meta-arm,
+       musl-qemuarm64,
+       qemuarm,
+       qemuarm-alt,
+       qemuarm-oecore,
+       qemuarm-tc,
+       qemuarm64,
+       qemuarm64-alt,
+       qemuarm64-armhost,
+       qemuarm64-ltp,
+       qemuarm64-ptest,
+       qemuarm64-tc,
+       qemuarmv5
+   * - :yocto_git:`Beaglebone </poky/tree/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf>`
+     - Beaglebone image and SDK build testing
+     - Collective effort
+     - beaglebone,
+       beaglebone-alt
+   * - :doc:`Reproducible </test-manual/reproducible-builds>`
+     - reproducibility testing
+     - Collective effort
+     - reproducible
+   * - :term:`Buildtools`
+     - Buildtools generation
+     - Collective effort
+     - buildtools
+   * - `meta-agl-core <https://gerrit.automotivelinux.org/gerrit/AGL/meta-agl>`__
+     - meta-agl-core layer testing
+     - Jan-Simon Möller
+     - meta-agl-core
+   * - `meta-arm <https://git.yoctoproject.org/meta-arm>`__
+     - meta-arm layer testing
+     - Jon Mason,
+       Ross Burton
+     - meta-arm
+   * - `meta-aws <https://github.com/aws4embeddedlinux/meta-aws>`__
+     - meta-aws layer testing
+     - Thomas Roos
+     - meta-aws
+   * - `meta-intel <https://git.yoctoproject.org/meta-intel>`__
+     - meta-intel layer testing
+     - Anuj Mittal
+     - meta-intel
+   * - `meta-virtualization <https://git.yoctoproject.org/meta-virtualization/>`__
+     - meta-virtualization layer testing
+     - Bruce Ashfield
+     - meta-virt
+   * - :ref:`Multilib <dev-manual/libraries:Combining Multiple Versions of Library Files into One Image>`
+     - Multilib feature testing
+     - Collective effort
+     - multilib
+   * - :term:`OpenEmbedded-Core selftest<OpenEmbedded-Core (OE-Core)>`
+     - OpenEmbedded-Core layers selftests
+     - Collective effort
+     - oe-selftest-fedora,
+       oe-selftest-debian,
+       oe-selftest-armhost
+   * - Package managers
+     - Package managers (RPM, DEB and IPK formats) testing in the
+       :term:`OpenEmbedded Build System` (different from the
+       ``package-management`` :term:`image feature <IMAGE_FEATURES>`)
+     - Collective effort
+     - pkgman-non-rpm (other builders use RPM by default)
+   * - :ref:`Patchtest <contributor-guide/submit-changes:Validating Patches with Patchtest>`
+     - Patchtest tool selftests
+     - Trevor Gamblin
+     - patchtest-selftest
+   * - :wikipedia:`RISC-V (64-bit) <RISC-V>`
+     - RISC-V architecture testing (64-bit)
+     - Collective effort
+     - qemuriscv64,
+       qemuriscv64-ptest,
+       qemuriscv64-tc
+   * - :wikipedia:`systemd <Systemd>`
+     - Systemd init manager testing
+     - Collective effort
+     - no-x11, qa-extras2
+   * - :term:`Toaster`
+     - Toaster web interface testing
+     - Collective effort
+     - toaster
+   * - :ref:`Wic <dev-manual/wic:creating partitioned images using wic>`
+     - WIC image creation testing
+     - Collective effort
+     - wic
+   * - :wikipedia:`X86 <X86>`
+     - X86 architecture testing
+     - Collective effort
+     - genericx86,
+       genericx86-64,
+       genericx86-64-alt,
+       genericx86-alt,
+       musl-qemux86,
+       musl-qemux86-64,
+       qemux86,
+       qemux86-64,
+       qemux86-64-alt,
+       qemux86-64-ltp,
+       qemux86-64-ptest,
+       qemux86-64-tc,
+       qemux86-64-x32,
+       qemux86-alt,
+       qemux86-tc,
+       qemux86-world,
+       qemux86-world-alt
+
+Secondary Supported
+===================
+
+The term "secondary" means that in some cases there is code/feature/support
+which is desired by people using the project and is in the project's interests
+to support, however there isn't wide enough interest and support to justify
+testing all incoming changes on it. There are however project member
+organisations and maintainers willing to run tests and review fixes.
+
+This category may be applicable as support/usage in an area develops and grows,
+or as support/usage fades but we continue to have tests. It can also apply where
+resourcing isn't available for full primary support but there is
+member/maintainer support for running tests.
+
+We therefore have the following criteria and policies for such items:
+
+-  It can be clearly isolated and defined by specific configuration.
+
+-  There is a clear documented group of maintainers agreeing to maintain it.
+
+-  Those maintainers are active and responsive.
+
+-  It is being actively and publicly tested (potentially using
+   the :ref:`Autobuilder <test-manual/intro:Yocto Project Autobuilder Overview>`
+   by agreement, or otherwise).
+
+-  Testing would not be part of standard incoming change testing and regressions
+   would not block incoming patches.
+
+-  The :yocto_wiki:`SWAT </Yocto_Build_Failure_Swat_Team>` team would not handle
+   any test builds on the autobuilder.
+
+-  Test results can be submitted as part of the release process if desired.
+
+The Yocto Project :oe_wiki:`Technical Steering Committee (TSC) </TSC>` makes
+decisions on features in this status and Autobuilder testing. Such support would
+be dropped if the maintainers/testing were inactive.
+
+If you are interested in providing resources for improving testing please
+contact the :oe_wiki:`Technical Steering Committee (TSC) </TSC>`.
+
+Below is a list of secondary tested features, their maintainer(s) and
+builder(s):
+
+.. list-table::
+   :widths: 20 20 20 40
+   :header-rows: 1
+
+   * - Feature
+     - Description
+     - Maintainer(s)
+     - Builder(s)
+   * - :wikipedia:`PowerPC (32-bit) <PowerPC>`
+     - PowerPC architecture testing (32-bit)
+     - Adrian Freihofer
+     - qemuppc,
+       qemuppc-alt,
+       qemuppc-tc
+   * - :oe_git:`meta-openembedded </meta-openembedded>`
+     - meta-openembedded layer testing
+     - Khem Raj
+     - meta-oe
+   * - `meta-mingw <https://git.yoctoproject.org/meta-mingw>`__
+     - mingw based SDKs testing
+     - Joshua Watt
+     - meta-mingw
+   * - `meta-webosose <https://github.com/webosose/meta-webosose>`__
+     - meta-webosose layer testing
+     - Martin Jansa
+     - meta-webosose
+   * - :wikipedia:`RISC-V (32-bit) <RISC-V>`
+     - RISC-V architecture testing (32-bit)
+     - Collective effort
+     - qemuriscv32,
+       qemuriscv32,
+       qemuriscv32-tc
+
+Untested
+========
+
+"Untested" means that whilst the configurations are present in the project, we
+don't currently run the tests on any regular basis and new changes are not
+tested against them. We may take patches in these areas if they make sense but
+it is on a best effort only basis.
+
+.. list-table::
+   :widths: 20 20 20 40
+   :header-rows: 1
+
+   * - Feature
+     - Description
+     - Maintainer(s)
+     - Builder(s)
+   * - `meta-exein <https://github.com/exein-io/meta-exein>`__
+     - meta-exein layer testing
+     - Gianluigi Spagnuolo
+     - meta-exein
+   * - :wikipedia:`MIPS <MIPS_architecture>`
+     - MIPS architecture testing
+     - No maintainers
+     - qemumips,
+       qemumips64,
+       qemumips-alt,
+       qemumips-tc,
+       qemumips64-tc
+   * - :wikipedia:`PowerPC (64-bit) <PowerPC>`
+     - PowerPC architecture testing (64-bit)
+     - No maintainers
+     - qemuppc64,
+       qemuppc64-tc

---
base-commit: c4748f5079e5193f82afc1b754816edd40ce9254
change-id: 20250516-supported-architectures-201201e73c95

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>



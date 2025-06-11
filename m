Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CE20C61CE7
	for <webhook@archiver.kernel.org>; Wed, 11 Jun 2025 12:41:58 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.6757.1749645710903068562
 for <docs@lists.yoctoproject.org>;
 Wed, 11 Jun 2025 05:41:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Xo5AafTL;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8D54C438DC;
	Wed, 11 Jun 2025 12:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749645707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IZUudVFXxnu8iFq6OkbU9JBQEg/vH9TwedMcQOIEDJ4=;
	b=Xo5AafTLVQyE6v9pyT2puJd1gorAyCzSuvQnsVBHlNVQhMpDxU/HiOsMbVPFGp9qjSDNWX
	nsRW3MRQPOhLaoNE/7Cq6FsNRZTZuOtR6ATYxFfHxyiUegquXmjPiRpWI7J0OpyyAMuwNC
	cT01hT/5+W7Vf5iS4uIBFOJCnnwVdfUIbWtsqGrU/kxRqVg+03Bi1rGvg2NUS9cYu043Hp
	RCE2CAwUoI2Rcd8DPpo4wGcacVWiR3pB4eSLcO4XDWbtUZjSoY9FSyk2enJCtLkx3jvAyF
	oXQ0YATuKKrqQXbPZI6hy4ui5CH9yW2rjfQgBpmloOivHS0d0EOLN5z+vJfO5A==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 11 Jun 2025 14:41:28 +0200
Subject: [PATCH v2] Add a document to list supported Yocto features
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250611-supported-architectures-v2-1-30c66f5cf6e3@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAHd5SWgC/3WNwQrCMBBEf6Xs2UiymhY99T+kh5iudkGbsEmLU
 vrvxnoW5vIG5s0CiYQpwblaQGjmxGEsgLsK/ODGOynuCwNqtNqaWqUpxiCZeuXED5zJ50koKdS
 mhJqDP1ko6yh049dmvnSFB045yHs7ms23/Tlr/d85G2WUJUfojw7RNu01hPzgce/DE7p1XT/mD
 frfwAAAAA==
X-Change-ID: 20250516-supported-architectures-201201e73c95
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Richard Purdie <richard.purdie@linuxfoundation.org>, 
 Yocto TSC <tsc@lists.yoctoproject.org>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=11080;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=Ysi6JKDuU08ThrCc3quwjzHVFnEdNTwwgGFPWaAmo64=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBoSXmLfuaczr3sFI5rY9wuCsd7yFFF4iB4pbK/J
 AWvqNSO32SJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaEl5iwAKCRDRgEFAKaOo
 Np15D/9lKnqoWUrSXjrwXK4xQLYiS3/RynCqLTBHruFULSazCpzzD7j4UzZqEQ9/g0SqfKItfBX
 d+Vjv/Rf4o8+1EA4S+z2P+iJFgkI3JUH3c75vOohY4ugfyzJN5qbSlR5gpX8rRQV66az9uCbcjz
 U9PoDR7VXaDsC+f+45ABLyyJBbOazop9GZJmZt6ZjWDfp0omv3Ndeyb8pOHptTClUvTuPlzgj2f
 2bgtyND3x/YH/rnz1AvSAviQEIaymzKPbNhZCZ2q59SyGu4gbDftO4guE8AoZWEYfK9HffyhfD2
 iPUWCJx+1zIxV4p79wCqGz0HtjBOSTVqAQwyZGCnm0TsivHSLnhjjy/STDeRKfVitg8G255Qaee
 QqPPj4idcdqrKuBc1IUE13+ZM7J+/PKSPnxjYIeBSORQZRBPchK4eHfRAU35qNIrThS8ifAAkae
 y11PgFCOVWy3ue1KafWBCcLA9aW9shVRI+Woz0dPg5GANRbVrtOXxTlkEAsT1X4Uo8rZz7+3s//
 vRNcixZJjmY8zBO6v74D2Qj6ZCZgo24DjHQNTH8dF3V+/8cqPbz2j0tfuP+GM4w7o8StXCtkksW
 on9e4rlDlyHqwLjqcdpoESgvY27+LZ47fOByBe8RGwpau+yVb7k2/LAu7wL1E4SsO1AsZy2vIqf
 J2bOgBfO+ziHbtA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdduvddvvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkffvvefosehtkeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepfeffgfehuefgleeghffghfdtiedugfeiveejhfelvdetvdejfedvheehfefhjeetnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdprghuthhomhhothhivhgvlhhinhhugidrohhrghdphihotghtohhprhhojhgvtghtrdhorhhgpdhgihhthhhusgdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrt
 ghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepthhstgeslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprhhitghhrghrugdrphhurhguihgvsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 11 Jun 2025 12:41:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7061

Add a "Yocto Project Supported Architectures And Features" document that
aims at:

- Defining the different levels of support for features
- Listing the maintainers for a feature
- Listing the existing builders on the Autobuilder for the feature

Co-developed-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Yocto TSC <tsc@lists.yoctoproject.org>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v2:
- Couple of typos and improvements suggested by Quentin.
- Remove maintainers names. The plan is to ask people to put their names
  here individually.
- Link to v1: https://lore.kernel.org/r/20250606-supported-architectures-v1-1-5eae2c4a2257@bootlin.com
---
 documentation/ref-manual/index.rst                 |   1 +
 .../yocto-project-supported-features.rst           | 263 +++++++++++++++++++++
 2 files changed, 264 insertions(+)

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
index 0000000000..bc1a813938
--- /dev/null
+++ b/documentation/ref-manual/yocto-project-supported-features.rst
@@ -0,0 +1,263 @@
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
+These tests are also run for stable and :term:`LTS` versions of the Yocto
+Project. See the :doc:`/ref-manual/release-process` section of the Yocto Project
+Reference Manual for more information on these types of releases.
+
+The infrastructure behind the test environment is the
+:ref:`Yocto Project Autobuilder <test-manual/intro:Yocto Project Autobuilder
+Overview>`. The Autobuilder contains a set of Builders that are associated to an
+architecture or a feature to test. For example, the ``qemuarm64`` builder
+corresponds to testing the ARM 64-bit architecture.
+
+Below is a comprehensive list of target architectures and features that are
+supported, as well as their level of support. For each architecture or feature,
+their corresponding builders are also listed.
+
+Primary Supported
+=================
+
+The term "primary" means that dedicated builds for these architectures or
+features are being run on a daily basis on the Yocto Project Autobuilder and
+also tested with incoming changes before they merge. These changes are usually
+on the "-next" Git branches of the :term:`OpenEmbedded-Core (OE-Core)`
+repositories.
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
+     - TBD
+     - meta-agl-core
+   * - `meta-arm <https://git.yoctoproject.org/meta-arm>`__
+     - meta-arm layer testing
+     - TBD
+     - meta-arm
+   * - `meta-aws <https://github.com/aws4embeddedlinux/meta-aws>`__
+     - meta-aws layer testing
+     - TBD
+     - meta-aws
+   * - `meta-intel <https://git.yoctoproject.org/meta-intel>`__
+     - meta-intel layer testing
+     - TBD
+     - meta-intel
+   * - `meta-virtualization <https://git.yoctoproject.org/meta-virtualization/>`__
+     - meta-virtualization layer testing
+     - TBD
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
+     - TBD
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
+   any test builds on the Autobuilder.
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
+     - TBD
+     - qemuppc,
+       qemuppc-alt,
+       qemuppc-tc
+   * - :oe_git:`meta-openembedded </meta-openembedded>`
+     - meta-openembedded layer testing
+     - TBD
+     - meta-oe
+   * - `meta-mingw <https://git.yoctoproject.org/meta-mingw>`__
+     - mingw based SDKs testing
+     - TBD
+     - meta-mingw
+   * - `meta-webosose <https://github.com/webosose/meta-webosose>`__
+     - meta-webosose layer testing
+     - TBD
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
+     - TBD
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
base-commit: 040556cc9bc998970eb6152f8748d359b15b4bf9
change-id: 20250516-supported-architectures-201201e73c95

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>



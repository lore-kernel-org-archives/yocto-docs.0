Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73640C369A4
	for <webhook@archiver.kernel.org>; Wed,  9 Apr 2025 09:56:12 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.4583.1744192566061640870
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Apr 2025 02:56:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=WDDPC5vQ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 85881442EF;
	Wed,  9 Apr 2025 09:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744192564;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vMUDqg/oxjhEdhh3i5HKEcTWJM/zZ0ZF8b0+SNtbOQc=;
	b=WDDPC5vQiG97E0HAQ1EO2aK+GmWYNTj96ydb/Xh8gY8XqWuC/XXM9SBvZkIZ+J8yA+DfaT
	G6fCwv4JXRjRhQ7bbfgB20H+5XyJ9cXtzOp8C6OQvb2AgSTdLBZoDx5BI74hddwcPpCC/Z
	5vUeSkJDCnnkyzin+T7gZ7xPofOydefXSJhqw1MfoaRx3HFcScjPveB1oLV3iDn4OY9rl/
	SoTzW2x+yYQB9yXzqHXS4qNC3QGSDBnTx5QMxj5nsQpc+VVGKvH3qGzdxy0a/HoqueD0Jo
	h3j2ku6gkselbo0hdxSVF6YzR3FLg3PgaezThi5khAUD3PD0jWgZp8NhbLnFvw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 09 Apr 2025 11:55:42 +0200
Subject: [PATCH 2/2] Fix dead links that use the DISTRO macro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250409-fix-distro-dead-links-v1-2-616b62185d04@bootlin.com>
References: <20250409-fix-distro-dead-links-v1-0-616b62185d04@bootlin.com>
In-Reply-To: <20250409-fix-distro-dead-links-v1-0-616b62185d04@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=9460;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=fftNSDyLfeulChZHhqNYvS5HwQnAtBn83SHKfETqfnQ=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn9kQzED09JaAQOU0JaJlRO1uUOL5uGV1qwt6Ml
 yJhepGt9SCJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ/ZEMwAKCRDRgEFAKaOo
 Nr40D/9zm1Fq4qS/iDzeJxRuP44e+9hp2XPoJCIXXv8PY9hLVKw9K1H+K71EbKR2R5mFYWTvoyh
 HwzDjmFyTBvztUAfy3uMg0881XaHcXA5ZcggILJ+QW9uG15WMx7SI/GK4bb3TCrPfTmntY91yd4
 Xt2IKUVJ4mJPGeHBvbhKA0Mq3gP7qEqMC+/nuW+Td7D2IuyxxYpHYXJ4K46fkl85KcgOqi/pVdl
 VoY5hl8wqJhBB4vFqajtYdKK4xEd4D+vWiKMnW55HGWb3yUJmKuiI1kWWv3cXv+hpaCTJIEgm5S
 ZmQSp4Mh+YV27eevDvYQj9Sti48+ANXSEvC7QdJzsODvo1o+m7B5+xKmoU2IOT8wv4tlfh5+St2
 e+nRXTBNlrqE8EC9h43qIjxP5gl4H2mTcpC0RQvUXb8g4939+3z19rmnbMkKHHOz9k577nasunn
 lzkxFyqvPU/NbvHVnqXFNRQG2wBzyeG2prIljtjXSHVbCaxttpFDL0uooWEU8xcZM76I1ka0F89
 7u57M9ix//ZXePzKLxVf1E2Au791Og6Gc4jYboB3cEtteRYz6gfyhvCvhdnl+JQqiiQaSvp0Mqv
 umz6V7SGsQ5qxGU8y7xCuVuc2oxvjNLrcub2aRlo9UkjECs2IgAHLVtn5OwOfGJhPCvsfqIgLKg
 tjrfNOUQXVs4mxQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdehieekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehieeguefhfeegheffgfeuieetheeileefheejkeetgfekueehueeluddvlefghfenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmedujegtvdemfeekjegrmehfieehmeehvdefheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemudejtgdvmeefkeejrgemfheiheemhedvfeehpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhoj
 hgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Apr 2025 09:56:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6723

After introducing the DISTRO_LATEST_TAG and DISTRO_REL_LATEST_TAG
macros, use them in links that currently use DISTRO/DISTRO_REL_TAG. When
building for the tip of a branch, this will replace the current A.B.999
in links to the latest existing tag.

The links were found across the documentation by running 'grep -r
"http.*5\.2\.999"' inside the _build/html output after building the
docs.

[YOCTO #14802]

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/bsp-guide/bsp.rst                  | 2 +-
 documentation/dev-manual/qemu.rst                | 2 +-
 documentation/dev-manual/start.rst               | 2 +-
 documentation/ref-manual/system-requirements.rst | 2 +-
 documentation/ref-manual/terms.rst               | 2 +-
 documentation/sdk-manual/appendix-obtain.rst     | 6 +++---
 documentation/sdk-manual/extensible.rst          | 2 +-
 documentation/sdk-manual/intro.rst               | 4 ++--
 documentation/sdk-manual/using.rst               | 2 +-
 9 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
index 11ca5d8b76..3e484aa473 100644
--- a/documentation/bsp-guide/bsp.rst
+++ b/documentation/bsp-guide/bsp.rst
@@ -166,7 +166,7 @@ section.
    BSPs, which are maintained in their own layers or in layers designed
    to contain several BSPs. To get an idea of machine support through
    BSP layers, you can look at the
-   :yocto_dl:`index of machines </releases/yocto/yocto-&DISTRO;/machines>`
+   :yocto_dl:`index of machines </releases/yocto/&DISTRO_REL_LATEST_TAG;/machines>`
    for the release.
 
 #. *Optionally Clone the meta-intel BSP Layer:* If your hardware is
diff --git a/documentation/dev-manual/qemu.rst b/documentation/dev-manual/qemu.rst
index 030bd55143..92c93a82ab 100644
--- a/documentation/dev-manual/qemu.rst
+++ b/documentation/dev-manual/qemu.rst
@@ -75,7 +75,7 @@ available. Follow these general steps to run QEMU:
       your :term:`Build Directory`.
 
    -  If you have not built an image, you can go to the
-      :yocto_dl:`machines/qemu </releases/yocto/yocto-&DISTRO;/machines/qemu/>` area and download a
+      :yocto_dl:`machines/qemu </releases/yocto/&DISTRO_REL_LATEST_TAG;/machines/qemu/>` area and download a
       pre-built image that matches your architecture and can be run on
       QEMU.
 
diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manual/start.rst
index 05827610b7..0f015d4340 100644
--- a/documentation/dev-manual/start.rst
+++ b/documentation/dev-manual/start.rst
@@ -615,7 +615,7 @@ Accessing Source Archives
 The Yocto Project also provides source archives of its releases, which
 are available on :yocto_dl:`/releases/yocto/`. Then, choose the subdirectory
 containing the release you wish to use, for example
-:yocto_dl:`yocto-&DISTRO; </releases/yocto/yocto-&DISTRO;/>`.
+:yocto_dl:`&DISTRO_REL_LATEST_TAG; </releases/yocto/&DISTRO_REL_LATEST_TAG;/>`.
 
 You will find there source archives of individual components (if you wish
 to use them individually), and of the corresponding Poky release bundling
diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 04d2674efd..b64a13320a 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -393,7 +393,7 @@ If you would prefer not to use the ``install-buildtools`` script, you can instea
 download and run a pre-built :term:`buildtools` installer yourself with the following
 steps:
 
-#. Go to :yocto_dl:`/releases/yocto/yocto-&DISTRO;/buildtools/`, locate and
+#. Go to :yocto_dl:`/releases/yocto/&DISTRO_REL_LATEST_TAG;/buildtools/`, locate and
    download the ``.sh`` file corresponding to your host architecture
    and to :term:`buildtools`, :term:`buildtools-extended` or :term:`buildtools-make`.
 
diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
index b18c4183b6..9d765c89c8 100644
--- a/documentation/ref-manual/terms.rst
+++ b/documentation/ref-manual/terms.rst
@@ -452,7 +452,7 @@ universal, the list includes them just in case:
      the Source Directory, if you do, the top-level directory name of the
      Source Directory is derived from the Yocto Project release tarball.
      For example, downloading and unpacking poky tarballs from
-     :yocto_dl:`/releases/yocto/&DISTRO_REL_TAG;/`
+     :yocto_dl:`/releases/yocto/&DISTRO_REL_LATEST_TAG;/`
      results in a Source Directory whose root folder is named poky.
 
 
diff --git a/documentation/sdk-manual/appendix-obtain.rst b/documentation/sdk-manual/appendix-obtain.rst
index d06d6ec6b5..a42cbc31bb 100644
--- a/documentation/sdk-manual/appendix-obtain.rst
+++ b/documentation/sdk-manual/appendix-obtain.rst
@@ -29,7 +29,7 @@ and then run the script to hand-install the toolchain.
 Follow these steps to locate and hand-install the toolchain:
 
 #. *Go to the Installers Directory:* Go to
-   :yocto_dl:`/releases/yocto/yocto-&DISTRO;/toolchain/`
+   :yocto_dl:`/releases/yocto/&DISTRO_REL_LATEST_TAG;/toolchain/`
 
 #. *Open the Folder for Your Build Host:* Open the folder that matches
    your :term:`Build Host` (i.e.
@@ -201,7 +201,7 @@ Follow these steps to extract the root filesystem:
    Image File:* You need to find and download the root filesystem image
    file that is appropriate for your target system. These files are kept
    in machine-specific folders in the
-   :yocto_dl:`Index of Releases </releases/yocto/yocto-&DISTRO;/machines/>`
+   :yocto_dl:`Index of Releases </releases/yocto/&DISTRO_REL_LATEST_TAG;/machines/>`
    in the "machines" directory.
 
    The machine-specific folders of the "machines" directory contain
@@ -245,7 +245,7 @@ Follow these steps to extract the root filesystem:
 
    Here is an example command that extracts the root filesystem
    from a previously built root filesystem image that was downloaded
-   from the :yocto_dl:`Index of Releases </releases/yocto/yocto-&DISTRO;/machines/>`.
+   from the :yocto_dl:`Index of Releases </releases/yocto/&DISTRO_REL_LATEST_TAG;/machines/>`.
    This command extracts the root filesystem into the ``core2-64-sato``
    directory::
 
diff --git a/documentation/sdk-manual/extensible.rst b/documentation/sdk-manual/extensible.rst
index dcb02c4e00..e5e9e4a03b 100644
--- a/documentation/sdk-manual/extensible.rst
+++ b/documentation/sdk-manual/extensible.rst
@@ -87,7 +87,7 @@ Host` by running the ``*.sh`` installation script.
 You can download a tarball installer, which includes the pre-built
 toolchain, the ``runqemu`` script, the internal build system,
 ``devtool``, and support files from the appropriate
-:yocto_dl:`toolchain </releases/yocto/yocto-&DISTRO;/toolchain/>` directory within the Index of
+:yocto_dl:`toolchain </releases/yocto/&DISTRO_REL_LATEST_TAG;/toolchain/>` directory within the Index of
 Releases. Toolchains are available for several 32-bit and 64-bit
 architectures with the ``x86_64`` directories, respectively. The
 toolchains the Yocto Project provides are based off the
diff --git a/documentation/sdk-manual/intro.rst b/documentation/sdk-manual/intro.rst
index e8fd191dbc..fbfc8c2ac7 100644
--- a/documentation/sdk-manual/intro.rst
+++ b/documentation/sdk-manual/intro.rst
@@ -173,7 +173,7 @@ You just need to follow these general steps:
    root filesystem images.
 
    If you are going to develop your application on hardware, go to the
-   :yocto_dl:`machines </releases/yocto/yocto-&DISTRO;/machines/>` download area and choose a
+   :yocto_dl:`machines </releases/yocto/&DISTRO_REL_LATEST_TAG;/machines/>` download area and choose a
    target machine area from which to download the kernel image and root
    filesystem. This download area could have several files in it that
    support development using actual hardware. For example, the area
@@ -183,7 +183,7 @@ You just need to follow these general steps:
 
    If you are going to develop your application and then run and test it
    using the QEMU emulator, go to the
-   :yocto_dl:`machines/qemu </releases/yocto/yocto-&DISTRO;/machines/qemu>` download area. From this
+   :yocto_dl:`machines/qemu </releases/yocto/&DISTRO_REL_LATEST_TAG;/machines/qemu>` download area. From this
    area, go down into the directory for your target architecture (e.g.
    ``qemux86_64`` for an Intel-based 64-bit architecture). Download the
    kernel, root filesystem, and any other files you need for your
diff --git a/documentation/sdk-manual/using.rst b/documentation/sdk-manual/using.rst
index f1ff0c76ca..bfb306abf5 100644
--- a/documentation/sdk-manual/using.rst
+++ b/documentation/sdk-manual/using.rst
@@ -43,7 +43,7 @@ Host` by running the ``*.sh`` installation script.
 
 You can download a tarball installer, which includes the pre-built
 toolchain, the ``runqemu`` script, and support files from the
-appropriate :yocto_dl:`toolchain </releases/yocto/yocto-&DISTRO;/toolchain/>` directory within
+appropriate :yocto_dl:`toolchain </releases/yocto/&DISTRO_REL_LATEST_TAG;/toolchain/>` directory within
 the Index of Releases. Toolchains are available for several 32-bit and
 64-bit architectures with the ``x86_64`` directories, respectively. The
 toolchains the Yocto Project provides are based off the

-- 
2.47.0



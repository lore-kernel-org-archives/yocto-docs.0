Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BA9DC87FCC
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 09:57:00 +0000 (UTC)
Received: from relay15.mail.gandi.net (relay15.mail.gandi.net [217.70.178.235])
 by mx.groups.io with SMTP id smtpd.web10.3370.1753783014562132703
 for <docs@lists.yoctoproject.org>;
 Tue, 29 Jul 2025 02:56:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=H8MyVyxH;
 spf=pass (domain: bootlin.com, ip: 217.70.178.235, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2361E4422C;
	Tue, 29 Jul 2025 09:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753783013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eHu4LZ7lUxHRmr2oXThFEnNvBAtw2NSTvIGNx9g1f2s=;
	b=H8MyVyxHxogXajNlmM3uFJ2EWWa4r2jLOIXfTPs9OfOrTf+ilKwkeUFnvh/8fSERidM88F
	a6SoLHZJX7h0Utjogj+8XDTE8IG6keR3bkv/bXpYQz+oaBVroCVVO3VtD8cQRjHZP6gTuC
	+kcERRG9Evy3ReZHWKYNLHqZYazxF6jLVs2+0Pv68eshqkEdMwpxrDlHi1npWLSTyWih05
	uMNXzh1XzlwhjMxvtwfG1z/UhWagfQaPeKsP7CY8aAbhjiNrww/Y1T+PLYhA/2ot2Tk6fY
	FAvUnRwKafNNconwlZoFtkxDWcVslY71mo7ZKsc1VqZFzd06J3zCeNGrPkLkHg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 29 Jul 2025 11:56:52 +0200
Subject: [PATCH 18/19] docs-wide: fix space around equal assignments
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250729-release-note-5-3-first-bunch-v1-18-058971e37c93@bootlin.com>
References: <20250729-release-note-5-3-first-bunch-v1-0-058971e37c93@bootlin.com>
In-Reply-To: <20250729-release-note-5-3-first-bunch-v1-0-058971e37c93@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5839;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=gXz0BqXYHqmTBhuRi1RJo/OSAorV2jQDqqz4NDZjKv0=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBoiJrgvWaQFO9IR62q/l3uP2W5TiPy4mVQwSXD3
 6CDjHOkSIWJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaIia4AAKCRDRgEFAKaOo
 NiF1EAChIwXylFQmtNJ2crFj3AyjmT8YCvGC+fqzY5Ay98RUygx+HZnzD5X8Vshdgw8wX6EOHVr
 fc2IViUimrTdsys+byPNfUKLYKFhgdn+Ec6YMKzPQNF1WZkbQdK44VuITgHuSroMMIb6ViArzd5
 rqxEg+NNy3qhPvZP+cfWYSZxiOw/RVWlxq6yYHReQnjJv29UX6iMQ4RHK6zBN1t+PCG3uQfyLoE
 OWrFrdMcDrD2C+sffFi35EKTYpvHQ95XIxcqgcoEdycg2m6M9lv+FhaPrtuYStLSf+A3DrMdjgM
 FVc36OpOWh1DPg21TAUCS6K2/vpbGrQYwIIEQBISmMF/nxLunL767afUBgisvIv9PHvlZtHrY/g
 xdi2WVfVAwfzr42+vKXYdrjN8EbFPyAh1PWGGkI2ZgUaGizZQrIgPyfd+ux6WHMrdOH98xfY+p/
 +t0BJYZcQd01dwvrgIBUDLx6OVm/kdDqWJqio4KML7gA5fwsaJv9rE0ZqLDDBYnUAuETNX3SCTo
 Ku40wpuhTbtiG8U8qiRM2HRw+iou0OdDtC1VItNkVZQL5fCXSJuwQRy7eb7TW65tApti8gtX9f8
 f/UfOEJeslnLo9Gd3eyl0wk8NEN4p+t30t9rpC6tstvIjWlpbhNK9cOQAuD4olfQad9B3pyCk49
 AIH7oec593koHgQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelgeejhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudelteeiffffjeeghffhffejffdtgeefgfdtjeelleefhedvjeegtdfftddtfeeknecuffhomhgrihhnpehgihhthhhusgdrtghomhdpvghlihhnuhigrdhorhhgnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrt
 ghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 29 Jul 2025 09:57:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7410

Since commit 24772dd2ae6c ("parse/ConfHandler: Add warning for
deprecated whitespace usage") in BitBake, a warning is printed when
there are no spaces around an `=` assignment.

Adjust the documentation to show good examples only.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/building.rst   | 8 ++++----
 documentation/dev-manual/layers.rst     | 2 +-
 documentation/dev-manual/new-recipe.rst | 2 +-
 documentation/dev-manual/qemu.rst       | 4 ++--
 documentation/ref-manual/variables.rst  | 6 +++---
 5 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/documentation/dev-manual/building.rst b/documentation/dev-manual/building.rst
index 32c7aa5da..04c150094 100644
--- a/documentation/dev-manual/building.rst
+++ b/documentation/dev-manual/building.rst
@@ -243,9 +243,9 @@ Bundling an Initramfs Image From a Separate Multiconfig
 
 There may be a case where we want to build an :term:`Initramfs` image which does not
 inherit the same distro policy as our main image, for example, we may want
-our main image to use ``TCLIBC="glibc"``, but to use ``TCLIBC="musl"`` in our :term:`Initramfs`
+our main image to use ``TCLIBC = "glibc"``, but to use ``TCLIBC = "musl"`` in our :term:`Initramfs`
 image to keep a smaller footprint. However, by performing the steps mentioned
-above the :term:`Initramfs` image will inherit ``TCLIBC="glibc"`` without allowing us
+above the :term:`Initramfs` image will inherit ``TCLIBC = "glibc"`` without allowing us
 to override it.
 
 To achieve this, you need to perform some additional steps:
@@ -255,8 +255,8 @@ To achieve this, you need to perform some additional steps:
    For the sake of simplicity let's assume such multiconfig is called: ``initramfscfg.conf`` and
    contains the variables::
 
-      TMPDIR="${TOPDIR}/tmp-initramfscfg"
-      TCLIBC="musl"
+      TMPDIR = "${TOPDIR}/tmp-initramfscfg"
+      TCLIBC = "musl"
 
 #. *Set additional Initramfs variables on your main configuration:*
    Additionally, on your main configuration (``local.conf``) you need to set the
diff --git a/documentation/dev-manual/layers.rst b/documentation/dev-manual/layers.rst
index 67482bf54..fbf3f1a33 100644
--- a/documentation/dev-manual/layers.rst
+++ b/documentation/dev-manual/layers.rst
@@ -609,7 +609,7 @@ file is in the layer at ``recipes-graphics/xorg-xserver``::
        file://xorg.conf.d/99-calibration.conf \
    "
    do_install:append:rpi () {
-       PITFT="${@bb.utils.contains("MACHINE_FEATURES", "pitft", "1", "0", d)}"
+       PITFT = "${@bb.utils.contains("MACHINE_FEATURES", "pitft", "1", "0", d)}"
        if [ "${PITFT}" = "1" ]; then
            install -d ${D}/${sysconfdir}/X11/xorg.conf.d/
            install -m 0644 ${UNPACKDIR}/xorg.conf.d/98-pitft.conf ${D}/${sysconfdir}/X11/xorg.conf.d/
diff --git a/documentation/dev-manual/new-recipe.rst b/documentation/dev-manual/new-recipe.rst
index 832aa300e..aa4fb97a4 100644
--- a/documentation/dev-manual/new-recipe.rst
+++ b/documentation/dev-manual/new-recipe.rst
@@ -298,7 +298,7 @@ a ``+`` sign in its definition. Here is an example from the recipe
    SRC_URI = "git://github.com/stevenhoneyman/l3afpad.git;branch=master;protocol=https"
 
    PV = "0.8.18.1.11+git"
-   SRCREV ="3cdccdc9505643e50f8208171d9eee5de11a42ff"
+   SRCREV = "3cdccdc9505643e50f8208171d9eee5de11a42ff"
 
 If your :term:`SRC_URI` statement includes URLs pointing to individual files
 fetched from a remote server other than a version control system,
diff --git a/documentation/dev-manual/qemu.rst b/documentation/dev-manual/qemu.rst
index 92c93a82a..9e0b8b813 100644
--- a/documentation/dev-manual/qemu.rst
+++ b/documentation/dev-manual/qemu.rst
@@ -424,9 +424,9 @@ command line:
    in the :term:`Build Directory` ``deploy/image`` directory.
    Examples::
 
-      QB_SLIRP_OPT="-netdev user,id=net0,hostfwd=tcp::8080-:80"
+      QB_SLIRP_OPT = "-netdev user,id=net0,hostfwd=tcp::8080-:80"
 
-      QB_SLIRP_OPT="-netdev user,id=net0,hostfwd=tcp::8080-:80,hostfwd=tcp::2222-:22"
+      QB_SLIRP_OPT = "-netdev user,id=net0,hostfwd=tcp::8080-:80,hostfwd=tcp::2222-:22"
 
    The first example forwards TCP port 80 from the emulated system to
    port 8080 (or the next free port) on the host system,
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index cefbfd096..e4d5a9c97 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3360,7 +3360,7 @@ system and gives an overview of their function and contents.
       Here is an example setting "0x400000000" as a load address::
 
          FIT_ADDRESS_CELLS = "2"
-         UBOOT_LOADADDRESS= "0x04 0x00000000"
+         UBOOT_LOADADDRESS = "0x04 0x00000000"
 
       See `more details about #address-cells <https://elinux.org/Device_Tree_Usage#How_Addressing_Works>`__.
 
@@ -4101,7 +4101,7 @@ system and gives an overview of their function and contents.
       The :ref:`rootfs-postcommands <ref-classes-rootfs*>` class defines the manifest
       file as follows::
 
-         IMAGE_MANIFEST ="${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.manifest"
+         IMAGE_MANIFEST = "${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.manifest"
 
       The location is
       derived using the :term:`IMGDEPLOYDIR`
@@ -10496,7 +10496,7 @@ system and gives an overview of their function and contents.
       Here is an example setting "0x400000000" as a load address::
 
          UBOOT_FIT_ADDRESS_CELLS = "2"
-         UBOOT_LOADADDRESS= "0x04 0x00000000"
+         UBOOT_LOADADDRESS = "0x04 0x00000000"
 
       See `more details about #address-cells <https://elinux.org/Device_Tree_Usage#How_Addressing_Works>`__.
 

-- 
2.50.1



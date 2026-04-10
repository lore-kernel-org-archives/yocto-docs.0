Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD223E99073
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 09:48:20 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.152539.1775814496041112115
 for <docs@lists.yoctoproject.org>;
 Fri, 10 Apr 2026 02:48:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=d8tQ3JwH;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 97AFCC5C1A4
	for <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 09:48:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 81264603F0
	for <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 09:48:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C38CD104509AF;
	Fri, 10 Apr 2026 11:48:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775814493; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vVTeW/iFNUXeqd2YKqNR3UpQY7MkgQ7+2lIrPAQusiI=;
	b=d8tQ3JwH2bYomTco4ib2rsfoxQYzPUwga3OJ9ChNtkdQvAoTAk955EvocRhgQoeWEABSIj
	/Nm8ln3q/Cmm3W/wXcLjHTGq5opKwjsr/PPj3xPKwrTyM8AI7WvViR2AQ+6JRpvJwfGC7/
	OQ3wzjsISb84kKhLM2C7b7qFWVwCFbDPB9rnX/oo9q93CiXkfopBHlhYWG9FXTwFeIP4RK
	AALoxptGwqIkGIJ+IvW8Nj7X3V++SMp7Q7CsEpC+PdBMPhuJ84/YHQ2PAEvy3Q8A38VsNu
	5vaXmkcHilYL70XIGvy3BjNX9S/Xyl9Yghaz5tLpWLyAZbgKBqdf5cI1UNLBsQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 10 Apr 2026 11:48:04 +0200
Subject: [PATCH 5/5] ref-manual/system-requirements.rst: add section for
 openSUSE Leap 16.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-update-new-supported-releases-v1-5-fc53a1fbbdac@bootlin.com>
References: <20260410-update-new-supported-releases-v1-0-fc53a1fbbdac@bootlin.com>
In-Reply-To: <20260410-update-new-supported-releases-v1-0-fc53a1fbbdac@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4492;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=wRGZf/ohKUA0koeIVQUA7n3EexFTQif7NJT8rbPq4jw=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp2MdZFRdISExGkAVhideC2MchlKGDFifFsKscY
 81NBKm08E2JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCadjHWQAKCRDRgEFAKaOo
 NnOsD/9Kp5ery1SY639E9EWmbBag4WtgWIXOQzQmw9u9FUzx78rgoa4Be/60vOfFrw4N2OWGA1q
 vH6knOSKLajn2nd0nrCeFwnkQE2CrwrcF9Qefm7vi7ezwdv2eIxh6Buoht8y5hnmw/fedyM6+xT
 xQtS2b1aoSKnLcm5APwjh9XNn2BM3FJINeOnq6VQ2uU2o3Qn3WuMEALhqM7ia+hVWdAqSsx8wOu
 K+8NPDaB+PUsKBze+tIuePV2ijBMmV/kmmKYZ3UFN7Sa5olPSnrFeOJb2MP8qGJpTqnLpy7b84p
 cfFfj4spD5+DUAFnC0g0VbhVBzxxdPSecagS7u27ClQBorjNgwX7mdO+3sB8LkRwM7TGp9aU7RE
 u5MKFgNGp7YrwW96l9vAH9ArhMgZgcO/oUPuq4pCbfDkBQP1TAIL2VcmV2j+7PgRtS+P0cBj7cW
 vbuGIIDo/SnCulWBOOS2wiI0+bWM1zNPK+ea/3eHz9qFzC5c7AactXNh9FQX+S1HMl7//dUdNi8
 BLnzddXmEM97PIcDxrhkXdln+eRycSSMe5c/fYnjMw4GBsd1O9aeop/8UZOdqjjjceG0wrCJ0GT
 qV0w2+22rKVTJDhgiX9TY24dmCxomnY0UtWBOwshkDwxILPp3paKehbxFh2isKXEs1TbRvHlz0D
 y6fi9YoXENjRXRA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 09:48:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9219

Add a section for openSUSE Leap 16.0. Some packages for 15.6 do not
exist for 16.0, so separate the install scripts for each.

The diff between the essential packages for 15.6 and 16.0 is the
following:

--- a/opensuse_essential_15.6.sh
+++ b/opensuse_essential_16.0.sh
@@ -10,14 +10,13 @@ libacl1
 make
 makeinfo
 patch
-python
-python-curses
-python-xml
 python3
+python3-GitPython
 python3-Jinja2
 python3-curses
 python3-pexpect
 python3-pip
+python3-xml
 rpcgen
 socat
 tar

With the pip3 install command removed for GitPython, as we can now use
the dedicated python3-GitPython package.

The list for the docs and pdf build have not changed.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/system-requirements.rst   | 34 +++++++++++++++++++---
 documentation/tools/build-docs-container           | 10 ++++++-
 ...use_essential.sh => opensuse_essential_15.6.sh} |  0
 .../opensuse_essential_16.0.sh                     |  1 +
 4 files changed, 40 insertions(+), 5 deletions(-)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index e94825958..958ea72d6 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -203,13 +203,39 @@ documentation in PDF format:
 .. literalinclude:: ../tools/host_packages_scripts/fedora_docs_pdf.sh
    :language: shell
 
-openSUSE Packages
------------------
+openSUSE Leap Packages
+----------------------
+
+openSUSE Leap 15.6 Packages
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Here are the packages needed to build an image on a headless system
+with a supported openSUSE Leap 15.6 distribution:
+
+.. literalinclude:: ../tools/host_packages_scripts/opensuse_essential_15.6.sh
+   :language: shell
+
+Here are the packages needed to build Project documentation manuals:
+
+.. literalinclude:: ../tools/host_packages_scripts/opensuse_docs.sh
+   :language: shell
+
+.. literalinclude:: ../tools/host_packages_scripts/pip3_docs.sh
+   :language: shell
+
+In addition to the previous packages, here are the packages needed to build the
+documentation in PDF format:
+
+.. literalinclude:: ../tools/host_packages_scripts/opensuse_docs_pdf.sh
+   :language: shell
+
+openSUSE Leap 16.0 Packages
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 Here are the packages needed to build an image on a headless system
-with a supported openSUSE distribution:
+with a supported openSUSE Leap 16.0 distribution:
 
-.. literalinclude:: ../tools/host_packages_scripts/opensuse_essential.sh
+.. literalinclude:: ../tools/host_packages_scripts/opensuse_essential_16.0.sh
    :language: shell
 
 Here are the packages needed to build Project documentation manuals:
diff --git a/documentation/tools/build-docs-container b/documentation/tools/build-docs-container
index 4fe0cba63..a540e81ec 100755
--- a/documentation/tools/build-docs-container
+++ b/documentation/tools/build-docs-container
@@ -126,7 +126,15 @@ main ()
     "leap:15.6"*)
       image=opensuse/leap:$version
       containerfile=Containerfile.zypper
-      essential=opensuse_essential.sh
+      essential=opensuse_essential_15.6.sh
+      docs=opensuse_docs.sh
+      docs_pdf=opensuse_docs_pdf.sh
+      pip3=pip3_docs.sh
+      ;;
+    "leap:16.0"*)
+      image=opensuse/leap:$version
+      containerfile=Containerfile.zypper
+      essential=opensuse_essential_16.0.sh
       docs=opensuse_docs.sh
       docs_pdf=opensuse_docs_pdf.sh
       pip3=pip3_docs.sh
diff --git a/documentation/tools/host_packages_scripts/opensuse_essential.sh b/documentation/tools/host_packages_scripts/opensuse_essential_15.6.sh
similarity index 100%
rename from documentation/tools/host_packages_scripts/opensuse_essential.sh
rename to documentation/tools/host_packages_scripts/opensuse_essential_15.6.sh
diff --git a/documentation/tools/host_packages_scripts/opensuse_essential_16.0.sh b/documentation/tools/host_packages_scripts/opensuse_essential_16.0.sh
new file mode 100644
index 000000000..e557ae4fb
--- /dev/null
+++ b/documentation/tools/host_packages_scripts/opensuse_essential_16.0.sh
@@ -0,0 +1 @@
+sudo zypper install bzip2 chrpath diffstat gcc gcc-c++ git gzip hostname libacl1 make makeinfo patch python3 python3-GitPython python3-Jinja2 python3-curses python3-pexpect python3-pip python3-xml rpcgen socat tar wget which xz zstd

-- 
2.53.0



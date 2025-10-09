Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80C97CCD188
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 07:26:45 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web11.6363.1759994802814638546
 for <docs@lists.yoctoproject.org>;
 Thu, 09 Oct 2025 00:26:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=0YwelhH0;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 705F94E40FAA
	for <docs@lists.yoctoproject.org>; Thu,  9 Oct 2025 07:26:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 40E2F6062C
	for <docs@lists.yoctoproject.org>; Thu,  9 Oct 2025 07:26:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 90691102F21C1;
	Thu,  9 Oct 2025 09:26:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759994800; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TDE8mmeGwbIfdzuIE8K/6Qe5onXLdRcXODAC+weUxbw=;
	b=0YwelhH0sWtfn2+Xk8yo43xro2V0ziENNSMQeFkfssD3ucyU9XB8YrpIhpcqBh36bljhWC
	mjMQpLDKUdbgynsp8Hv7Y+YZhKbZh0Z2vsyFatIH49JnuFa/b6vJEOrHCLrofVxM/rkXW7
	gcRj0gEKEBJX07WrQ9ZiQiHQE7cfKfZdzst5tpn1EiDs4L8aTylQL3oaYN5avp+ZjaR7vk
	2q+An8qQ/KuwG0gaf79dBSggfiHGGlIipojZWm9IhbOHnfsQJlby/zXSrpyBM/zF2xfxkT
	vtdzn+U4LHcpOX/wITk9HZaEjWQYZBlMsE9naGMSDI0yJ9Y3HuwNiNtuwiqEnQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 09 Oct 2025 09:26:32 +0200
Subject: [PATCH v2 1/2] tools/build-docs-container: add option to install
 essential packages
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251009-build-docs-container-essentials-v2-1-f135032bb43d@bootlin.com>
References: <20251009-build-docs-container-essentials-v2-0-f135032bb43d@bootlin.com>
In-Reply-To: <20251009-build-docs-container-essentials-v2-0-f135032bb43d@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6518;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=Nx9I2I3vWCfMGKdNJxhtjjdB+OB+sPQ39/tCILstzqA=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBo52OutvuQ1UBqKc2jv0TS1Edx8kdJB4RP+rBl5
 HxijTPUPgGJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaOdjrgAKCRDRgEFAKaOo
 NqxpD/9UxCARYILHoBUsLx5uJFltqo5rc3OCT3vrPStfKHjJxMcwWXTL3DJXxaZhR0OU3LykQyI
 Dohp94RNcoiHsapS65tSCzVzjSPThCfhRv1CNjIbiALLAGCKgK2I1/7VB1eNtNyRr96F711XvLq
 VXEsOiDywjCHexN9GBc5VSy7p/cFepzBZ5WaGXNd77Rv9JfxgGXtySL93e5H3/lf/6OVn9uRE2K
 cOkITd7fWyfha3ft2qvUPt+R88rYIQ2pyzVkHcWx/ce4HJjAdJIy/C/+1zw5GbFdWPn7G7tmOVd
 Yafru4U/wp474cud04yd/+Za55OV0+3JOPINrb+2vbLY0JRksLmqiTyo2YoMre70W4aB5Ij9DWT
 bn9nyvwVDcKJK8dSjeLg2ZnpfjfKmwy6bJH24yKs7tRi0nruN995YLzvo/8UYhEWcutuMlvedu6
 SGcdE7SVkxo4t/yOtccn44qasp/RxEtieK8/qOnKGHbdo2UsYt5CPQQAsKdRWr1KyshuQjJDRW4
 n2F5tuWI9PBgDQ2uxvWQcIQKkB44HBKnNuHIxua3W6aOI1J5Q4a0GhPjNndnMZRrZS5vzGe5eO5
 47TYR9OjMr3pJeTHt8i6nXXnjILe3/ynY+xceDewK4hjoBpaXscQCUzVuQIzu89kvFsWdnicEjh
 FlwLLWRSVIhG9rg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 09 Oct 2025 07:26:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7666

The script currently only installs the files necessary to build the
docs. Since we also have the essential packages listed it can be useful
to include them in the containers, at least to validate that these
successfully install.

Add an env variable for including these packages in the container. The
default is to not include these, so the current behavior is unchanged.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/tools/Containerfile.apt    |  4 ++++
 documentation/tools/Containerfile.dnf    |  4 ++++
 documentation/tools/Containerfile.zypper |  4 ++++
 documentation/tools/build-docs-container | 17 +++++++++++++++++
 4 files changed, 29 insertions(+)

diff --git a/documentation/tools/Containerfile.apt b/documentation/tools/Containerfile.apt
index 5e30b65eb..a573786f0 100644
--- a/documentation/tools/Containerfile.apt
+++ b/documentation/tools/Containerfile.apt
@@ -1,6 +1,8 @@
 ARG ARG_FROM=debian:12 # default value to avoid warning
 FROM $ARG_FROM
 
+ARG INCLUDE_ESSENTIAL_PACKAGES=0
+ARG ESSENTIAL=ubuntu_essential.sh
 ARG DOCS=ubuntu_docs.sh
 ARG DOCS_PDF=ubuntu_docs_pdf.sh
 
@@ -8,12 +10,14 @@ ENV DEBIAN_FRONTEND=noninteractive
 ARG TZ=Europe/Vienna
 
 # relative to the location of the dockerfile
+COPY --chmod=777 ${ESSENTIAL} /temp/host_packages_essential.sh
 COPY --chmod=777 ${DOCS} /temp/host_packages_docs.sh
 COPY --chmod=777 ${DOCS_PDF} /temp/host_packages_docs_pdf.sh
 
 RUN ln -fs "/usr/share/zoneinfo/$TZ" /etc/localtime \
  && apt-get update \
  && apt-get install -y sudo \
+ && if [ "$INCLUDE_ESSENTIAL_PACKAGES" = "1" ]; then yes | /temp/host_packages_essential.sh; fi \
  && yes | /temp/host_packages_docs.sh \
  && yes | /temp/host_packages_docs_pdf.sh \
  && apt-get --yes autoremove \
diff --git a/documentation/tools/Containerfile.dnf b/documentation/tools/Containerfile.dnf
index 3dae74445..65c526705 100644
--- a/documentation/tools/Containerfile.dnf
+++ b/documentation/tools/Containerfile.dnf
@@ -1,17 +1,21 @@
 ARG ARG_FROM=fedora:40 # default value to avoid warning
 FROM $ARG_FROM
 
+ARG INCLUDE_ESSENTIAL_PACKAGES=0
+ARG ESSENTIAL=fedora_essential.sh
 ARG DOCS=fedora_docs.sh
 ARG DOCS_PDF=fedora_docs_pdf.sh
 ARG PIP3=pip3_docs.sh
 
 # relative to the location of the dockerfile
+COPY --chmod=777 ${ESSENTIAL} /temp/host_packages_essential.sh
 COPY --chmod=777 ${DOCS} /temp/host_packages_docs.sh
 COPY --chmod=777 ${DOCS_PDF} /temp/host_packages_docs_pdf.sh
 COPY --chmod=777 ${PIP3} /temp/pip3_docs.sh
 
 RUN dnf update -y \
  && dnf install -y sudo \
+ && if [ "$INCLUDE_ESSENTIAL_PACKAGES" = "1" ]; then yes | /temp/host_packages_essential.sh; fi \
  && yes | /temp/host_packages_docs.sh \
  && yes | /temp/host_packages_docs_pdf.sh \
  && yes | /temp/pip3_docs.sh \
diff --git a/documentation/tools/Containerfile.zypper b/documentation/tools/Containerfile.zypper
index f27ad1b47..3850b9ff9 100644
--- a/documentation/tools/Containerfile.zypper
+++ b/documentation/tools/Containerfile.zypper
@@ -1,11 +1,14 @@
 ARG ARG_FROM=opensuse/leap:15.4 # default value to avoid warning
 FROM $ARG_FROM
 
+ARG INCLUDE_ESSENTIAL_PACKAGES=0
+ARG ESSENTIAL=opensuse_essential.sh
 ARG DOCS=opensuse_docs.sh
 ARG DOCS_PDF=opensuse_docs_pdf.sh
 ARG PIP3=pip3_docs.sh
 
 # relative to the location of the dockerfile
+COPY --chmod=777 ${ESSENTIAL} /temp/host_packages_essential.sh
 COPY --chmod=777 ${DOCS} /temp/host_packages_docs.sh
 COPY --chmod=777 ${DOCS_PDF} /temp/host_packages_docs_pdf.sh
 COPY --chmod=777 ${PIP3} /temp/pip3_docs.sh
@@ -20,6 +23,7 @@ RUN for script in /temp/*.sh; do \
 
 RUN zypper update -y \
  && zypper install -y sudo \
+ && if [ "$INCLUDE_ESSENTIAL_PACKAGES" = "1" ]; then yes | /temp/host_packages_essential.sh; fi \
  && yes | /temp/host_packages_docs.sh \
  && yes | /temp/host_packages_docs_pdf.sh \
  && yes | /temp/pip3_docs.sh \
diff --git a/documentation/tools/build-docs-container b/documentation/tools/build-docs-container
index 70e05f295..615e83d6c 100755
--- a/documentation/tools/build-docs-container
+++ b/documentation/tools/build-docs-container
@@ -24,6 +24,7 @@ SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
 CONTAINERCMD=${CONTAINERCMD:-docker}
 DOCS_DIR="$SCRIPT_DIR/../.."
 SH_DIR="$SCRIPT_DIR/host_packages_scripts"
+INCLUDE_ESSENTIAL_PACKAGES=${INCLUDE_ESSENTIAL_PACKAGES:-0}
 
 function usage()
 {
@@ -49,6 +50,16 @@ $0 OCI_IMAGE [make arguments...]
    documentation/Makefile, see that file for what's supported. This is typically
    intended to be used to provide specific make targets.
    Default: publish
+
+   Environment variables:
+
+   - CONTAINERCMD can be set to 'docker' or 'podman' to select the
+     container engine (default: 'docker').
+
+   - INCLUDE_ESSENTIAL_PACKAGES can be set to 0 or 1 to also include essential
+     packages listed in documentation/tools/host_packages_scripts/*_essential.sh.
+     This is not required to build the documentation but can be useful to validate
+     the installation of packages listed in these files (default: 0).
 "
 }
 
@@ -85,6 +96,7 @@ main ()
     "debian:12"*|\
     "debian:13"*)
       containerfile=Containerfile.debian
+      essential=ubuntu_essential.sh
       docs=ubuntu_docs.sh
       docs_pdf=ubuntu_docs_pdf.sh
       ;;
@@ -93,6 +105,7 @@ main ()
     "fedora:41"*|\
     "fedora:42"*)
       containerfile=Containerfile.fedora
+      essential=fedora_essential.sh
       docs=fedora_docs.sh
       docs_pdf=fedora_docs_pdf.sh
       pip3=pip3_docs.sh
@@ -119,6 +132,7 @@ main ()
     # "leap:15.6"*)
       image=opensuse/leap:$version
       containerfile=Containerfile.zypper
+      essential=opensuse_essential.sh
       docs=opensuse_docs.sh
       docs_pdf=opensuse_docs_pdf.sh
       pip3=pip3_docs.sh
@@ -129,6 +143,7 @@ main ()
     "ubuntu:24.04"*|\
     "ubuntu:25.04"*)
       containerfile=Containerfile.ubuntu
+      essential=ubuntu_essential.sh
       docs=ubuntu_docs.sh
       docs_pdf=ubuntu_docs_pdf.sh
       ;;
@@ -142,6 +157,8 @@ main ()
   $OCI build \
     --tag "yocto-docs-$sanitized_dockername:latest" \
     --build-arg ARG_FROM="docker.io/$image" \
+    --build-arg INCLUDE_ESSENTIAL_PACKAGES="${INCLUDE_ESSENTIAL_PACKAGES}" \
+    --build-arg ESSENTIAL="$essential" \
     --build-arg DOCS="$docs" \
     --build-arg DOCS_PDF="$docs_pdf" \
     --build-arg PIP3="${pip3:-}" \

-- 
2.51.0



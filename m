Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75BEBCCA471
	for <webhook@archiver.kernel.org>; Fri,  3 Oct 2025 15:07:41 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web10.9915.1759504052668512526
 for <docs@lists.yoctoproject.org>;
 Fri, 03 Oct 2025 08:07:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ICFU2yc3;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3FF021A1061
	for <docs@lists.yoctoproject.org>; Fri,  3 Oct 2025 15:07:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 079C960683
	for <docs@lists.yoctoproject.org>; Fri,  3 Oct 2025 15:07:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BC226102F1C37;
	Fri,  3 Oct 2025 17:07:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759504050; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=vmWDbDPGRZJ2cNuDp1gQW3OPcP6fid3dAV7GYO6mqNg=;
	b=ICFU2yc3xMo1eQUcLI/lREEu1usCIw3zyVabFR5Er6FRrzsZjee1/fsmDTEuZGNzKd8CwJ
	2th+QhvA9usImn9Q07nlvBNgXOHPmTGdZNdcS/2LqX5t4nnOGD+/+Q8wSgqVmC87Aj+STB
	rDYDZfsbE6vp8Vz5mEatTnHX1DYyFQHfC039S8iF+hU2HfTcPXK1SYPFS1t7G+7qb0XjA/
	xXfGbRCwgd1QK1y9nz0I7UFjS2h+qxrGKpWqbAwrAPvr+Obst3PPFs17zyhLY5SFz8BwrJ
	telm5a+h1fBPusTrlItpMOMmicreue8DYDsjtRNOaZHfqus5h19URBlajX/BBg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 03 Oct 2025 17:07:19 +0200
Subject: [PATCH] tools/build-docs-container: add optional option for
 essential packages
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251003-build-docs-container-essentials-v1-1-558fb531a9c7@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAKbm32gC/x3NQQqDMBBG4avIrB2IWhV6leIiJr92QCYlo1IQ7
 97Q5bd57yJDFhg9q4syTjFJWtDUFYW31xUssZha1/aNcx3Ph2yRYwrGIenuRZEZZtBd/GY8+Ni
 7eUT3GEYqlU/GIt//4TXd9w+ujo0mcQAAAA==
X-Change-ID: 20251003-build-docs-container-essentials-6ad50b7e3467
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6701;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=D+05yXyRNhkQ7rMbTsuoguYMz7uVsYqFtF7fphqcN6c=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBo3+axR7e+rvIRYOpiJmrEaQvhYlk/XYJPO6rnm
 qrNMsnWK8yJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaN/msQAKCRDRgEFAKaOo
 NvCiD/9SIHVODoNdLX9K14wV9B4KJquykSUOweJ1kiTCJaHZBSTPCF3qRAmphI62944p3JeP+VS
 ZP548kuI0K3WJT6NS7D6c38hydRDFLKxaUua6EDdrH0Grn0PD2wuVP5uKrzzi9YqxPg2htU3Rd3
 0//kN0NL0eAv89rjfdl8Y+VuyH4KnED1bZR26nTt80GtPn0maMNh2Vi86g58Ct7wa8MPAGa51Xn
 Sp9G1clZJbT+9tQVVCtiNpr2RQSrDstxQgjmFJoiHKRUqIvzW+Kt2ERrFkeLircWZ3Cj+Dbj0NZ
 Ir5YqNN9sC9gTEZ/cwVOAjjeI1s6mod/OLx8ck6JRGC0a9bSqrBSfXBmmmSUVp7oBdn5wD3jfMO
 p07fa/qx7bBwCz5YxI4c+glisUutpFA1gAQ0+h1eaBpvRkoHlAGT5mHi7zRZnv/9FVfWoZf/erK
 ONNGqdpLXZVLVzAy/F7XdLD1TA7+odd30C13V/qI+m5Bl0CoxErHqjJyRr3UkilobNOpmcKTBxh
 r0Vo+vQ6aELalivMvrYXfM1KBbTr1Xb0vWwMLp7qEObbNucAFFo91zvR9sF+dlVrB+u8yHjD/0I
 JXXDyrxVieEqMvRKDDLYKBVkNuR5g5gFLzleHD+gOsSUFu8kpDgtgROctEzTxNgFRNQgNIjQSV7
 vCHYC/FLGaT5EIQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 03 Oct 2025 15:07:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7642

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
index 6b4d42543..704731232 100755
--- a/documentation/tools/build-docs-container
+++ b/documentation/tools/build-docs-container
@@ -24,6 +24,7 @@ SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
 CONTAINERCMD=${CONTAINERCMD:-docker}
 DOCS_DIR="$SCRIPT_DIR/../.."
 SH_DIR="$SCRIPT_DIR/host_packages_scripts"
+INCLUDE_ESSENTIAL_PACKAGES=${INCLUDE_ESSENTIAL_PACKAGES:-0}
 
 function usage()
 {
@@ -46,6 +47,16 @@ $0 OCI_IMAGE [make arguments...]
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
 
@@ -81,6 +92,7 @@ main ()
     # "debian:11"*|\
     "debian:12"*)
       containerfile=Containerfile.debian
+      essential=ubuntu_essential.sh
       docs=ubuntu_docs.sh
       docs_pdf=ubuntu_docs_pdf.sh
       ;;
@@ -88,6 +100,7 @@ main ()
     "fedora:39"*|\
     "fedora:40"*)
       containerfile=Containerfile.fedora
+      essential=fedora_essential.sh
       docs=fedora_docs.sh
       docs_pdf=fedora_docs_pdf.sh
       pip3=pip3_docs.sh
@@ -114,6 +127,7 @@ main ()
     # "leap:15.6"*)
       image=opensuse/leap:$version
       containerfile=Containerfile.zypper
+      essential=opensuse_essential.sh
       docs=opensuse_docs.sh
       docs_pdf=opensuse_docs_pdf.sh
       pip3=pip3_docs.sh
@@ -126,6 +140,7 @@ main ()
     "ubuntu:22.04"*|\
     "ubuntu:24.04"*)
       containerfile=Containerfile.ubuntu
+      essential=ubuntu_essential.sh
       docs=ubuntu_docs.sh
       docs_pdf=ubuntu_docs_pdf.sh
       ;;
@@ -139,6 +154,8 @@ main ()
   $OCI build \
     --tag "yocto-docs-$sanitized_dockername:latest" \
     --build-arg ARG_FROM="docker.io/$image" \
+    --build-arg INCLUDE_ESSENTIAL_PACKAGES="${INCLUDE_ESSENTIAL_PACKAGES}" \
+    --build-arg ESSENTIAL="$essential" \
     --build-arg DOCS="$docs" \
     --build-arg DOCS_PDF="$docs_pdf" \
     --build-arg PIP3="${pip3:-}" \

---
base-commit: a84c234acfedfa714419006c743405e2f9acaedc
change-id: 20251003-build-docs-container-essentials-6ad50b7e3467

Best regards,
--  
Antonin Godard <antonin.godard@bootlin.com>



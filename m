Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2FEECAC5B0
	for <webhook@archiver.kernel.org>; Fri,  3 Oct 2025 07:34:18 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web10.2335.1759476856777591308
 for <docs@lists.yoctoproject.org>;
 Fri, 03 Oct 2025 00:34:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=txzg0GBE;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 811F9C00DA0
	for <docs@lists.yoctoproject.org>; Fri,  3 Oct 2025 07:33:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 809AC606E5
	for <docs@lists.yoctoproject.org>; Fri,  3 Oct 2025 07:34:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A5214102F1C37;
	Fri,  3 Oct 2025 09:34:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759476855; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+nzu2/Vr10/smgHEc3fiqG6YomTLK/OhBoZdNJqgp+E=;
	b=txzg0GBE6L8WMft5xMYw9284WgMVX6TLYIdq6pguKHScXqhnJdokYy3OtmYYs0Esl8b8u7
	t2yPD3G+VGJvRAcmTiDfvOkwP6ibT/Qge2T5GhXF87VrL2SJT+8w41zlU40p2H/Z+xmVpP
	/AtIqfYBHIUXXcC9kh/Q0LOvxP/pBlH6IpeomZyTH/mrMQM54BbuZKtsZJHaOjWqFTncgZ
	shTUzUTm135Q7VbvIS4IfWTvbVsPul0J8OXtVed2Fntf5idfJfrnWf0j4TeJG7x+cCt4n+
	4zcNiWfVUq4w+QmP/bs+F2nGCJt8S1tiM36miBTQv/QLasw1DeDoqxHGCUg5JQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 03 Oct 2025 09:33:27 +0200
Subject: [PATCH 4/4] tools/build-docs-container: update with newly
 supported distros
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251003-update-tested-distros-v1-4-240e2da1af5e@bootlin.com>
References: <20251003-update-tested-distros-v1-0-240e2da1af5e@bootlin.com>
In-Reply-To: <20251003-update-tested-distros-v1-0-240e2da1af5e@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2195;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=3NFcIo3ls1sN1ZRdBJjDBNKuLGWMKv8oqbY40/4wPck=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBo33xuu7m12LQCec/oNFB5mTpQ2nl0LjIFeTZHZ
 y9LUF9da6SJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaN98bgAKCRDRgEFAKaOo
 Npf1EACCmHbM4RLqgVxu+bd6Yc+VvNfsXj0/1uOG5gGcZBQnBVH+ct7qzXWwvtZoR1xFSuP8nfK
 PGRIbZ3Z5OrLM0FSEdjQnjZX6nZhavQb9SmjSvUJcwoqFcoEKEraP7LHIC49QV8vO7pZ/UzbE/Y
 iBt/82tm6Ohub01mert5916sli1RgDXSKjBPMZiHcTqEV1qQObe4Znj84M3GJLjTG57LXu7vusj
 01SaGq6bZNsRyTF9DlmOpsmVSE2a2zNk8VpXRn1R4J1rPeA7iAzejLaphpS1hG66MuFQSYE5xX8
 99q5Zj4RBalQxa/eHqGiWWDrkdj/4bTdtwbQzcYwPHdQLe/gKFqhvs+bP2ukDMWCM+GJ9teaIJN
 BbbWxJQvUDt6qIpAzY6tgR6SH264WStwIYGziEheYCe/pKtNBH37L0BfNS6MYfVHqcHu0hB7nRR
 MJHBTnTN1TCHT1mFDeyY1E2eb849e9V9qebmmPJ3G6l8yT/Qi7OBLFfm9RWESDG0VcJBztx6eDz
 AicnxmAVNb6weuju7eJohyQ58C2LhJSQM9D61e10UwSJBbRnNBZSRZUWqC7Kb/aRionvQnSduul
 zjqMjUOxClz7AnYacYS1tQhLa45i+46GdnDhe9qUwVsdlfwS4yasfmWSPoaYsK6bOsWNSsrQ8ew
 ECbactI9XXEiSIw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 03 Oct 2025 07:34:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7637

Update the build-docs-container file with newly supported distributions.
These were all able to install packages and build the docs (including
the pdf) properly.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/tools/build-docs-container | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/documentation/tools/build-docs-container b/documentation/tools/build-docs-container
index 108809838..70e05f295 100755
--- a/documentation/tools/build-docs-container
+++ b/documentation/tools/build-docs-container
@@ -34,13 +34,16 @@ $0 OCI_IMAGE [make arguments...]
    OCI_IMAGE is an image:tag of an OCI image hosted on hub.docker.com. It is one
    of:
      - debian:12
-     - fedora:38
+     - debian:13
      - fedora:39
      - fedora:40
-     - leap:15.4
+     - fedora:41
+     - fedora:42
      - leap:15.5
+     - leap:15.6
      - ubuntu:22.04
      - ubuntu:24.04
+     - ubuntu:25.04
 
    [make arguments] is one or more argument to pass to the make command of
    documentation/Makefile, see that file for what's supported. This is typically
@@ -79,21 +82,23 @@ main ()
     #   ;;
     # Missing python3-saneyaml
     # "debian:11"*|\
-    "debian:12"*)
+    "debian:12"*|\
+    "debian:13"*)
       containerfile=Containerfile.debian
       docs=ubuntu_docs.sh
       docs_pdf=ubuntu_docs_pdf.sh
       ;;
-    "fedora:38"*|\
     "fedora:39"*|\
-    "fedora:40"*)
+    "fedora:40"*|\
+    "fedora:41"*|\
+    "fedora:42"*)
       containerfile=Containerfile.fedora
       docs=fedora_docs.sh
       docs_pdf=fedora_docs_pdf.sh
       pip3=pip3_docs.sh
       ;;
-    "leap:15.4"*|\
-    "leap:15.5"*)
+    "leap:15.5"*|\
+    "leap:15.6"*)
     # Seems like issue with permissions package, c.f.
     #
     # Updating /etc/sysconfig/security ...
@@ -121,7 +126,8 @@ main ()
     # Cannot fetch packages anymore
     # "ubuntu:23.04"*|\
     "ubuntu:22.04"*|\
-    "ubuntu:24.04"*)
+    "ubuntu:24.04"*|\
+    "ubuntu:25.04"*)
       containerfile=Containerfile.ubuntu
       docs=ubuntu_docs.sh
       docs_pdf=ubuntu_docs_pdf.sh

-- 
2.51.0



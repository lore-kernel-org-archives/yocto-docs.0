Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF5B5CD5BD5
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 12:05:37 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22267.1763035534049774439
 for <docs@lists.yoctoproject.org>;
 Thu, 13 Nov 2025 04:05:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Z+Y6O00m;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8AC95C10F48
	for <docs@lists.yoctoproject.org>; Thu, 13 Nov 2025 12:05:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2A1236068C
	for <docs@lists.yoctoproject.org>; Thu, 13 Nov 2025 12:05:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8C8D8102F2398;
	Thu, 13 Nov 2025 13:05:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763035531; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=ruEC17Guc/rGoVKc10sGif+iGQbUg1FbqXzNaICSxoo=;
	b=Z+Y6O00m2n56Gh/QPbfVnPzQStlr3wiXkqY5Z2AvSFxxhMJ9qkgNGjATUxl+fFNXFEgWit
	rmkaaODK62jOi2vlCTSFplgWjmo8amk9jCPUyNtG44yq3p0P4rXgPYavMIxhKRwTjB84QM
	PQtM3U7G4u2pz4squhWZ1hIiMe5yoFIEOKl19JWzUSq7idMYQHKm2qsQWvx2nnU64ppU6d
	T7tdv2tv9yKE9oK/Bu6Xok+V6ECXoPr0Lby8FTSgnUngXkl07qq1mUrKa0Dgi4pC+H3cM8
	4UW7MGO8vG4oTBs7v4o6l0ryx6tHrq0nS7sP+FddKpiSCQW3DFeOnZidN2LRUg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 13 Nov 2025 13:05:22 +0100
Subject: [PATCH] tools/build-docs-container: add support for ubuntu 25.10
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251113-add-ubuntu-25-10-container-v1-1-700481817327@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAIHJFWkC/yXMTQrCQAxA4auUrA00YyvVq0gXM5mocZHK/IhQe
 nfHuvzg8VbIklQyXLoVkrw162INdOiAH97ughqbwfVuJKIj+hixhmqlohuReuTFileThIOcWsN
 hms4MbfBKctPPPr/Of+cansLld4Rt+wL8osgFfgAAAA==
X-Change-ID: 20251113-add-ubuntu-25-10-container-4e6511cb889c
To: docs@lists.yoctoproject.org
Cc: Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1447;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=WmvWuJS/wjX6l36zVdgfeRrng48z/3c8oS+TP7cF06k=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpFcmLVShmSbMJM9DeoMAcqZNziUaSRaendGd9H
 R9QaS9gByOJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaRXJiwAKCRDRgEFAKaOo
 NrD+D/99DVEV6d/KZBDnlAEB6DXE6ebSPdg7rP1hnHBEW/+sjQ5BDNG6uurO+YGxguE3P/aGs5S
 IbX10drByU+vzroQUuPhqRmrlSCcOtlNdA988X2QY9vUzIPZUq7SIqs6BHEKbE5/Tvs07/1xWmN
 WyUTXtSSDN3piRsIGxyGYhI6b5oVblenuJs/KRfpyosoSMkotFkVdpAIzT2CVTFY4bNqKN9TXJE
 9iYjmaL3jE8401e8beEnu+Ok6ET/XvM9m+NzTNpfTFUImd/V7vRwy5UKEiWN8sPffbU1BON9lwk
 OMfmdCloprY3yHQKGx2NA1q7WDnqxtk06E6+PC/kUo2C9M+xj8L47ZIJlL9dYleonH8HcpMo6lw
 vTdZYYDz5CTjgf2dg2vJjX3yGI8RzrapOtpgMW/OfXNq+Ox2aP5Kj0xDxiYPDv3tXWqqJG/CLlY
 AxGNMfFqaGfSt3b29DSH0am2p6nQmBg2kKP0QlbLSWbeCZq9kzh0DB4olkrJo8FchEN9+Tm1L8c
 FM08TPpb/qEUNPUJaUoSvhvsIujhiiWbOtFizoz/euPM8Z6WdrhJ07jYDoXvDnCHXtM88inGlh+
 G/SwPBfSksLdMa1QekEuDxXifyL39UFS4xNYH+NaCFyrLBrlQ3aw951WKmTXv/doMSpTQ6iz7kk
 L50n3KUvCeqWsAA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 13 Nov 2025 12:05:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8034

Installing essential + docs packages went fine, and building the docs
too (make publish), without additional changes required.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Note: merge when either is merged:
* https://lore.kernel.org/r/20251112224534.3094578-1-richard.purdie@linuxfoundation.org
* https://lore.kernel.org/r/20251111-contrib-mathieu-ubuntu_2510-v1-1-4e50cc96eb00@bootlin.com
---
 documentation/tools/build-docs-container | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/documentation/tools/build-docs-container b/documentation/tools/build-docs-container
index f97cfc402..b91a6daa9 100755
--- a/documentation/tools/build-docs-container
+++ b/documentation/tools/build-docs-container
@@ -45,6 +45,7 @@ $0 OCI_IMAGE [make arguments...]
      - ubuntu:22.04
      - ubuntu:24.04
      - ubuntu:25.04
+     - ubuntu:25.10
 
    [make arguments] is one or more argument to pass to the make command of
    documentation/Makefile, see that file for what's supported. This is typically
@@ -121,7 +122,8 @@ main ()
       ;;
     "ubuntu:22.04"*|\
     "ubuntu:24.04"*|\
-    "ubuntu:25.04"*)
+    "ubuntu:25.04"*|\
+    "ubuntu:25.10"*)
       containerfile=Containerfile.ubuntu
       essential=ubuntu_essential.sh
       docs=ubuntu_docs.sh

---
base-commit: f2f43657b0cee198d569f26989dedc06929224ec
change-id: 20251113-add-ubuntu-25-10-container-4e6511cb889c



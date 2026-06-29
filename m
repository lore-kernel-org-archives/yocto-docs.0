Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DBB7C43458
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 13:31:45 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.92173.1782739900909161889
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Jun 2026 06:31:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=IxGAglZX;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 367054E40B6B
	for <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 13:31:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0BF665FF96
	for <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 13:31:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5568C106F17F9;
	Mon, 29 Jun 2026 15:31:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782739898; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Z7im7NK5H4VBfTHJ9o8dLs163O05JH1YkvVevw0BxoQ=;
	b=IxGAglZXRAfN9moM+IiE1ByTge9rIRwn6Cy6sF5PUDvXx+A9+UOSKX/db92EUEwwVOX9Ub
	jgQYLN2s6YK1iNG/8W4HkRYSwAWW7cJfhvn/aN59r+DYxmEYNTpJwbFqqe/ewgj93UZq/y
	SnnABerr87ximThhExHHNEivGByH96Y9ZfYtuik1SWhC6XhIarVaQ0806JqEQ/dxjgLEHr
	LOiWoKLqNZcr62MMplF//O7UwZKxrmkpyBnVAgmNcIxGEnCdVuqr3DwSqPON5OzS7rcjfU
	ZWfe0qxt0yC+VYG/gQicFP+mC920uWP43lpET/PWlRSFvfx5LiKRBwjE+7lfsA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 29 Jun 2026 15:31:33 +0200
Subject: [PATCH 2/2] tools/build-docs-container: drop Fedora 42 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-remove-fedora-42-v1-2-b55005c6e434@bootlin.com>
References: <20260629-remove-fedora-42-v1-0-b55005c6e434@bootlin.com>
In-Reply-To: <20260629-remove-fedora-42-v1-0-b55005c6e434@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=895;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=sxMbuFgzFdr/n8/HEyGPuP52ef0pehJZv/Jqep+KXgo=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqQnO4wpp85x3SsoPMtPpegmmbzhbFCoiG3D9Ye
 CLVKGy/SfWJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCakJzuAAKCRDRgEFAKaOo
 NoVnEACaiNXzz34cgDNE89dw7RoiGzPjmHt1qDQ5WBuVTwJQaTwlDZGn4MMXEcrLmNY/rC9jrpF
 O4TAUN5DrSfx2gS6qtxZhb4uMlX6vh/7z9B8aF0oM2cbI5Afm3gtthf28PXQfIZth2P5ZJVrFK2
 1WQKNs0gZ5kqhu680soKmjVEiwrXvFHzrvYOJlJ188Dn5gvqYLbYGo7a3WtO/APHOxxOr69vvnW
 Isd9AeN/J/NPSkAUQjEh5GwKiyn4aHQqc7gOlMy1OQdu0v44P46s7pedcTEfK79IcLYPDuH4GJl
 sA6gXrPoRtYBZSkpXp81sD4r3SZG7ItLsD99zYas5Yjd5vk086JpviFz6hsa2m5oep5UQjwyu58
 xkThOZVOrB6D08rW9NEgAJKOrq7/OUK91neolBVyLbZgno95vs+nhksPqhwnqPRVMM+P7QvZM6C
 UEr7IgAv5TymqSlZxSSEMg+txazNkD1HgZHVZgKg6fgLpqAdws2wbMXficKIUbWR24xYKGX53x/
 gdDmV9NA7jx6oDlYuKrBS4Q05bDklUGQ+AG9S32jvqHt1cKzzGqoXejH7pW8q9iPqytFS3PbwA/
 bfEopPBwrqET2PsFiHepUA0eoNawTm6Usi4RLjIqSl7nUMjVat6M+RoOgQ5x0j/ztI9iNu+q4Ab
 48lJGNrJtquVYBQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 13:31:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9972

After 366fa2f21bfb ("poky: Remove fedora-42 from
SANITY_TESTED_DISTROS") in meta-yocto.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/tools/build-docs-container | 2 --
 1 file changed, 2 deletions(-)

diff --git a/documentation/tools/build-docs-container b/documentation/tools/build-docs-container
index acce3b3e0..a07e681fe 100755
--- a/documentation/tools/build-docs-container
+++ b/documentation/tools/build-docs-container
@@ -40,7 +40,6 @@ $0 OCI_IMAGE [make arguments...]
      - debian:11
      - debian:12
      - debian:13
-     - fedora:42
      - fedora:43
      - leap:15.6
      - leap:16.0
@@ -118,7 +117,6 @@ main ()
       docs_pdf=ubuntu_docs_pdf.sh
       pip3=pip3_docs.sh
       ;;
-    "fedora:42"*|\
     "fedora:43"*)
       containerfile=Containerfile.fedora
       essential=fedora_essential.sh

-- 
2.54.0



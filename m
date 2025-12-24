Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5844E776EC
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 16:32:13 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.123202.1766593929211834332
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Dec 2025 08:32:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=JE5YTZh9;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B5D391A23E2
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8CCC76073D
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BC4ED10AB1387;
	Wed, 24 Dec 2025 17:32:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766593927; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MRPXv4yB5I83cN9z/3xnhL4oRtgY0gv8CA+EyfwgzVg=;
	b=JE5YTZh9VjRMYgCuHGgKOMaVboR7+fLmjnizRixTNGwWXJjKpoYCUaqwluX0sKW2/wSMDC
	JQyUyni1TPsIJ6edGgQ99YTTbNveA47h8EJXLfph8IV0WfHUY2gVHxwApIwuPTf8KkSO0T
	5mhvkGV6iT7hf4noKcpAeRO75OJKpgHVmQRkcrospy3FfH+ptr7iACvClrlARBDIQXjkCX
	0E39K0v41qeJVxXSeHTEpeYH/cbV9nOkqaM2K7sKOhZgzb+G8/Smad7FI+xV8PDwqHMzP/
	y9TEAxVDarBL1AUpI3Ckn6aezMzaAOnErLpLJ6YHf7UYW6nVE7TRApWB94AV5Q==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 24 Dec 2025 17:31:55 +0100
Subject: [PATCH 29/53] sdk-manual/appendix-obtain.rst: remove obsolete poky
 repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-remove-poky-references-v1-29-658a5f4dbde2@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
In-Reply-To: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=972;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=lShLrZcwEQtoUFO51nQEmpuD7RBiBS3EfVEtL7k0uQg=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpTBVsJjS26rvrZ507ha5lsi9JAYcWwvJXGj4kC
 iqZhCXgjROJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaUwVbAAKCRDRgEFAKaOo
 NtMNEACl2/Wq3RArDqXTX5lC9m2cFDXsDgxK1iZ8s5tHiun98J8L5n01I25a/D5Z4xph3mWVnqv
 clNzp4swcAM2LA5EFo4Vx0vnZuoUP7gDNzkaI17kfB46e0ZXq5Oo20h0CsjkmM45VR7Cg8qcajE
 DqF77QvWWQ1WtPuxKUMTDCKoch4k+PybOGAUXmpJf6I0sfDsrCZfg88LI7cTBWtPt73qORZEHIs
 B5qfQg4QA08gIMMp+Ys3dcKoY9e9h58wsILGQScdKJUY57N9fHn2ZVHyhx2ElI2KsdwKSX15Xu2
 Sanujn0wEXMM5wEPUnrOd+x8WNKvv/6mSI1c58hWMTYIIHl1A71uzvF4gnrwZTnZvL19E/Tggt9
 ZftpX0QbXLrinPViC4a5oEuoGGz+mDL3OWfVynG8h6ZabSv/J8oZ7LWNeNDO0ljBqh+fHQvgFWf
 TMyMoG7IwFj9L0cul+fHeKKrbJhy4VgaW2wftzgD6BKE7qgAkGjZc2KOgUKE2AuH04zd7q6VKXf
 E0X/VZIOrzCIlHOfINRO1ckK88zG+5VnJyOmOJn/PSAZH+Nc0/2t3SzKgcl8Z6IE9DZFjUZlX99
 S8chvj+4UkKjfPfyGmT6afgyy6LqfKjJQMAEQo06cbfXUH9vGTo0mi6G8N4B+oAyTLbZMeyBn+p
 ucUHpS1hZ78sDUw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8358

Rename the source directory to project, as specified in its new
definition in terms.rst.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/sdk-manual/appendix-obtain.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/sdk-manual/appendix-obtain.rst b/documentation/sdk-manual/appendix-obtain.rst
index 33787a225..cc11c97df 100644
--- a/documentation/sdk-manual/appendix-obtain.rst
+++ b/documentation/sdk-manual/appendix-obtain.rst
@@ -149,7 +149,7 @@ build the SDK installer. Follow these steps:
 #. *Run the Installer:* You can now run the SDK installer from
    ``tmp/deploy/sdk`` in the :term:`Build Directory`. Here is an example::
 
-      $ cd poky/build/tmp/deploy/sdk
+      $ cd project/build/tmp/deploy/sdk
       $ ./poky-glibc-x86_64-core-image-sato-core2-64-toolchain-ext-&DISTRO;.sh
 
    During execution of the script, you choose the root location for the

-- 
2.51.0



Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE68ECA6C8D
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 08:19:35 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6046.1769501969135134530
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 00:19:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=stTbCkKF;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7FAD8C211CF
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 88ECA606F5;
	Tue, 27 Jan 2026 08:19:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A5769119A8686;
	Tue, 27 Jan 2026 09:19:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769501967; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=VpYKcDTTcogeqaCVbM4jBAFNeloASAcPE4C0A6b/u0U=;
	b=stTbCkKFuXx4cK8HQez3e/ZcqiT5OwTXkQs1B6sZG5W5wOiciqCjom10s20B8NK6rcjp1y
	Yj4dpzujbYBHuu8HkdZ0g6tsP3HgvbNVw/YvzkNMBfyMi0pM5wHjbujJ0vBVT4mb0IOLUE
	fpjSfAsOuF+BqsODFrkEziUAoOEpnRnWH96K+OqPxMFRD6W+nJ3gYcwYrRRJQAgmlQ5vlO
	3inafwiEg8grLfrgfxjKjIMXMnjcLqcP/D2cUxcmWMj9eguVjoyAjELZxjJgBw3FnGpt9U
	QgsZqvP2bR/F7To8JAQGWODAsxPI3hGZ12NH9NgESw7sq+fjlUyH1JhkyzwbUA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 27 Jan 2026 09:19:05 +0100
Subject: [PATCH v2 10/56] dev-manual/external-toolchain.rst: remove
 obsolete poky repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-remove-poky-references-v2-10-74bf80cc4e5a@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
In-Reply-To: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1144;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=xPKQji/L9AlWcx0v2k/WP7wvR48dGI0uTihbYfUj9tA=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpeHUA3aKqUhMDrtvdOwBIdqE8j3krzNeMBrMwN
 2qfMcKlJvaJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXh1AAAKCRDRgEFAKaOo
 Nip+EADMXlKBwF0HbBqaMMqjRBDAnKGzmnU4M+buG9zUxwRUyyGAA6y5oTi5D79/nkI/jsAHCJj
 9x2qoK65rkXfgsJUQHBUxJxOxLKm+BlD4JdhKY0N6yakqDja9arq80UqKdv5xBXYtQlz04MTu5J
 eOtyVe0uLFhsaUR3v+8EEY4xsBm90zWXmXfJESXJpGhE08J7YzHA3L1DqEtiChX8qEIbo1DGHpD
 RRyNr06+kxXeYvS+D0bdQ59jG7mtwRZKlwO8tqnXX6dj/iw+VuZFv7NDtUeXXjnKrR66m5s3hWS
 xZqxM2/f0taucP+LWOSIVjactz4ycmIgmlcwcDPBIikFhO4zrZ1jhir1mubTflwxq9evUyz2CKd
 Gk9IEFhC5OzfsY0uXIgNUbH9ux2WWBmOt54UxYorGCIHzhZkCh00/UvcZOmhOO7rhC58IkOmcXb
 4WyGaoZpBttqHPZ/WeQfMZYBPyZ0OBTVjqwzQY8/107BuH9emhB6Zf7S9oYff3wee6lBj/9VVOa
 PAWKapq9l4fWq8KAq0IjpH5cIZkBjDrJs4cZkogTydIUAzMayBYOuIhbcwiJfA7EKxW4GmBCMQK
 rCB2V32JXrJ3LFWOTgcvg5m7lEQA0EqxZ3Jjbd83A/Vff4ZzYGR5p7AuoS4AEp1s8dcTfWK5qk0
 YpOjbJBI4oxAWHg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8671

Remove the single poky repository reference in this document, after the
poky repository was obsoleted.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/external-toolchain.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/dev-manual/external-toolchain.rst b/documentation/dev-manual/external-toolchain.rst
index 238f8cf467..29459ea120 100644
--- a/documentation/dev-manual/external-toolchain.rst
+++ b/documentation/dev-manual/external-toolchain.rst
@@ -21,7 +21,7 @@ follows:
 The toolchain configuration is very flexible and customizable. It
 is primarily controlled with the :term:`TCMODE` variable. This variable
 controls which ``tcmode-*.inc`` file to include from the
-``meta/conf/distro/include`` directory within the :term:`Source Directory`.
+``meta/conf/distro/include`` directory within :term:`OpenEmbedded-Core (OE-Core)`.
 
 The default value of :term:`TCMODE` is "default", which tells the
 OpenEmbedded build system to use its internally built toolchain (i.e.

-- 
2.52.0



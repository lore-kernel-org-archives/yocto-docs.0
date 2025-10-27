Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 712E2CCF9E5
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 12:44:34 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web11.31558.1761569066578093913
 for <docs@lists.yoctoproject.org>;
 Mon, 27 Oct 2025 05:44:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=FCk0fcir;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 19B564E41369
	for <docs@lists.yoctoproject.org>; Mon, 27 Oct 2025 12:44:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E4C356062C;
	Mon, 27 Oct 2025 12:44:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 38437102F2507;
	Mon, 27 Oct 2025 13:44:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761569063; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+4BCtbIADW53fwScpGoTggM7qAHEsnil6oj7SfrI30U=;
	b=FCk0fcirH1PEqqP4nqyuvRidy3MY9uKWE3ZAJWMNuAXX7RmZbgryGYcROuK8HxDdt/EGfM
	NuLTJyL3BRs8Ac/0uqOTmUnyEjRCFzkUWvuIYFvMrzuie1y4r4umM/Aitu9KJ2SugOHsrY
	LgPItDC0AmRJzw4wu5xZUagod/EGYG24UINQWrLVEMx1v94X9hzb1jqiBtyPYoGnykw4kO
	gI+cKG/qGw3BPEFqwplNjy8KlioNSiPZV/rWI1mPfuud5I+VdOXqR5LHzAUHDVfZmARMpD
	M/IZJV4Uc6DikT+9OpR9mMJShOZHWYXqZ7CEWwcrZUwPBo0hiJu9UlinxpBveQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 27 Oct 2025 13:43:34 +0100
Subject: [PATCH v3 02/16] ref-manual/features.rst: add new opencl feature
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-release-note-5-3-second-hunk-v3-2-07d36e2380b8@bootlin.com>
References: <20251027-release-note-5-3-second-hunk-v3-0-07d36e2380b8@bootlin.com>
In-Reply-To: <20251027-release-note-5-3-second-hunk-v3-0-07d36e2380b8@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=950;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=cj7d2DOr/ujEJDkHKUCL9SUzqXeF+HBAxmR9x0b2Ke8=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBo/2kEJVbfyhHYvKYCVUFj3n3JtBJNkEdwqYy3E
 WVkUAVG6+CJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaP9pBAAKCRDRgEFAKaOo
 NgblEACyLDqYpAJbXOIGy1ylYhFTNzGvNjsZvLb1D0yf8lII1uqnxDnnbfsQHJB1Gv00DF9gd+T
 ZtoAS53hAtfnORReB5n30kPGDq18iITSe6S8vZg9QenmdUOyc0vI6zE6aDrIaKJDQeQ304qQFcf
 SVBRB15QbELJPyoZAjn+kkABx973N7rp/ROj7F6VibrddezcNlKsjh6jMAnDZpqzv35D1fHk7e0
 MdajhagRySCOhlm6Z0zTI8ZScgkrCU6sm4DUsWJ4k5s/MLI/eaWVDnlPkDRiK4+wx2g9jIzEspn
 9IuOqh79NAXOMxS5Jmdau8JVC0kAaNxUHFDYBMJOV5P6RpxvzqrP/rWklTU7EZYIBc8Tzd5ibTb
 9N7wGXkm6Ii+ih+BhST2SVoCq60b5m3mg6SCt3gk/gtk9pQasNA6VtbEmzd15bpluwypsYQ/XPk
 AzmPZIcpRhK1BAl3MRABdNoy+vHzwIN+ZnRINWqj7CviBuWdO7S741LfXhhQxqaoF/HuLXVvUPY
 Zep0jIX/oCqkeXsJ4NjSHT44soZ8L9UrwErAVv6Y3J3+0Ub+z4ycEU8n3dn7ZJKtgIagMDCK+Ur
 qoojUr0D6EFseAIUiVY+LjzCturAA8rWuC4chbQKDwz8QyRcRuumy2XuY6tLyhb1uiH0/GSjSso
 gZVO0zJC3XGAi1A==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 27 Oct 2025 12:44:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7851

Added by commit 3061d6061e74 ("mesa: add opencl DISTRO_FEATURE") in
OE-Core.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/features.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/documentation/ref-manual/features.rst b/documentation/ref-manual/features.rst
index 2c074ab9c..b295ab44e 100644
--- a/documentation/ref-manual/features.rst
+++ b/documentation/ref-manual/features.rst
@@ -180,6 +180,9 @@ metadata, as extra layers can define their own:
 
 -  *nls:* Include National Language Support (NLS).
 
+-  *opencl:* Include support for the :wikipedia:`OpenCL (Open Computing
+   Language) <OpenCL>` framework.
+
 -  *opengl:* Include the Open Graphics Library, which is a
    cross-language, multi-platform application programming interface used
    for rendering two and three-dimensional graphics.

-- 
2.51.0



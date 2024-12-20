Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43418E7718F
	for <webhook@archiver.kernel.org>; Fri, 20 Dec 2024 12:17:12 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.150879.1734697026986918146
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Dec 2024 04:17:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=dsipfVXQ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8079840011;
	Fri, 20 Dec 2024 12:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734697025;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uZheYuuZnJEe81iRaP0oEIq21sQbLqGdhzJgNO2jBDQ=;
	b=dsipfVXQQC4bBj5KFwSKcfQA1bk+jJqztbMXZvv7+F97lWhG0jUf4BVgTGHfksx6hc0lri
	LF2H8hhSi0+tbgxk2TPgUOH7hKdjBWUJ7CB7mAgCYoUCly/ef7LNQWarb1gfW1Hppv23WE
	C4OeGQEQlQXxkn9P2G/LJee83e8xOGkilsML0CMGLCJaHj0aCiO02BoA83bCIvHSc22rVB
	sJ6eR7vQzVMRsTR67/qh3yCkT/2t/HlluKPoi8f1tujCYDhBWHGQTjvJCoqJPwEcMR/mu2
	PGUFrH17xC5MaFmlVUJpR9VBUhYkgwdlHcL2EPZsGqxCw2jtwbWJa3Gx89dCbg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 20 Dec 2024 13:16:34 +0100
Subject: [yocto-docs PATCH v2 07/14] ref-manual/classes: document the
 cython class
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-release-note-5-2-updates-v2-7-df29527f3fc5@bootlin.com>
References: <20241220-release-note-5-2-updates-v2-0-df29527f3fc5@bootlin.com>
In-Reply-To: <20241220-release-note-5-2-updates-v2-0-df29527f3fc5@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1016;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=FAa4jdp51NAoRvSTWvTy4WGz73M0L8k20iM/qF4JdJY=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnZWA+gDxxkNLl36/d+nxe/gKQcL5Z9jvMGpzJ4
 sgymUkV3jmJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ2VgPgAKCRDRgEFAKaOo
 Nk7aD/4+dyWpbIedd3JWjJ/KcAi8maP53qiqCSC9+df2a2LRFErbRRyDE7ubw3GgL7cB/ANj0WR
 hwU5vI5diCMxmHwLocoz5DSZaLxvjr/tsGT0CFruhUSpHk+EguRAYi3JUSbhc2Y6zewHg8bGoPy
 miqdamloe+hXpYE4CQfsGKKxSVa8TMVkEeq2CBfHVTqMnD9JJ+6qE75eO4KFgw+u5w+aQTbaBFC
 4RGgDVuYqYeFcDCCMR5CdFBJU8S9fLOloNd1s9djI8/Y6oKqxR5TYXul+AxsBO7DP3Tid31NZT/
 jdd3WJW9h2nqJCzifwcOUIIYrtEFFAzNjb+ErJnQlg8Z6q+I1y+/ruOot1gRcah+tS7KsEAwNDY
 g/B16eqhL8CAfduaf4FfC0yA4UqEz981CS4OWllx+zBSoDMU9baPc7/Q01yE/YWY7aea5/euGWd
 1q7DCPmKdsO2QIGJxbXKkzDEli9WgJKHwAvaCeRgboqRLnE7vJbCxmVCF/MscfbUfn73zbvzweu
 afxBbP9ULaRfcu5W3h9YqOyKnCXviILWCmswjtARjZTRzAWmHH7bHvat6TTTvrJkGb1YdI13e+2
 uZ7HrNNCC0f8wViqV5lUVzgj13o6m6dIqDGqRCxwC3g9CJ9GjxojwRxwyEAAE13v1Vg68D2dSZs
 ELmbH0rK7l64p5Q==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 Dec 2024 12:17:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6005

Small class added in oecore by commit
64b6e8580842949be58f97f4dff91d1f097c4020 ("classes-recipe: add cython
class").

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/classes.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 3d61d8d7a00b21fcff82a771f9718013fae36694..af9aac928186f6a545d9899a24bd9e3dc80ef2e8 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -614,6 +614,15 @@ You will find some more details in the
 ":ref:`dev-manual/vulnerabilities:checking for vulnerabilities`"
 section in the Development Tasks Manual.
 
+.. _ref-classes-cython:
+
+``cython``
+==========
+
+The :ref:`ref-classes-cython` class can be used by Python recipes that require
+`Cython <https://cython.org/>`__ as part of their build dependencies
+(:term:`DEPENDS`).
+
 .. _ref-classes-debian:
 
 ``debian``

-- 
2.47.1



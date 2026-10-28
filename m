Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37909.1793174722393035124
 for <docs@lists.yoctoproject.org>;
 Wed, 28 Oct 2026 01:05:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=qxeUqCch;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BE1851A1375
	for <docs@lists.yoctoproject.org>; Wed, 28 Oct 2026 08:05:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 92DB660769
	for <docs@lists.yoctoproject.org>; Wed, 28 Oct 2026 08:05:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D94FA1032909C;
	Wed, 28 Oct 2026 09:05:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793174720; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=KoAYpQmnzSb1EoD0Sz2nAoPSJAM80WHWHQ5YAOUtRkk=;
	b=qxeUqCch2oKg8mx0AxhL8q3X4F93vbq0O3xnOaMMr020Z0ju7KU0ydypEnGGk0ifxeB09V
	1XKG1UUgucrqUsThAMUvt0KZq/0wLAcSHvfkhjK085QeTzMJCGrVKn8ukrNhdTLfFsl3i9
	qe5urA+VSZJSy3kz784oVq93hkH9HAb7RV7zPekQ4bQbFWtfQQsy4rO7lsQiTJjtjQD8jq
	qtD7L4338Expr3GhJIhcAUUqyZleXnXBw7ySnk2m1N668VRGkTwpAGXYG18uCMIS7gIiY3
	eb0HjLyXM8n9IDGtoLsB9Kxox1uA1VV/qA/yKSjm+eUrHwiEfGkGR518N6CkDA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 28 Oct 2026 09:04:59 +0100
Subject: [PATCH 7/8] index.rst: link to the tags overview page for
 splithtml
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-tags-v1-7-d5ad01019eae@bootlin.com>
References: <20261028-tags-v1-0-d5ad01019eae@bootlin.com>
In-Reply-To: <20261028-tags-v1-0-d5ad01019eae@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Antonin Godard <antonin.godard@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1492;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=Jr6jUpTgj5LdOJe7WlQn3Q6fJIlu5wzxTfPTG1cPLpI=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBq4ay4QpwjrugJQbfCzmiiJUPLFm1Qgtdzzcj6V
 gCPmHwc/J+JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCauGsuAAKCRDRgEFAKaOo
 NtYTD/wP1gFQgV9G1A7y9dpi2/e5V+TIAhqDuxYz/jdA9MEuq3LfrjWKLIbnlvwzxbAMp53FtbO
 DfoIHzbtbs1AlEMyHS7Cp6ZBx595h8XRrM4xDmRymafc2AOzNdPwkMwo8lLG+WuIBG4kxzn0Gtr
 TwLGWMtIkDF72ml9PWNkyiQgO8SqMM8U7MPM6ZaveL4hRPxYHbezcZbQHw6M0ngT1WS1Rt+5wUW
 vSJowsqdTjJRD3wDAiw2i4/NE2EuRx1X7AFQa30YpubusR8dWdkgfLFG0ecXTYi1WnceEY4JMal
 jQrxn+TwX10bzSn/xXn74VlJrQHsBk0diDeNqAmcSw+Ai0/EJkcgapSK8fFCTcInWF6nGsR+a6b
 CqbkDDF3+fUoyyiXfTMhgHiXgVjTC/gFUtFM6u7hg2BhK9RjjbGeTLd3+xiNcaMpK0mv4/vCiyN
 ZRbB0pFakgZONDVPw+HCVhLekKcvp0LO/Lrsk0p7P5ex1MGRlk1fmGQqBTdKvugYwAED0GGKRxK
 CADdFA4eCb2iNOndaZZuBJBDV516h4FRIUIr401Yk3Kh0jUuTZ2R1f0ycGqKxWhoOlghM+joM9x
 KLn3uQB0Oe70bQHZcoGImQZYBvbfhLeTqM65rUzldt4zJUBfdM4rXl9ccATr970JxPICX94essN
 h175onYNtmpvgOA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Wed, 28 Oct 2026 08:05:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10735

The sphinx-tag extension only works for the splithtml build type.
However, adding a toctree entry with the '.. only::' directive is not
possible with Sphinx (see the warning admonition in [1]).

For that reason, only add a sentence that references this tag overview
page.

[1]: https://www.sphinx-doc.org/en/master/usage/restructuredtext/directives.html#directive-only

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/index.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/documentation/index.rst b/documentation/index.rst
index 72e51a445..a150ab605 100644
--- a/documentation/index.rst
+++ b/documentation/index.rst
@@ -41,6 +41,17 @@ Additional introductory resources.
 -  `Technical Overview (external website) <https://www.yoctoproject.org/development/technical-overview/>`__
 -  `Tips and Tricks Wiki (external website) <https://wiki.yoctoproject.org/wiki/TipsAndTricks>`__
 
+..
+   The conditional note below cannot hold a toctree directive properly: the
+   toctree addition would appear in all documentation types (singlehtml, pdf,
+   ...). Use a bare sentence instead as tags are only supported in the "html"
+   sphinx build mode.
+
+.. only:: splithtml
+
+   Sections of this documentation are also grouped by categories with tags. An
+   overview is available at the following page: :ref:`tagoverview`.
+
 Contributing to the Yocto Project
 =================================
 

-- 
2.55.0


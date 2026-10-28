Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37910.1793174723568310613
 for <docs@lists.yoctoproject.org>;
 Wed, 28 Oct 2026 01:05:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=cT3FvuIA;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id EBF731A1376
	for <docs@lists.yoctoproject.org>; Wed, 28 Oct 2026 08:05:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B9C3060769
	for <docs@lists.yoctoproject.org>; Wed, 28 Oct 2026 08:05:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6F77F103290AA;
	Wed, 28 Oct 2026 09:05:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793174720; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=iLlBrDdLsuCw2tuRZAiMnQlFMiGROOvfxeaCSrHNn9U=;
	b=cT3FvuIA4RRLVecyblxsWpIfSXPH1ilWMBccvQuUY32mOKqYo9pDphxZenaG0Ma7beQnh3
	MI+MNW7OjWvMNDA03Klu8LR99F3erhBXbUOMkusDYuFYAX6QltpO5KDbzWYHiPSh8/qXfz
	DEOmu5Ur1L201ADcW35lYzAvvnCu3v3zPHHOykSAE15U7bIxS1YdZYHJFeiwoGVf0EqzDx
	bJnrNC/cT+cTi2tyU75GH8Ll3N2+mJQ+2rkkkZPgOKhBbTca3uK9EYjA9wAo3GmFDvngm1
	qCiNm3LlkFQGM5gCnJ1NIWlQX9QJF7GcXWPvnJlBNbqwZ6vxE49HFiiGS2fiVg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 28 Oct 2026 09:05:00 +0100
Subject: [PATCH 8/8] standards.md: add note about document tags
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-tags-v1-8-d5ad01019eae@bootlin.com>
References: <20261028-tags-v1-0-d5ad01019eae@bootlin.com>
In-Reply-To: <20261028-tags-v1-0-d5ad01019eae@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Antonin Godard <antonin.godard@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1106;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=wkLGor74JflFHsf+vNYzw7NMUom0LKzBGrdGGo+QKNQ=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBq4ay4iXaJDZU06Phgd0xGZAGKVnW5GZv+0YeeE
 T1+o2L3sdOJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCauGsuAAKCRDRgEFAKaOo
 NunyD/48UcgPvqRl4xsz4vCJeCNmftv6xjOz9Q928rYrJFFPR1tJ90gBwCVBSa1ARsB6e8xSu5R
 u3fX+dcI1efdemdG4/lp+cGVy43h6x0T1Kwh4Qqam0Flmli/PV+On+BueUhXcuMyR/aRFqnA9yq
 2/O5eIlkmR+tRGehXJWQsW1T4XokxQAiNzPAtcmBBxXADNVtFhlpHbxqBdz7COfj9BboFsSzJ4P
 9dUzfB8TRmESauJDFFSSDzg0ES+KgY0hemHEEFKDhAVI1jzznR8mL1RUEnnds9dwWFYCY0z4RIb
 Z4ZSCFJgKXRgxYpM76wPg0Apj1ZOETBQOYxict8RvNLdwwT2+AN4/gCggER6OHxgL54tv8gZclL
 Dv6a4ZB8MRkajqLyng4Z4hf7D4XDBQodqk2ComzRGGRj92AcGqlaH14+YDGc7BFz/LA8JoMOwgN
 vItnLOXp6CdrZpgiq+HpsRtb+MtmOZGixQ7ibCqY4US/rBeQflip5kEt+N54wh7zYqFgT/gqQk7
 LZxsMlTpl54csQMQnINZr0Lq8STkGAGZqHuY5MSDEI8eSB2T99WA0IxVBxonJW1QKP7SocIfzcQ
 d9iPOtvfT7k6delk9udoD1b4y3IM5Dcby77df9yFSexiYhFG9f+CHY165gH+QnFAo17dLBGvnK7
 7nxGndd231nYuUQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Wed, 28 Oct 2026 08:05:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10736

Add a note on adding tags to new documents.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/standards.md | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/documentation/standards.md b/documentation/standards.md
index 30d48a5bb..64b4cf13c 100644
--- a/documentation/standards.md
+++ b/documentation/standards.md
@@ -137,6 +137,21 @@ Note that only "absolute" paths (starting with a '/') are allowed. The root
 directory of that path is documentation/, that is, :doc:`/bsp-manual/index`
 points at documentation/bsp-manual/index.rst.
 
+## Tagging new sections
+
+When adding a new document, consider adding one or more tags at the bottom of
+the file with the following format:
+
+```rst
+.. only:: splithtml
+
+   .. tags:: <tag1>, <tag2>, ...
+```
+
+When adding tags, try to use one of the existing tags (see
+https://docs.yoctoproject.org/_tags/tagsindex.html#tagoverview), unless none of
+these fit for the document being added.
+
 ## Adding screenshots
 
 The preferred format for adding screenshots is

-- 
2.55.0


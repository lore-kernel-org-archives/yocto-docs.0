Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38063.1793174720372265097
 for <docs@lists.yoctoproject.org>;
 Wed, 28 Oct 2026 01:05:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=0VVKBHVL;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B19A31A1378
	for <docs@lists.yoctoproject.org>; Wed, 28 Oct 2026 08:05:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8722560769
	for <docs@lists.yoctoproject.org>; Wed, 28 Oct 2026 08:05:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9CC7D103290C7;
	Wed, 28 Oct 2026 09:05:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793174717; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PpAr4AG6U26nO2uZE0XUoLGnmN6CukxIqNF6LfzDbAA=;
	b=0VVKBHVLjxj+fgIoWNBjvB/JcXUKAqh6uyglo4UZVXIaPqhFhZHIafpx0DHa94SZxWG3Dz
	CF0orxRWNOsO2rR2E8CW6/3ecYecuPY5AMmLal2WBzhab18agYPcvjPYY+J/S8bAj1UdBe
	kPe92ifF4OcLCW6PrXRFYWw/gEDEsfDnpEdBqnsD9b3CPDRHUhCJOl6Krh8rB0FH6xU2vN
	ghOc+vgrDbEm1WVmKui8MK4yI8eW8420aw56UXaBnq5ndjNLKqPIB4eMSBdt4LNlbkAfGa
	RnQNkFHP9pUvwZ9hGocKNvYFPgRfCFGf3IpZ1Is6ZNOfU90RM/9splphGSq+dw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 28 Oct 2026 09:04:56 +0100
Subject: [PATCH 4/8] sphinx-static/theme_overrides.css: customize tags
 appearance
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-tags-v1-4-d5ad01019eae@bootlin.com>
References: <20261028-tags-v1-0-d5ad01019eae@bootlin.com>
In-Reply-To: <20261028-tags-v1-0-d5ad01019eae@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Antonin Godard <antonin.godard@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1391;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=8ghw6dHYeLpgEuSPNuWaPVZcJvDi8WSQy+v1QsIbZd8=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBq4ay3T4M8tU0C/W42Q6mILCEhG/kae0GMnZn0V
 tcLkk8q7A6JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCauGstwAKCRDRgEFAKaOo
 No7XD/wIeyj+ZM/Mp+GCzrAz5XA6zQZ7toMGiz4OyQeLaLhGqZo1Bb562U/SAhETkDBsTJlWFEm
 W86klEj8bPIYKOn9QDWzMP3QOUNxtZ1n/y+I18unT9JTesVpnY4PPz/Nnq7m7nvQJIvyh4QWLY+
 jfYTzex1HrwLa31wC/W/C/aNLkfu550TofZRgGm4KD0VPofeMCuWA8N5By5g3fbBQu3dCSoRH6K
 xtazOfTrRXmF3UmQXteyxCKZsF7BTxerwXy9Yqdczijll4ad0Jf0OqjHeRkfS/oRVbxSlMgOEPV
 WVXK88KrveT4UgGk0985AYhkSEM0LRRj87YPL2XlGboIcpRab2dRymmwcUQ7s9KwbR9SN87fi4A
 yJZwRWZE60x9Cg+ivznWfxS0yy6mzifb7j76FnZXrbunLsFN4DlxOLUar+/o2CS0yC3wtsmlUmp
 uZuQld3wfC+hGZf29KPrzMhTM51s7Gryj2VEhDP27dEI9IP6SuJkMJ7wXm9D8ms42I7VtJyjjpj
 aCirdQl5jVnBBwh0WDTLDPbHiMLcEfjNsrevw2g2vZKQCES0dPI1OxJsQaM9vF5NVEfusX+xafj
 VhxzlukoPVO7QF8NAAPrAQm7iYFwRepmmKeFcCUNMeFLjjfc45WjRZ3ZXCju01Kdpq4v1KputYl
 lv3oLqzT0lG/bCg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Wed, 28 Oct 2026 08:05:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10732

Customize the tags appearance so that they match our color theme. This
is a customization of the sphinx-design badges CSS the sphinx-tags
extension makes use of when badges are enabled.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/sphinx-static/theme_overrides.css | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/documentation/sphinx-static/theme_overrides.css b/documentation/sphinx-static/theme_overrides.css
index 3823db820..4fe701dc7 100644
--- a/documentation/sphinx-static/theme_overrides.css
+++ b/documentation/sphinx-static/theme_overrides.css
@@ -140,6 +140,29 @@ section#welcome-to-the-yocto-project-documentation p.caption {
     border-radius: 0 0 4px 4px;
 }
 
+/* Custom sphinx-design badge */
+.sd-badge {
+    display: inline-block;
+    padding: .35em .65em;
+    font-size: .75em;
+    font-weight: 700;
+    line-height: 1;
+    text-align: center;
+    white-space: nowrap;
+    vertical-align: baseline;
+    border-radius: .25rem;
+    color: #00557d !important;
+    background-color: #fcfcfc;
+    border-color: #00557d;
+    border-width: 1px;
+    border-style: solid;
+}
+
+/* Remove the underline from the link in the badge */
+a.sd-badge {
+    text-decoration: none;
+}
+
 @media screen {
     .wy-nav-content {
        max-width: 1000px;

-- 
2.55.0


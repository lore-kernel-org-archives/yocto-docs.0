Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10814.1793365128225994473
 for <docs@lists.yoctoproject.org>;
 Fri, 30 Oct 2026 05:58:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ymTBpySK;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 809E51A13C3
	for <docs@lists.yoctoproject.org>; Fri, 30 Oct 2026 12:58:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 506D9603C2
	for <docs@lists.yoctoproject.org>; Fri, 30 Oct 2026 12:58:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8499D10328D09;
	Fri, 30 Oct 2026 13:58:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793365125; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=m4oq80gqr5uCpZy3rxne/7E+Bef6Ux/4QkcKWsbs8QI=;
	b=ymTBpySKwFKgF/5jUKnAQZo+5LrZTjfCYWDYB0B+r23tZ8V0HNHEMQv72053tPzSM/tcjz
	gj68v+XOqBxyw7rqfQD4N/MACvzuu/oTEoDZYs4gQLjBWrbB7roem7C/4k9IxfERnHc1z1
	EGayL24xmuUkEHq9BWmZ9kp8eF3f18N3/LTg8uHNN5vLSy4gSegimH0jnDWduSx0+wAoqW
	8l9q17v5x41lweeGOK06SRHCf+GW4lWiRv5ePeyClSyXCAhjwZWFJKuskMpYqRW3Aodjva
	c6orAYnALwJl47A+U2B+hSmu9ii3zqDSmNiBK26M4p58t9x0gszK3HfwaFByLw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 30 Oct 2026 13:58:38 +0100
Subject: [PATCH 1/2] standards.md: recommend Nimbus Sans instead of Nimbus
 Roman
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-nimbus-standards-v1-1-119ec9b3c918@bootlin.com>
References: <20261030-nimbus-standards-v1-0-119ec9b3c918@bootlin.com>
In-Reply-To: <20261030-nimbus-standards-v1-0-119ec9b3c918@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=931;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=N8Ei5+lDWDsPdv/6rJYQEuLi9BAVqjNswXWx20Si+bk=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBq5JR/Q57PHsc+VVuis5R54z2JYL0cJwNGfI7OB
 I7sMZDdG1+JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCauSUfwAKCRDRgEFAKaOo
 NgNIEACYCYsDaSCbKWLPgiFxpL4EW2idE/SsQA5f78okiCSKf6x7oQ1kAmCnajMKPN0J8SJWclT
 0l2UqTRKWE2INxqVW2ISf3QPvYkb+QPQszPcZ4KAfDcXxh5LYiGzHXawORKEl03yCY3A93Rynul
 OYBFxQYmgVwR4mvV69YYa5NEsdf1InzFXlkUDGwldTaQtWs9lEJhAb4Rj2DtlzkYX7dVZDY6frN
 POLsnYMi29SJg4zy/x48uI4NCPwYNd0fEbe7kqZg+1wWLNwI5+nyNQEexVYhhltPYNPrwvhoZbX
 B5jLecDfZo7Xbmy5kcnu0LqGGkVMj1Hls1IK4iXRUVoLpqmM/1xGaCHchz0RQsRaj4G4QZpQWTZ
 zagdiWUnLnK8WvxzEQEKDVBneiT3asJDVCAmT629yfWQJiXNbDWfJcbyz6R8KLX9nEIs4Iu3JPg
 uNlfo4BAucC3gAS+itwdGERqbDr3poQDyRDgHuYHu62mA6+cyNhI2YeZDkIg3O0fIUy1S993dA/
 C1340xODWVTQ+4Cco7zbQi1uM3eP4RjNTXwpz+BW5XxygMDBv89zcqU2+cONdsgXyNbCBZGJrnf
 A1hAKavWVdu1euEu6yAlteUk2pitYsk2OwiYtACsOD3fX3SBOXOG+T3oo68K6G41zmoXmJ06uFT
 ByBLS7rPvZPQvrg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Fri, 30 Oct 2026 12:58:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10744

Using Nimbus Roman for diagrams is usually a bad idea: serif fonts are
meant for paragraphs, while sans-serif fonts are better suited for
diagrams. Change our standards recommendation.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/standards.md | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/documentation/standards.md b/documentation/standards.md
index 30d48a5bb..1f2a30a22 100644
--- a/documentation/standards.md
+++ b/documentation/standards.md
@@ -203,10 +203,11 @@ arrows and clipart to the new SVG document.
 
 ### Fonts
 
-The recommended font for description text and labels is `Nimbus Roman`, size 10.
+The recommended font for description text and labels is `Nimbus Sans`.
+
 Labels are in bold.
 
-`template.svg` contains ready-to-copy labels.
+`template.svg` contains ready-to-copy text and labels.
 
 ### Text boxes
 

-- 
2.55.0


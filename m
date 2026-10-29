Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10879.1793277425874001258
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Oct 2026 05:37:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=oDrUHxPs;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A47F51A139A
	for <docs@lists.yoctoproject.org>; Thu, 29 Oct 2026 12:37:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 74F0F60360
	for <docs@lists.yoctoproject.org>; Thu, 29 Oct 2026 12:37:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B1DB0103290E0;
	Thu, 29 Oct 2026 13:36:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793277419; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=cJAa/B5KssqUb5XfKucg4HVFByQOX+8VHB41P8LzdcI=;
	b=oDrUHxPs8PpbNfjVQCMhLkBdWCKBFNhhHvWLOl+kGDDsyn6ovCMzCYR0+PsTUfr7+ZliCk
	H7bebMUlbJfhvIU+G3JWYdjxe4M2HPvB3SEBRhJstotxSgC2kZsD8lUpdE2N848hBb0Kbq
	DexlExIlT/+wRJJ4Va5ZzNSWfIrBCwduVpgRqNfrjYRoitGYC/2rh+Pp0K7bEYD+WHq5wq
	lvhIq7o4Yr8h86VFCo4UALrARV4tjhdIPVBBm9dQg/8/Nk5uz7SD9C9dHtuUO6XOqVkZD9
	sAY5eL68CCdeQKSRf8xNmDjThE2TMPnfkehwIVbJAyFvUQ1XlUCnV+NkBtDrSg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 29 Oct 2026 13:36:31 +0100
Subject: [PATCH] AGENTS.md: tell the agent about conventions and standards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-agents-md-standard-v1-1-35d654788176@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDQAxA0atI1gbGkda2VxEX0aQ2gtMymRZBv
 LtTXb7F/yuYRBWDR7FClJ+avkNGVRYwvCiMgsrZ4J2/Vs7fkUYJyXBmtESBKTLeiHzjXCP1hSG
 HnyhPXY5p2522bz/JkP4n2LYdnfR8/XYAAAA=
X-Change-ID: 20261029-agents-md-standard-8aa27007e35d
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1121;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=SaAs6k3oGGTtIj4x4NDw6kd1iFDgS4oxxuZTfUM4twk=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBq4z3QmSLKhEpQsvA/IXjrJkbCXgHiYPgGlOwBy
 WUNZtqtsG+JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCauM90AAKCRDRgEFAKaOo
 No5kD/0RxdLeE/y+HYO7txoM7v13VUQAHXsKwfqWRHNgQCmoAKoFp49E8TG4oIyB0iBdmPDlyan
 u9iFhMXccL4Zmj+cm+axpV/LuUFM7/t///qbezsupl2zzdPVAK9xR9LUjvQJ1TllCCKuU4/AqqO
 3sGYnB3iFJ3l5TEum7LV7psqFHZBh5xBJa5Qu72Kc7BCkx/PJ4jQjHkOUvjkab5uoJLwQgX+4H1
 czDntEOvUC7OYthwoiIqgZ1aNGw3tbPrP1hjHV73RUbOL05UlhlFGuDsMTgOrfv0bYJtFcYep75
 ywoQVKolNStOejIMdvAjujMJIaPmYDRL2UDixtiD1S6dlPKngjqvn+O4ydyciO+xAyiPsmxBUPM
 Pq7K+SxtbNxi7ow+x/A9oqe65mJ2r7pAUXaS1Lt5Q/DtXh/Dx5mKyuUJl0Nq7x6zYO34wFQWUXZ
 +WYTxxtOSoJTVSaX0upESDTDZxxfHJ0vYzeyXJL5yPrkRdaLZCskscj0/aI23ywegDxcX5bobDT
 IIwpnNniXuPoDjz+YndWzoqkvLCbik2vKUZ+jnVgBu9R3wieRAXG5wWJdzzzpPHpO9LGHAp9O41
 vuohuaepD6/PtD38dDZqLqOZppyfkfq+xe3VwEEMePPxaadS0SSsNfhlfDoo4KF03L8TEJPWyuY
 suQ7ZJsH817xbiA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Thu, 29 Oct 2026 12:37:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10739

Instruct the agent to read our standards.md and conventions.rst
instructions.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 AGENTS.md | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/AGENTS.md b/AGENTS.md
index 3f6ff1d7a..a6a040366 100644
--- a/AGENTS.md
+++ b/AGENTS.md
@@ -10,6 +10,11 @@ Guidance for AI agents working in the `yocto-docs` repository.
   PR conventions apply.
 - One Git commit per logical change (e.g., one commit per variable / family of
   variable documentation, or class documentation).
+- The standards described in `documentation/standards.md` should be followed as
+  much as possible when making changes.
+- The formatting conventions in `documentation/conventions.rst` should also be
+  followed when making changes. Those are user-facing conventions about how to
+  read and interpret the documentation.
 - Commit message format:
   - Summary line prefixed with either:
     - the rST file path *without* the "documentation/"

---
base-commit: 7b54854d12f3f2c909727702d39066a3d22a4a40
change-id: 20261029-agents-md-standard-8aa27007e35d


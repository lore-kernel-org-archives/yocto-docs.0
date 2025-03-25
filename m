Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1C25C36012
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 09:21:20 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.61365.1742894478568731465
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Mar 2025 02:21:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=iSNVhozD;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2957344216;
	Tue, 25 Mar 2025 09:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742894477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aKTTno29qvIKpGxkXzknBahRwvrxmhoE5+zXRx+dSM4=;
	b=iSNVhozDMZO3JyDfoBTPusbJ8FGqMUwHVcKnfXkK9h3Z+ROr7o/jlsoeXNPH1NPsbDhVhP
	JItV7Yp35SyEGBwpgLTPKTQEgo/IIhLhXnLqzwdh1JRDqCnMp7fi1/Zdfyb0/MsAUdUftJ
	JUVIA52pgY84W/Ysr+mZY6wZqEW1NgmEMYPRiU+Sq13dPnFUOnl99nCi5OSHjETCKHj87d
	mM/ad7rBBvgSISIFVUp7JWsXbZ5aJbzyfGHdJFqOYbZttQnTMu3PJEgRxW0mwU2RWFBUWM
	5ZE4Tt0RMqOB/cJMLc4Ajy12ab64RUizJPhSoMxZ7d+TNBbZtnQaB6resE6bAw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 25 Mar 2025 10:20:53 +0100
Subject: [PATCH v2 09/12] migration-guides/migration-5.2.rst: add
 information about autotools changes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250325-release-note-5-2-updates-v2-9-19f050d61da3@bootlin.com>
References: <20250325-release-note-5-2-updates-v2-0-19f050d61da3@bootlin.com>
In-Reply-To: <20250325-release-note-5-2-updates-v2-0-19f050d61da3@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1373;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=fYnKZ0kU02InZYHFA9wn4z9KmnsCYzmlFm6eUT2idGM=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn4nWLPCudMeXaJW+TWBGpu+aulAnaJwfOkzW2/
 nktOx3Q0JuJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ+J1iwAKCRDRgEFAKaOo
 NohMD/4ie3CADYhqxOflSf25L0FZRUtZiXZ2nEiQ//Lnz+0oqKqNGRPMjplS8wtM+AjjrcWbflf
 cU/0tlqYKfApXqjoWJdb0T0k4XpWEyGSYXRR6yiNTac5mb/+c68AiC0H/WqOgmsMQH2rSlyw5N+
 W7Lo0H0WjvjvhRfXGrLS04k7xnK77durM2q7xdjK/xHtT6FIW0+ZUZzJr2sCAJaJ3JvmLJ4ypZk
 I5Aebm0e7sIiVBrlOP5sbTVqSQMEOEnMXfCgtmqrEArtoNNjm2ixF+j3jU+GcYo+ffwpmev4gCy
 zoeS7T+I7TkMXBi/oU1kpB4QRIPQsc/MExtGk3txkCe4JOA8KSE2S7/ss2AMyJ3TA+7KWUL/Bc2
 o/FzSaDvS+4hiWYaHBRcAkCA9cXL3yQGxEa/1NX/AdgfIHF1bPn5WD4hHbjdzhlk69Kg576ggNd
 zPuIak4I5eREDVLmW0nSyzjrSp+4e4GuTPJWXdzTXEB8ZV5ITuvLF9mIS3mffxap9TgJI3or0QT
 kZYpgldyR3R+mOQqsxDsYzAXbpcTN5Zi9+VuzcG5g5bmMJFyez1z3pPd9t1UmK/ygAZ1rwHhrH7
 zwDz9zMD/DXKVi2UBhXRBJ5e1BqOD/pkjYBw2KOli/ZKlCYrtE3WwVU/X1CBLdT9tuZqdigG42B
 HfdHJE0kNPQNjIg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduiedvvdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeekuefhiefhgfdtheejvdelledvhfegfefhtdetuefhfffhvdeiudeuvddvteetgeenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrg
 h
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 25 Mar 2025 09:21:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6621

Original patch by Ross Burton:
https://lists.yoctoproject.org/g/docs/message/6466

Moved to the migration manual as it is potentially a breaking change.

Co-developed-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/migration-guides/migration-5.2.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/documentation/migration-guides/migration-5.2.rst b/documentation/migration-guides/migration-5.2.rst
index a5ac33d81..c4ee3fadd 100644
--- a/documentation/migration-guides/migration-5.2.rst
+++ b/documentation/migration-guides/migration-5.2.rst
@@ -140,6 +140,17 @@ replacing is not as straightforward. For more examples, see the commit
 c++/binutils)" </openembedded-core/commit/?id=4ccc3bc8266c>` in
 :term:`OpenEmbedded-Core (OE-Core)`.
 
+:ref:`ref-classes-autotools` changes
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+-  Changes to how ``aclocal`` is invoked means that ``ACLOCALDIR`` and
+   ``ACLOCALEXTRAPATH`` are no longer used.
+
+-  Directories containing m4 files are no longer found automatically and
+   passed to ``autoreconf``. If a recipe fails to configure because it cannot
+   find m4 macros, then usually the solution is to set ``EXTRA_AUTORECONF += "-I
+   path/to/m4"`` in the recipe.
+
 Recipe changes
 ~~~~~~~~~~~~~~
 

-- 
2.47.0



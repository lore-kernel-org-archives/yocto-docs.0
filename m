Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B030C021AD
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 22:06:35 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.5900.1739829992632461261
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Feb 2025 14:06:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=mgh55H7Z;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-38f3486062eso1888690f8f.0
        for <docs@lists.yoctoproject.org>; Mon, 17 Feb 2025 14:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1739829991; x=1740434791; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RB9teFL5hakUyyfc94DwlHzfuR1uVHy6s6ZC0Xah/P8=;
        b=mgh55H7Z1UCUcA7KfNXu4P/wnkl5MAPzCysWcZ3RyqGFwDrVH4dFJ8jnsDfQRx14w/
         TMIbrHpto8d/53fDzfREDj9fxkpkZv/wD+lpu3NH2wDLrwFg5WA7E9f4G5rS3f1ATUQp
         gMo7Koi0wJOOlqUiQalAQuHNafyUsrgvvF5iU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739829991; x=1740434791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RB9teFL5hakUyyfc94DwlHzfuR1uVHy6s6ZC0Xah/P8=;
        b=DbLmNVqAHoX72mwmH5MvK119IXBLfXzqRfB8B1XtWYdQpA+olwwxSNh1++BzqCgl6L
         LNVWJqmj5GtosAyQhHfeCCW3MA8OWAtxEv2HGkPlE3gfbv8dOiyLaFC6phnf2WwzJd3j
         frjcW8fB8n7G5trzlzPI5vb7kYPG1fsYE1FrEv92bCV1ITZAAgrxTGR0OofLdf5QaXdd
         A+fO3GCMwP922K+W3lwLC2DpzvajZEH1FuB1EAk4ZRkzvJIehqvwgsur0jspsoNTBSOu
         ST7otKnhlSHQGugUK9KaOk0KDHWoJsa6oyftYKoawGjrUF1c7H1v6bNx5luds3rHHDmn
         qTQw==
X-Gm-Message-State: AOJu0YzJLdJEndkzK6kHXbU67WJ5Ijezd1L7xh0+FnQUfYxdofvVy9E1
	nAyZshlxlYwQwrGhTXEr5uLNGoWbkLXGaeg8KzIr4ZDn6URBR30B8TLmySebPVu5SlZlnQzsh1k
	d
X-Gm-Gg: ASbGncszAFVRjIjsXiWVN5vdOZ+WYPtcaVW8f4Zkxp3zEMfCVcOa2hHmpufWdb4r/ui
	AcexhEoye6WdLTts6lmvcu0GUpJ7KI+jvqKuCXjA1yE+Sr72ZgJWV19G2qCcgAn3kD0fBAlKcKX
	kEOdGjQ8ZJuF/pYfnWPeXjih2sRIAS1iMPULYr8YLV4cBfbyGNMh+L8TBmUyU2igkqzC7R8PT7R
	fTa/fZwh0Qtmuw0oGJrm2Vtvqlcq86MMuoeIlXCrYgVd+nVCA64+7+jgxR9UZ3HJzJkUKzS5WcX
	sqgHyTOp3jj1ta6kZR4CNO4hLS27i+QyJoxBih/AOUZ2lp/o1vCL3bYvtEDolEnimEK0Y9Un9IN
	TatpmvKjbOqlW+E1Nz9loKx0=
X-Google-Smtp-Source: AGHT+IH2P8n72uqicq0ZKUmNNx2XwriV5drkXSbheVU6uijY6+JzrhbhvQMryEFap+feOLfUEA1+nw==
X-Received: by 2002:a5d:4651:0:b0:38d:a8f7:cb73 with SMTP id ffacd0b85a97d-38f33f43850mr9755504f8f.40.1739829990824;
        Mon, 17 Feb 2025 14:06:30 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.local (2a01cb000deef000fa5d724a12d076e5.ipv6.abo.wanadoo.fr. [2a01:cb00:dee:f000:fa5d:724a:12d0:76e5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259f7987sm13033958f8f.87.2025.02.17.14.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 14:06:29 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: docs@lists.yoctoproject.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: [PATCH v6 2/4] reproducible-builds: change/add titles in the "How" section
Date: Mon, 17 Feb 2025 23:06:16 +0100
Message-Id: <20250217220618.1999362-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250217220618.1999362-1-yoann.congal@smile.fr>
References: <20250217220618.1999362-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 17 Feb 2025 22:06:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6407

From: Yoann Congal <yoann.congal@smile.fr>

This is preparation work for the following commit.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Reviewed-by: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
---
v3->v4: Reviewed-by: Guillaume
v2->v3: Quentin's review:
* Removed Guillaume Reviewed-by (given privately)
---
 documentation/test-manual/reproducible-builds.rst | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/documentation/test-manual/reproducible-builds.rst b/documentation/test-manual/reproducible-builds.rst
index aaf2e4541..b9f671d68 100644
--- a/documentation/test-manual/reproducible-builds.rst
+++ b/documentation/test-manual/reproducible-builds.rst
@@ -122,9 +122,12 @@ The project's current reproducibility status can be seen at
 You can also check the reproducibility status on the Autobuilder:
 :yocto_ab:`/valkyrie/#/builders/reproducible`.
 
-===============================
-Can I test my layer or recipes?
-===============================
+===================================
+How can I test my layer or recipes?
+===================================
+
+With world build
+~~~~~~~~~~~~~~~~
 
 Once again, you can run a ``world`` test using the
 :ref:`oe-selftest <ref-manual/release-process:Testing and Quality Assurance>`
@@ -132,6 +135,9 @@ command provided above. This functionality is implemented
 in :oe_git:`meta/lib/oeqa/selftest/cases/reproducible.py
 </openembedded-core/tree/meta/lib/oeqa/selftest/cases/reproducible.py>`.
 
+Subclassing the test
+~~~~~~~~~~~~~~~~~~~~
+
 You could subclass the test and change ``targets`` to a different target.
 
 You may also change ``sstate_targets`` which would allow you to "pre-cache" some


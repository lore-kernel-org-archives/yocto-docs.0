Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45931C3ABAA
	for <webhook@archiver.kernel.org>; Fri,  2 May 2025 17:22:00 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web10.24761.1746206513185777671
 for <docs@lists.yoctoproject.org>;
 Fri, 02 May 2025 10:21:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N0biLKhC;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7c5675dec99so263570885a.0
        for <docs@lists.yoctoproject.org>; Fri, 02 May 2025 10:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746206511; x=1746811311; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=t5vVHtsIEbQSLYVvYkYVMAwk7fq0YieKFJXg9hk91SU=;
        b=N0biLKhC3haeXBHvPEVElFeyzqWa/xbPZW9qKlEOHl7Eq1yTmmMcQQRO2dDNfhksO9
         Mq8xkRtm8987bQwxukOl6cbPILDtfR5w1njwTE65TcNNg7631XAZ2wh1vZRbDIZi5pir
         /8xaFHG/r7hjA9bbxQDQNtxhG1PhY+6nKU8F7f2qOlvmWjdaBIDcuSLnRm6IsZL2q4Q7
         eYPCthUNo8f0l4kxcREg6zEDBPbMizN16UKkdOyb48OQsS3R02RVzbKy1ShUh0VnnPoB
         LRZx7vrGHVTNWnsiiC8Y/dZ3sDz4F2qoJIwnKpzm82uzQpnVfpRb8P1wRmn/ctsKnaiS
         l4ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746206511; x=1746811311;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t5vVHtsIEbQSLYVvYkYVMAwk7fq0YieKFJXg9hk91SU=;
        b=mD/t+dKIi31clUnXkje+JPaLIh9OOow/VJe715bOupHe3DpItIg+XJ0XyJTlkiPjzG
         H60eCzlrCZXno3vcCNVRtgG3tZTqw9IxOCTTgTbS/UvV3wtbswFRD+tb28LODN2yRdaB
         yLfdGkdVqTjrPf2Jtstn7+FW0ui7adGRzKoZNykE5i1qSntgVw84AmlAYqWMiCCqg7a9
         eor5JObtxT4F7qctkBKTTgzV3o+W2fTSpzHgB5XKdGVOn71Mp7WF+HG80GdLWTHpwueY
         C59xRHw/cWyPeY2JMXmaMEMRK89UWWaI9EfV0HmrXW2MEczmxUTuZdsFBmdqmjFXHl8o
         wIOg==
X-Gm-Message-State: AOJu0YyWTVG7P6nm5gECbiUZSQJ+Zh5WlyMepCGcjfsCNAf83vu1ADPP
	NmnA5laq8Kf/zpnpuuwpo/HRkelxHIaYFH47Cf1xdQ0Rd0OJxmF1N5NBmA==
X-Gm-Gg: ASbGncthW2kkgNkXH4xqP0ryrHzEuFaXEM1c0QtIC94i+5C0/VPyq9IJC+kOsiSJZ+O
	Vpq9GFDvm4Lgwry9C1g4S++GIniWzL0Z+L++RIJQgpvzt0nEfZ5PUE4a5zUgcq9UWHLf9LYjEO1
	ccF2Knv7cPNyUUxLYGpPCXZF0FNkVm/FsJcuzdfiTlpKfHLBx1nt60bbL1K0MhhNAEhWjePdhI1
	Gnrg4+RYHPVuNRCsKa1vaz4MyBzuHuLE8dY9SU3cvW0Os93oW/0P0W1wjhttYW06Nvzsik74x35
	JlLaBOy60z2O6vBMIpUhPASfzGf3emP41rJjXQhprysDxlngxf/Sx0RLBC4LRQS1y0NOpJKSbQv
	oXvl78CjX
X-Google-Smtp-Source: AGHT+IHD86C1CU2Hyg3SvEsACQAkJVKHb60OV6PZJPVQDopM+eLAC8TfZJeXyxRAh4QOs0Ey7X1bdA==
X-Received: by 2002:a05:620a:26a7:b0:7c9:269f:b661 with SMTP id af79cd13be357-7cad5b5c1bdmr538004985a.32.1746206511441;
        Fri, 02 May 2025 10:21:51 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cad23b5f51sm211328785a.11.2025.05.02.10.21.50
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 10:21:50 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH v2] contributor-guide/submit-changes: encourage patch version changelogs
Date: Fri,  2 May 2025 13:21:43 -0400
Message-ID: <20250502172143.31713-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.44.0.501.g19981daefd7c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 02 May 2025 17:22:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6794

Add a section after the 'git format-patch' information encouraging developers
to add patch version changelogs to their patch updates.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v2:
- clarify SoB line
- clarify "this patch was added in v2" line
---
 .../contributor-guide/submit-changes.rst      | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
index 0675aac984cf..6d5d69d7cfb4 100644
--- a/documentation/contributor-guide/submit-changes.rst
+++ b/documentation/contributor-guide/submit-changes.rst
@@ -776,6 +776,38 @@ argument to ``git format-patch`` with a version number::
 
    git format-patch -v2 <ref-branch>
 
+
+After generating updated patches (v2, v3, and so on) via ``git
+format-patch``, ideally developers will add a patch version changelog
+to each patch that describes what has changed between each revision of
+the patch. Add patch version changelogs after the ``---`` marker in the
+patch, indicating that this information is part of this patch, but is not
+suitable for inclusion in the commit message (i.e. the git history) itself.
+Providing a patch version changelog makes it easier for maintainers and
+reviewers to succinctly understand what changed in all versions of the
+patch, without having to consult alternate sources of information, such as
+searching through messages on a mailing list. For example::
+
+   <patch title>
+
+   <commit message>
+
+   <Signed-off-by/other trailers>
+   ---
+   changes in v4:
+   - provide a clearer commit message
+   - fix spelling mistakes
+
+   changes in v3:
+   - replace func() to use other_func() instead
+
+   changes in v2:
+   - this patch was added in v2
+   ---
+   <diffstat output>
+
+   <unified diff>
+
 Lastly please ensure that you also test your revised changes. In particular
 please don't just edit the patch file written out by ``git format-patch`` and
 resend it.
-- 
2.44.0.501.g19981daefd7c



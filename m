Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7B63C282EC
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 03:56:20 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web11.3804.1742270173424209336
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Mar 2025 20:56:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kC8l4pKu;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7c54c52d8easo673238485a.0
        for <docs@lists.yoctoproject.org>; Mon, 17 Mar 2025 20:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742270172; x=1742874972; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=uPwMGvjsWuwLN2ISP9lePmv/xv8eonCBrnh6Q9pyt1E=;
        b=kC8l4pKuVg/rdXUma4kRSstqTvTpMZcsSVWillVhOvZExsLx7pBUEOehAJ9Wfc8Gmb
         vQE281zXO6vgcSTyC/jH8TcFO0RewA1YoqrQaJpYxTY5Rv9zLWXZz0QuT81/Cn1NsA63
         biULNI/3eZrMXZCNdS3ZZVRCl/YSWStS1Y3n2shpy17vmBJ5Rbu0tvuJObs1nZSa5tSg
         uCPAs+uuJXheJB2pH2hMeAdwkdefPgakBJU6Ef1IZjUr3kXUgLVlq6uNaOTzv72qMpCk
         TjLgCsmuWWMYWzKtEfzoivbUeCFzTBi3FcIx4zcg39JLrB+eafD/Pc8fVBE/ydVaDoA5
         fILQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742270172; x=1742874972;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uPwMGvjsWuwLN2ISP9lePmv/xv8eonCBrnh6Q9pyt1E=;
        b=A8+XmSzlIUE8AS36gpHi2cIgPSDxl7SqCHga0SSu+mE7wcZgvR7k+r6WIO/ccTpgdN
         ZLOvDRWl1ursWho+/bwWaaMBrM5Yd4QaVUW8eCbLwmRTVaoQzomi6R6Qz3v3l0OQ+ccm
         aAjVdE08DwtihgPOIdyplYxr6qKuvlW9KBZeYliglVL2qm1XzrgvySLKuL8gNqb1FXt4
         DBiAAkTydAPMwujgmjsL00ry87rhP5mvgXqICUUe74qYIRGzFKS1W6UtE8fjwW9zWLHB
         u4LIU4U1DGJ/4A82RzQyLz1nAfwNJryYwRjHwbzHr9jIAnfZjVEFOTEjrGkdc678PsZs
         0tIg==
X-Gm-Message-State: AOJu0YwzSwWC2qL9Bm6WtIZCvdVth1Z78SwdwAT4ckOcoObQ156g8IcL
	pAWQ2EhZNDEjScWe66WrbASO8uPdPVqabZb4g/GpJH5Bibe6hXkkV+dFXw==
X-Gm-Gg: ASbGncsAXu0gcc1P6PqaQhqnS+Akjm8wwEUA74q3S79nASJaA8scWLIDyYm6URNR2ck
	cH6oZKF2PWLUDTBMMNjeCyrt17m+6qnUel2p9nYEFliwsKxA6xE4sbadaMKQKJoc6UCe4D13M8t
	4uEFiL/An/veUd8PT9auv6adug41aTytCXPzyTStu8h9QH07gpd6Flj79+Lo1FF1xhv/CqN7bja
	m6gxV5WPjDwcGnm8dmqjv61JMGxx86DfPnGpMKtc86eRo4lDCai5+3lOFhOc6a8QGGCax/TQMsc
	8BWdoC1XdR35pjxdsOTRM4iAqf3oxRP8RuchWJsCheEL8+zAJqXuB5ddRWVJvBsmcI7rTTZymdT
	teufRKrUXMp1J
X-Google-Smtp-Source: AGHT+IHjR5U2lnFTgeHcscbIeouaDsLaJTZvWB+DEK1w4CC909BkYyasN3B8xbwXfQUdq+mAp2mUWQ==
X-Received: by 2002:a05:620a:801c:b0:7c5:438b:78 with SMTP id af79cd13be357-7c59b5be82dmr352753385a.6.1742270171667;
        Mon, 17 Mar 2025 20:56:11 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c573d72b62sm673806785a.86.2025.03.17.20.56.08
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 20:56:10 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH] contributor-guide/submit-changes: encourage patch version changelogs
Date: Mon, 17 Mar 2025 23:56:05 -0400
Message-ID: <20250318035605.1221-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.44.0.501.g19981daefd7c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 18 Mar 2025 03:56:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6587

Add a section after the 'git format-patch' information encouraging developers
to add patch version changelogs to their patch updates.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 .../contributor-guide/submit-changes.rst      | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
index 0675aac984cf..5ade6ba5cdef 100644
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
+   <SoB/etc lines>
+   ---
+   changes in v4:
+   - provide a clearer commit message
+   - fix spelling mistakes
+
+   changes in v3:
+   - replace func() to use other_func() instead
+
+   changes in v2:
+   - added
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



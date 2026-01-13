Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DC2CD2F347
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 17:52:24 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.65085.1768326739125132442
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 09:52:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=tg1n/Lhg;
 spf=pass (domain: konsulko.com, ip: 209.85.214.180, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-29f102b013fso72108215ad.2
        for <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 09:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1768326738; x=1768931538; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HI62A5A5xOk1uGxBZLdL8aBpy0M6ai6dQvk5rY85d1s=;
        b=tg1n/LhgGujWZ6y3RBJjom3O6fdP84xhw9k4H9syw2H1T+788FfPD9Pz70G6nirRYu
         orcg7TuffzzBNbbDnGfrw9Vr8CyivwHIZOgL93tBvXxfO2W500klirO+Jxlf5RnzMuv/
         8JFNbURBnd9NapFcDMtGp9fgyvioKs271b1Jg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768326738; x=1768931538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HI62A5A5xOk1uGxBZLdL8aBpy0M6ai6dQvk5rY85d1s=;
        b=BSjGW6Ru8p9ZbVPnBrpgIykd0NPqvqT84rw4U5GzFkGAMLHHjxkCajv3qy9lx5hq8d
         qu2QLAxivZdPMA+Q5srFfu9qQb8Opf4oWlIJ2BndSz9oqmTqkLG5jRzngiyeH68Cuksb
         XcLyIhooRjZv4dX3VAthNCYth78QlX98SoEh+fq/Cejm/fgCBV26cDeyZZY7qD+muL/t
         izO79CGTVE9BFIWh9v9iVhzvYnZFSBsK3b5XvN7LtHUQD5EwKwkS1LevDbKHmBw2+/OR
         +fb2g4A31yEUtAD7f2CmjROjcjI9DclxIIuVJZLBb5t+V4Tz/qzF/tqt/AujU/X0Qzq5
         MAjQ==
X-Gm-Message-State: AOJu0YzqWgLJIzfE91jPEkBcuu6f5A2MXxJv3SJTkS3FPtp5qmcum9LO
	ixRL3BS7pBw+9kzvBIaCJg744hoSAeVwGjkY+9LMRuR3uvOgCuMG+0JQt/iZBMb8uCY=
X-Gm-Gg: AY/fxX51K8XDpiQEeGY9vJeWTaIAq/1vZaYGu1avZks5cNwiQpGQ8rdPzqFNtR/UeMI
	/TBZpQ3AQkF2KFEbwFnpbhSiiLQ1nrXKfVmhCiv6Q7cQ8zDPK5MaxSfsl1GoUpSzVaaPz4bX6xF
	TLOtFS85qqoirYsfTDubUnFa8dZrdTEVbjJiy3KMxXrqdWA2x6MtkF8u/MNDVCos1Qx0TQygPCv
	PK+gLhV5Z+a4yNijVvfKFL4BUaE4S1h+rc7yT4WdIf+I2XjgkUpSlIZrR9JFozpomw3BbE8lKDK
	S7RhLVuL0gPayMrZXQohM3meM8f/SOEdmWQy2omt/RDdvcPIdsq7dW/FfPcr9v/D8lLSBfftiX+
	0jyN/mvkUZ/G4DCGh0mRjBiRXlKArm8vEez2o/FeNtFBYE2PuQeY1tkTi+5PDA+M9DQqUHkxXZJ
	wMRB2IleH96N+x3g6T5UfFszJVsK7WLsNYI8oYT00a2ftOpFUXdQ==
X-Google-Smtp-Source: AGHT+IG3YeL+JhHnyBhc5eRR+uICKIn/7zCNdvtuwo4FUdakVvD3Sjo+xlDRfg9PrdvM+1JwAfKsyg==
X-Received: by 2002:a17:903:15ce:b0:295:62d:5004 with SMTP id d9443c01a7336-2a3ee456360mr203023065ad.26.1768326738343;
        Tue, 13 Jan 2026 09:52:18 -0800 (PST)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cb2b4dsm210625015ad.54.2026.01.13.09.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 09:52:17 -0800 (PST)
From: tim.orling@konsulko.com
To: bitbake-devel@lists.openembedded.org
Cc: docs@lists.yoctoproject.org,
	Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] doc/bitbake-setup: add example of ssh:// uri
Date: Tue, 13 Jan 2026 09:52:14 -0800
Message-ID: <20260113175214.2570644-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 17:52:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8543

From: Tim Orling <tim.orling@konsulko.com>

For private git repositories, we often need to use the ssh git fetcher;
add a hypothetical example to Generic Configuration Files Reference.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../bitbake-user-manual-environment-setup.rst        | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/doc/bitbake-user-manual/bitbake-user-manual-environment-setup.rst b/doc/bitbake-user-manual/bitbake-user-manual-environment-setup.rst
index ec1bdeecd..635e0c76a 100644
--- a/doc/bitbake-user-manual/bitbake-user-manual-environment-setup.rst
+++ b/doc/bitbake-user-manual/bitbake-user-manual-environment-setup.rst
@@ -687,6 +687,18 @@ They contain the following sections:
                  "local": {
                      "path": "~/path/to/local/openembedded-core"
                  }
+             },
+             "meta-private": {
+                 "git-remote": {
+                     "remotes": {
+                         "origin": {
+                             "uri": "ssh://git@git.example.com/meta-private"
+                         }
+                     },
+                     "branch": "master",
+                     "rev": "master"
+                 },
+                 "path": "meta-private"
              }
          }
       }
-- 
2.43.0



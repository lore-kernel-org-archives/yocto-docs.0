Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B311C98318
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 17:29:29 +0000 (UTC)
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3770.1790270968063828981
 for <docs@lists.yoctoproject.org>;
 Thu, 24 Sep 2026 10:29:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=hX6Z2clt;
 spf=pass (domain: gmail.com, ip: 74.125.226.204, mailfrom: twoerner@gmail.com)
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e97e2c7d4so61636241.1
        for <docs@lists.yoctoproject.org>; Thu, 24 Sep 2026 10:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790270967; x=1790875767; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YOMAO0KYNHaTm/dxeUCoFs3hakcUclZRCM9fFCJvjbw=;
        b=hX6Z2cltJ3uWoVSTxNSWrg1ePNhGBVXE4rQpuMNRpnhx0GWP92NsccE+b7+slDkfmt
         nFMqPYQK+qDmFwnG41LcqP3Z7PCUGD38xQ8Vl5VEorvRcj4RKpcJ9IGEtbzzpnGM+UP+
         VhobdhI3eMFFfe8SpxFgGH1h0NBmEYDVFedI+w8cX/bQ9CZnsgW5kLyJG8gdsWSzOXFf
         glXzB286UIYS/lFBjPZle1xlomyyiwQdYts6g0+hFqkK8NY1nxr0CuJ8pJEDM47u6gsY
         teOdabP77B431kPnLDAKnXQsWtrxwy1TYRIKjI4IAj5wkT9wB7+ftOq8L3N+dHvovuUc
         2SvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790270967; x=1790875767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YOMAO0KYNHaTm/dxeUCoFs3hakcUclZRCM9fFCJvjbw=;
        b=2dEV8rV7taALF2mAwcWZP94VlY2ttP2tdM8uFsC8ZFrK6q2SATfCbkOz1XVRYc5o4p
         QuDc/DnjepU/Jk7OSnDkje2o0/ZrFFpYjRhJzWbZb3exkwWC52CflpHIIQafKX74B0ag
         br0vl+TeW8i//jsZ1FWv4g9Qg8dEcTN/whO42jt8QQr9mVjDJ2dD7NLy3/cSpGf1LasB
         WzmN/RQrynGve/A9ytPsbpB723nl9OUz9OK8rzDLKFI6nvQ07mziogjO82LFeZkMqkgX
         lDKEYWNc/BhDYCEWDs5KhSEvn6wfeOV2L+zzADwjRTgb142ooItGCLFc3hee2HxXJzcG
         Z7WQ==
X-Gm-Message-State: AFuF++mLrW12Zpxhc6zKKgQq1WA8RuLHSgk4AyJoOK9nT6LC7+oTehMx
	qwy4yiqvgqQkxWlhpxTYOCwRBFztRbnhkKt7dERE/7O0fxDoq8t1JWnWaYUHQA==
X-Gm-Gg: AYBFou27bE9vRsJHMBkwRg+OPr5mM99TSA6KZQDuRVGA7hDeu/T9H/ij8mSFcpBg8I7
	nUGqzrDcaqAv9no/xhxrE0nbtSXQqNWVuCXGiYd65dPhG2EeVr5Jn17I+G77j9rU7yS/wsKlRZ3
	FUy3zuV6y4XzdUWF1fPs3tJBOrwlU4mRvAW4rD7//dT/J7U3rUQrbIeCa9U9S+Ko8lHHoR14/Bi
	uRiqnZIAQHEM3YqGzuqmGVJrpbfcj0ytuEKmHpEkrUMPkSo+ghZJg6O0LC4ulZ/50uOvEXx11Mk
	mehu2rGtoaimmlp0toHh3+byWZO5/6MYozUGoen+eyBLwpQXnp3DRGL/Nl/wtf1z3YIgXz3IcLt
	6uyRQPTfFt2jkG60UC1kozZCpxcaG0DB3Naausrs0sX40xaMshtz7l6zWxE4A9oPa/QmkTzvPVz
	FegZ0dpXfIm6oVbtB+TqfQMoqf/9E4agOI6r0R8/rXSWnqlXKVFQyCkvPO/S9Lp4purpOfkHhLr
	TqybX4Di1YaZ5TcAkYsA2wfmRbMm2Af+PPZZDdz
X-Received: by 2002:a05:6102:5346:b0:79b:f57e:ea17 with SMTP id ada2fe7eead31-7af1c6921f0mr1764246137.3.1790270951818;
        Thu, 24 Sep 2026 10:29:11 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-98530725838sm1797974241.0.2026.09.24.10.29.10
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 10:29:10 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH v3 09/10] ref-manual: drop "partition" as a wic kickstart command
Date: Thu, 24 Sep 2026 13:28:52 -0400
Message-ID: <20260924172853.2665062-10-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260924172853.2665062-1-twoerner@gmail.com>
References: <20260924172853.2665062-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 24 Sep 2026 17:29:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10632

The kickstart reference documents "partition" as a synonym for "part".
wic does not accept it: its parser registers only part, bootloader, and
include, so a .wks line beginning "partition" fails with an
invalid-choice error.

The synonym was real while wic used a bundled pykickstart, whose command
table mapped both spellings to one handler. Replacing that with a parser
carrying only the options wic uses kept "part" alone, and the manual was
not updated to match.

AI-Generated: codex/claude-opus 5 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v3:
- back in the series: applied on 2026-09-22, then unapplied by the
  master-next rewind
---
 documentation/ref-manual/kickstart.rst | 9 ++++-----
 documentation/ref-manual/variables.rst | 2 +-
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/documentation/ref-manual/kickstart.rst b/documentation/ref-manual/kickstart.rst
index e7cba555a6e1..14aff6025f18 100644
--- a/documentation/ref-manual/kickstart.rst
+++ b/documentation/ref-manual/kickstart.rst
@@ -16,14 +16,13 @@ modifications to reflect Wic capabilities. You can see the original
 documentation for those commands at the following link:
 https://pykickstart.readthedocs.io/en/latest/kickstart-docs.html
 
-Command: part or partition
-==========================
+Command: part
+=============
 
-Either of these commands creates a partition on the system and uses the
+This command creates a partition on the system and uses the
 following syntax::
 
    part [mntpoint]
-   partition [mntpoint]
 
 If you do not
 provide mntpoint, Wic creates a partition but does not mount it.
@@ -54,7 +53,7 @@ Here is an example that uses "/" as the mountpoint. The command uses
       part / --source rootfs --ondisk sdb --fstype=ext3 --label platform --align 1024
 
 Here is a list that describes other supported options you can use with
-the ``part`` and ``partition`` commands:
+the ``part`` command:
 
 -  ``--size``: The minimum partition size. Specify as an integer value
    optionally followed by one of the units "k" / "K" for kibibyte,
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 8f6f4e5998d5..5339721f48b9 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -4587,7 +4587,7 @@ system and gives an overview of their function and contents.
       When using Wic tool, beware that a second overhead factor is also applied.
       This overhead value is defined by the ``--overhead-factor`` option, which
       defaults to "1.3" when omitted. See the
-      :ref:`ref-manual/kickstart:command: part or partition` chapter in
+      :ref:`ref-manual/kickstart:command: part` chapter in
       :doc:`/ref-manual/kickstart` for details.
 
    :term:`IMAGE_PKGTYPE`
-- 
2.50.0.173.g8b6f19ccfc3a



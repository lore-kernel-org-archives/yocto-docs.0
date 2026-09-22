Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B425C982F1
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 02:04:14 +0000 (UTC)
Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1401.1790042644490093566
 for <docs@lists.yoctoproject.org>;
 Mon, 21 Sep 2026 19:04:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=DY/epgTM;
 spf=pass (domain: gmail.com, ip: 74.125.230.204, mailfrom: twoerner@gmail.com)
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-93a222edc62so389623985a.0
        for <docs@lists.yoctoproject.org>; Mon, 21 Sep 2026 19:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790042643; x=1790647443; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nuym+uKse5IvOgoynevyllSXwLPN1g6unU27JUSaS7M=;
        b=DY/epgTM758dg2uIcLg08HVQ5TFplxV/82qaW0eulR7Klwvtq02Fw2VZkOICkewCZz
         BXLDblKnDkdvIiZ11YwGD/ccltFeE5gs9zZC19xJkwcg7F4MHvFi/w3U7H8fQURKevGF
         izaDwpx9nGTAdjZGHYkfucxwAhSa5xDJoXb6/EZAVXzSt8Piw3Bh/YC8ZYjbqSC+ZWt3
         0jScWhIfoGmz6svP3oPQuyoiMHqumBcNBorY0Xw1P/kSTqXf4aTkg99EubFg993S3kPp
         qwNUR59yK0E1PiqCCMUY6O214BgZF4u4BqCaTxkZyc4ZemmvVoKl1aS38jctgz437UBP
         dY5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790042643; x=1790647443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=nuym+uKse5IvOgoynevyllSXwLPN1g6unU27JUSaS7M=;
        b=GfUchIhXn4slrypKNU+skGeP5ejM6xgRXQcKf8vEv0iYexvAhHP2DSEIDmFJO+t7UF
         KatH75YAh9LgVJWoj/heWSzWGKfPzEMImd5X6ngFX6+B8zVP5aBrA4AISAT+zRH+0uJJ
         n6bb8VAyJh3liKFPZwyyR/5GVF7cgYJesuveXEucZS11c1qyzjBwPrgHMpdvLmhQur/C
         UcOh22rbXGndQmt2OPvw802dekOEA85j9npNJhV7han76k0RtbIQ9OFQbpccnt/Sksoo
         pn6rN5v5cAULE80f4F7DKgbgRCAVuACe8vn9pdqXXDNHQLc8f6evZYj0u9feyEBDhcQ5
         M3vw==
X-Gm-Message-State: AFuF++mm2YaNquzGWAcAXuw4GFN5vAimv0tbAmzSn/HWzmW/moZZcMs/
	jKGIWB7Mplb+ES+kn3b+hHqzcakc+YjlMeb4LXgzm7K35zsRvP06eoiGmzspgg==
X-Gm-Gg: AYBFou3jgFaoiaSonkcLGIpUhj2C1ikrBe+4hG5uZ2LoC0cZbA7Jqz/NgZy7xG4OojZ
	yPSLeX9uL7udQ4hc6fWYmJ8JkJgINPfSk43OnleVhYUKkPxMuvgANaW1QqOIGJTb90GxJymGHrg
	7EH3agHNifyykIK2/ExJ3J7+3vuFYh4EITAiIZGesCatBZcWdl/azTpNrRmTZXN55/D89wFaulj
	M+9qbdw5MzNYKy53xZNEjlvvxtvpfuWgtb7yooFEAPfTpMP1jn8D7GGAhocZ/O2FnRf5azDosq3
	1EhK8pNC3zYNobRmTdH3tYhjCD3QRlhIJ1YItSpOPw7u3N6Epw74XuAd2tqafzmGrcgI9pTqTmn
	PXhd4iIx9WUlpdeEm/ZcBFEql9fDTOGhHFJ5ft3FQw68KjQFWRSekghziGm8tN/En2fa8HVA5mm
	d16M2pWFZZU4mBhPTS3S5lNHhU9LkMQlou+8vnChUkZj7B1aIK3A4Gmd8yNcwbaVNFK0oaCe3uL
	v2xqX+pRyFEBnYf+627vDlV9F3ydXXue12buSWCIQ==
X-Received: by 2002:a05:620a:63c6:b0:93b:d79b:9a55 with SMTP id af79cd13be357-93c15f4d4c2mr319793485a.54.1790042643331;
        Mon, 21 Sep 2026 19:04:03 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c1d253165sm16817185a.46.2026.09.21.19.03.59
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 19:04:00 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 09/10] ref-manual: drop "partition" as a wic kickstart command
Date: Mon, 21 Sep 2026 22:03:38 -0400
Message-ID: <20260922020339.481929-10-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260922020339.481929-1-twoerner@gmail.com>
References: <20260922020339.481929-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Sep 2026 02:04:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10568

The kickstart reference documents "partition" as a synonym for "part".
wic does not accept it: its parser registers only part, bootloader and
include, so a .wks line beginning "partition" fails with an
invalid-choice error.

The synonym was real while wic used a bundled pykickstart, whose command
table mapped both spellings to one handler. Replacing that with a parser
carrying only the options wic uses kept "part" alone, and the manual was
not updated to match.

AI-Generated: codex/claude-opus 5 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
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
index 66439ff26e6d..c715dbc19f50 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -4572,7 +4572,7 @@ system and gives an overview of their function and contents.
       When using Wic tool, beware that a second overhead factor is also applied.
       This overhead value is defined by the ``--overhead-factor`` option, which
       defaults to "1.3" when omitted. See the
-      :ref:`ref-manual/kickstart:command: part or partition` chapter in
+      :ref:`ref-manual/kickstart:command: part` chapter in
       :doc:`/ref-manual/kickstart` for details.
 
    :term:`IMAGE_PKGTYPE`
-- 
2.50.0.173.g8b6f19ccfc3a



Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D24DEC02196
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 11:42:48 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.85773.1738582960544705198
 for <docs@lists.yoctoproject.org>;
 Mon, 03 Feb 2025 03:42:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GxXz8ZaH;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-385f07cd1a4so3856446f8f.1
        for <docs@lists.yoctoproject.org>; Mon, 03 Feb 2025 03:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738582958; x=1739187758; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SSmHFP1uIeBbfkwxAGwK1tkjYLstO991q/0QyrgZI8U=;
        b=GxXz8ZaHV5skdHWROd8SHaceNjrd4kFIDgmCALtAiS9hTHKZIQnHDrmAmRE1z1t7AT
         qqisyACMH0/ooxoT3I5cjr8SDQhkHCEQH0GbnBMGpfSYy+pe1Jl4vkA6hUutCNyJO3Kh
         MbmgkXThW/OTZekaU47yr1EbigzLCzE3JCCmekdkFFkTqMEog4SZAJrWFmRmDMHxTQWj
         1pMHRgdIveqsqVPa0aTHkxLVz6bZ2tHuLg+wjP85rQy81GY/zltlFGW8pWmKR2y3d7EW
         f22znW+Lu6MBQxJ2nxTNztWHRHWXLNyNfB5jGuaRUrFvML/C/8agcH/X3CNHDColyK72
         nT2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738582958; x=1739187758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SSmHFP1uIeBbfkwxAGwK1tkjYLstO991q/0QyrgZI8U=;
        b=NTILA6FuQijyrMHgStMv0gyd+Zf4FaDGGjUmHKhnKHwy18P7NOHV2HrxIWcSJb6nwL
         9q492sXjCHX+yuxn5fgzXOCP6v32xqvJyMc/Fzk/Xl9lvdZIKwrOMnblKCDeF0r+Wsfd
         FDDqiNZ0fT4GP5Ez92CQeIDHM6Y/OCojmsFNC8BYmVB5Dd+TGwk6lhUvvQS/htI00Wij
         U8npAis2DBkJrP243/jtMPhgPDPJzJgd3ZwB1UuTW/sFnBEWxE0QqIAaaYrVLi8HBpSM
         aogV0qZinfiN3lHS02Wr8H2yrdZWLdLb7WXVjZ9QvOcU8I27EypgssyE9a8RsZ7+CghF
         RXDw==
X-Gm-Message-State: AOJu0YxvaoReq0rEaElSbqIeaHvRt88U5MJQSodrEXrgIeeIEUxXsE4C
	i0X0WWlm7MYd7qw0A3HFDM2/Zcesb8qvXrvaXrUxzinPxycywxp+/BXzYA==
X-Gm-Gg: ASbGncsCVES3XqrWVxmgTGGtOb/H0NJuyaZc+FyNz2P5MPpT70WdcuKSsfK8tupAFCL
	CY/iuESKpK0G+3773yYDlwyfdi/QaC7Jsxh7LK1zz0ijjQ9JcaORAtc6h5DiUM17/B4InKGJDFD
	pf/+ht7KGmBnfcwdkEv3ZDXuARfcJZSk3eyd+PMo4OYmJlbi1xnpGZ9FPr3RGaT0qRlRa4V6+aF
	Tlf32kgikUviiRffGMknrFqonHY4aoKtVTiMhZxyrDSmOl3rmQHnY3JQ09DGdGCrJWyTHB3R4/C
	WDuD8m4GcDxmyUrszEmnluyiKVWCf0DMdpqlQFK0Ntm9MA==
X-Google-Smtp-Source: AGHT+IGIwxZD4PW9TEJibiH9k0h4y2MD6q9GcFUFgouebctEgZylfjrHY+2zoNj08jIQSEpMHALX9g==
X-Received: by 2002:a5d:59ae:0:b0:38c:3eca:b30 with SMTP id ffacd0b85a97d-38c5194a7e3mr17712556f8f.14.1738582958384;
        Mon, 03 Feb 2025 03:42:38 -0800 (PST)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e244ef41sm154352575e9.32.2025.02.03.03.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 03:42:38 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Antonin Godard <antonin.godard@bootlin.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [OE-core][PATCH v5 2/2] oeqa/selftest/cases/signing.py: Re-enable self-test
Date: Mon,  3 Feb 2025 12:42:34 +0100
Message-ID: <20250203114234.1508324-2-zboszor@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250203114234.1508324-1-zboszor@gmail.com>
References: <D7H6P74CVGDM.3LTRAMF91XPEH@bootlin.com>
 <20250203114234.1508324-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 03 Feb 2025 11:42:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6241

Enable building rpm with rpm-seqouia for the test.

Set SEQUOIA_CRYPTO_POLICY="" to use the default built-in
crypto policy.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/lib/oeqa/selftest/cases/signing.py | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/signing.py b/meta/lib/oeqa/selftest/cases/signing.py
index 51d1c3fa64..9a820ebc72 100644
--- a/meta/lib/oeqa/selftest/cases/signing.py
+++ b/meta/lib/oeqa/selftest/cases/signing.py
@@ -71,7 +71,6 @@ class Signing(OESelftestTestCase):
         """
         import oe.packagedata
 
-        self.skipTest('This test requires rpm-sequoia support in rpm')
         self.setup_gpg()
 
         package_classes = get_bb_var('PACKAGE_CLASSES')
@@ -84,9 +83,14 @@ class Signing(OESelftestTestCase):
         feature += 'RPM_GPG_PASSPHRASE = "test123"\n'
         feature += 'RPM_GPG_NAME = "testuser"\n'
         feature += 'GPG_PATH = "%s"\n' % self.gpg_dir
+        feature += 'PACKAGECONFIG:append:pn-rpm-native = " sequoia"\n'
+        feature += 'PACKAGECONFIG:append:pn-rpm = " sequoia"\n'
 
         self.write_config(feature)
 
+        # Test rpm-sequoia's default built-in policy
+        os.environ['SEQUOIA_CRYPTO_POLICY'] = ''
+
         bitbake('-c clean %s' % test_recipe)
         bitbake('-f -c package_write_rpm %s' % test_recipe)
 
@@ -152,6 +156,9 @@ class Signing(OESelftestTestCase):
 
         self.write_config(feature)
 
+        # Test rpm-sequoia's default built-in policy
+        os.environ['SEQUOIA_CRYPTO_POLICY'] = ''
+
         with self.create_new_builddir(os.environ['BUILDDIR'], builddir):
 
             os.environ["PATH"] = nsysroot + ":" + os.environ["PATH"]
@@ -198,6 +205,9 @@ class LockedSignatures(OESelftestTestCase):
         feature += 'SIGGEN_LOCKEDSIGS_TASKSIG_CHECK = "warn"\n'
         self.write_config(feature)
 
+        # Test rpm-sequoia's default built-in policy
+        os.environ['SEQUOIA_CRYPTO_POLICY'] = ''
+
         # Build a locked recipe
         bitbake(test_recipe)
 
-- 
2.48.1



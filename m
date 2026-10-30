Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19921.1793389211257588799
 for <docs@lists.yoctoproject.org>;
 Fri, 30 Oct 2026 12:40:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SzNTWnxR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so10159435e9.0
        for <docs@lists.yoctoproject.org>; Fri, 30 Oct 2026 12:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1793389209; x=1793994009; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=p2pUtm+bqi1TfyEzfsiee+2UFJPVNt71VUgSMZCJNwQ=;
        b=SzNTWnxRNrcCVFEABsSB0S8pKq8mvVSouxsL3NJZYa7heGpBz4UhjAgDHXZ6P6VcGa
         UW7jCdPfT2amo7hhIO8pcNVeKAsdyLM98Qt404omlHpZL8s8ebHbyiFXVF9iS/TrEnLu
         xxqhmTvA9daI8UD17rLb7cb154yIjx6NHTsRU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793389209; x=1793994009;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=p2pUtm+bqi1TfyEzfsiee+2UFJPVNt71VUgSMZCJNwQ=;
        b=K5dZm59fkbhe6ciT02Y91LAqJ2JmMibA+KI6AEGt6AkDWlbkA5izeKhSVja19jJlF3
         yYTNdzZRiznur77H1JXBS9CjA6hECyGKPEcfYJ6iE9+3KTQSCYTIEDsZqBTnJ6IIs9H7
         U1aChnvsbcugIaL3bn3okZLyXvCUNdXpgzUb0VOTHm/wrBlZa0lqAfhn4V3KvyoPaPMx
         vXXqA9PtS9IPEHl8GeJ65Jc63rkotVV5QJhBi97YyJcKhJ6jLgFlx/CyDc6GtNDwW67P
         lkV2VXXRhMIJbs9ByritCSpF5rPsVfSAKqLp+V0lUq5hzC6oTYfkmbyfAGMvNs25jVMw
         zTKg==
X-Gm-Message-State: AFq9FYIoE5PCSfYGZV/CVj8e5hhHyEnA+AuPWlbwuuYZL0ORZLOa2I0I
	/2+Fo7k+3pr/Sn8cxnPmbSaqrnWh6JStgW0/aS/gpAMYFrJfcw9Z8LHASMA/S7Uzct4rmitCiC/
	wg+Egcv8=
X-Gm-Gg: AYBFou1ON4YJCv+K9HUnhw1p7zlwh+2P378Q01f2vrqX3Kgnfci7KRE8QOGPlr7Xcgc
	4yePhrOmnvxMUzj08NRVbuLxe4fX7vUD2ITiewoTcfZw+CvZ+j4UY7jiNsLL597g0+Rnn4HmysD
	1ZodjLcDVqrt0x8j88DjPsM42eUjH9n0uHq+ZPJCyffmftoquBf4bbn/cpxz8mAmHfKkVECIYGa
	aMXgkZdx/ohpdi1mvKNhwCVoWqhbfvQWLvqWt2K2w4jdVfjF0a2kSFxBDKCSLpxwlkH+D9CgAZg
	W2bDuYAsJYJ2a+xGHKHRQX6J+EYtrb7mQ5k2fC28lH/tusb5JlO1AL6Yf/1mzSOE1AR9qQdvefT
	bX1RLag5/t1VLSXiitOd4SH880tmYm51KVA48vnKpoZau9tmdiuNHVX1H0OSsx8ndHeY8YbUgI6
	Wy812DV4H1QdMvSytHTiVs51jqO67t2FU8VNB2s42eYpjkfqqDd5bu9AY67LczxJEPWc9XRCzyP
	CN1vdn5OYyzPVnOO+HhsKCBLy0tDwIt+9R4WPk2/MaCWhUCE16YGfLzKXhCdmRDFbxEgYCduav8
	liUQhi8p3DyWBkyKq+ttLTyYBLTFOxvaNIuAmiArfImDPIziiD2ZlYpTFxKzXSRR76lsxAi+RDw
	rad4=
X-Received: by 2002:a05:600c:64c9:b0:4a2:180a:3417 with SMTP id 5b1f17b1804b1-4ac14dd1debmr77889575e9.1.1793389208817;
        Fri, 30 Oct 2026 12:40:08 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:50a1:2666:faf3:9570])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abebe33e79sm59804695e9.2.2026.10.30.12.40.07
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 12:40:08 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Subject: [PATCH v2] ref-manual/faq: Add entry about emails on patch merging
Date: Fri, 30 Oct 2026 19:40:07 +0000
Message-ID: <20261030194007.3457700-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Fri, 30 Oct 2026 19:40:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10750
Content-Type: text/plain; charset="utf-8"

Document why we don't currently send emails when patches merge in the FAQ.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 documentation/ref-manual/faq.rst | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/documentation/ref-manual/faq.rst b/documentation/ref-manual/faq.rst
index 3646286a6..6b1707733 100644
--- a/documentation/ref-manual/faq.rst
+++ b/documentation/ref-manual/faq.rst
@@ -88,6 +88,25 @@ Our automated testing includes it through the ``poky-altcfg`` :term:`DISTRO` and
 we don't really need it to be the default: it is tested, it works, and people
 can choose to use it.
 
+Why don't I get an email when my patch merges?
+----------------------------------------------
+
+The project hasn't felt it necessary to reply on the mailing list for each patch
+that merges for two main reasons. Firstly, it would generate a lot of email
+traffic with content that may only be useful to a small number of people and quite
+annoying for other uninterested people to filter through. That could be avoided be
+emails direct to the submitter.
+
+Secondly, sending such emails accurately, takes time and it wasn't felt to be the
+best use of limited maintainewr time. We do track patch status to some level
+in patchwork and there is automated tooling which could extend on top of that but
+it hasn't been possible to fit that into the projects workflows with enough accuracy
+at this time.
+
+It is very easy to check whether a patch has merged by looking at the repository, or
+pulling and rebasing.
+
+
 Building environment
 ====================
 

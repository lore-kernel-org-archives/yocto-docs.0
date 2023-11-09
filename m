Return-Path: <mhalstead@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A855FC4332F
	for <webhook@archiver.kernel.org>; Thu,  9 Nov 2023 17:11:23 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.949.1699549882474135756
 for <docs@lists.yoctoproject.org>;
 Thu, 09 Nov 2023 09:11:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RkZJz/c7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.214.175, mailfrom: mhalstead@linuxfoundation.org)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1cc29f39e7aso8670465ad.0
        for <docs@lists.yoctoproject.org>; Thu, 09 Nov 2023 09:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1699549881; x=1700154681; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tc/hgqPPsoZ2gE2H7r2d0toroO0CMX87dJxF2p/recI=;
        b=RkZJz/c7SLtiZ2FTBPV1t5YyV0fZBOujW8P/u/daQKHnOwU1z8PmSUw1YI9AFix2fX
         IKiq9BqHQMyBQ80U4k9+88DgpD5FEESYelq6T9urFylZ8jFzM3U3MuIBaBYghKQ+BCPh
         brxR9StZS2VJDoLjWYyT0frF55Fz/pqkI5hfs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699549881; x=1700154681;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tc/hgqPPsoZ2gE2H7r2d0toroO0CMX87dJxF2p/recI=;
        b=H2+MMRkI/afsKGDcTfDsMknRRALiHsDi3+j7ht1B7lN5mxlIe7AfYmjJ1IGRNCFIza
         MQxRPkbwWcAidgFv2Ta8O4Tf5ngWRfr/MkEYSWbzh/eBYPzQ0YagTNjQSzIeLf9agifA
         XD5R3yMh2eL9sMuWIuuLFX7m6l+EAeCo3YpyG2qK0t9Vf4hUC10iBKyi7FkcZf0ChNUm
         mUT4aDbwjgvwVsinMjT+z9b2xYnRKNiqxxbbi/VTmcgw56HBrgAP6EXQ91Vpedw9rNU/
         ksQNlpYCpGk+WdOg8FR03XBa2fciApJUGuaaYAiwXBI5FZ0pH+Nq21pTa9oyyeZJXbmq
         fkmw==
X-Gm-Message-State: AOJu0YxZ3jZr1twazr8bOSz+s4GF2znVqLiYZmUrXBnylElPF5GC1A9P
	scQM7dtQiU2ZZFrzUUU0svzdl0D6VgPNLoO5V0fIkw==
X-Google-Smtp-Source: AGHT+IFCt2zCT2RYfqbIP+M9425HLBcNVVCr2N/JOlqVBbOfgEvB9S8wTgAmjrC6X4uVP4rxleGoyA==
X-Received: by 2002:a17:902:d2c8:b0:1cc:42c0:661c with SMTP id n8-20020a170902d2c800b001cc42c0661cmr7298354plc.19.1699549881016;
        Thu, 09 Nov 2023 09:11:21 -0800 (PST)
Received: from yct-dsk.chateau (97-115-100-55.ptld.qwest.net. [97.115.100.55])
        by smtp.gmail.com with ESMTPSA id jc6-20020a17090325c600b001c60c8d6b4asm3767062plb.149.2023.11.09.09.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 09:11:20 -0800 (PST)
From: Michael Halstead <mhalstead@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Cc: michael.opdenacker@bootlin.com,
	Michael Halstead <mhalstead@linuxfoundation.org>
Subject: [PATCH] docs: add support for nanbield (4.3) release
Date: Thu,  9 Nov 2023 09:10:42 -0800
Message-Id: <20231109171041.21715-1-mhalstead@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 09 Nov 2023 17:11:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4611

This adds support for the Nanbield (4.3) release and update the
current dev branch to Scarthgap.

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
---
 documentation/poky.yaml.in    | 12 ++++++------
 documentation/set_versions.py |  6 ++++--
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
index 2922214bc..7a686ac4e 100644
--- a/documentation/poky.yaml.in
+++ b/documentation/poky.yaml.in
@@ -1,10 +1,10 @@
-DISTRO : "4.2"
-DISTRO_NAME_NO_CAP : "mickledore"
-DISTRO_NAME : "Mickledore"
-DISTRO_NAME_NO_CAP_MINUS_ONE : "langdale"
+DISTRO : "4.3"
+DISTRO_NAME_NO_CAP : "nanbield"
+DISTRO_NAME : "Nanbield"
+DISTRO_NAME_NO_CAP_MINUS_ONE : "mickledore"
 DISTRO_NAME_NO_CAP_LTS : "kirkstone"
-YOCTO_DOC_VERSION : "4.2"
-DISTRO_REL_TAG : "yocto-4.2"
+YOCTO_DOC_VERSION : "4.3"
+DISTRO_REL_TAG : "yocto-4.3"
 DOCCONF_VERSION : "dev"
 BITBAKE_SERIES : ""
 YOCTO_DL_URL : "https://downloads.yoctoproject.org"
diff --git a/documentation/set_versions.py b/documentation/set_versions.py
index 354dabe61..a7c4d5af0 100755
--- a/documentation/set_versions.py
+++ b/documentation/set_versions.py
@@ -26,8 +26,8 @@ ourversion = None
 if len(sys.argv) == 2:
     ourversion = sys.argv[1]
 
-activereleases = ["mickledore", "kirkstone", "dunfell"]
-devbranch = "nanbield"
+activereleases = ["nanbield", "mickledore", "kirkstone", "dunfell"]
+devbranch = "scarthgap"
 ltsseries = ["kirkstone", "dunfell"]
 
 # used by run-docs-builds to get the default page
@@ -36,6 +36,7 @@ if ourversion == "getlatest":
     sys.exit(0)
 
 release_series = collections.OrderedDict()
+release_series["scarthgap"] = "5.0"
 release_series["nanbield"] = "4.3"
 release_series["mickledore"] = "4.2"
 release_series["langdale"] = "4.1"
@@ -67,6 +68,7 @@ release_series["laverne"] = "0.9"
 
 
 bitbake_mapping = {
+    "scarthgap" : "2.8",
     "nanbield" : "2.6",
     "mickledore" : "2.4",
     "langdale" : "2.2",
-- 
2.40.1



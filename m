Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A574CA0EEB
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 13:56:09 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.25530.1694526964206109108
 for <docs@lists.yoctoproject.org>;
 Tue, 12 Sep 2023 06:56:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=VGMkQhFB;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-573e0d471ceso3829602a12.2
        for <docs@lists.yoctoproject.org>; Tue, 12 Sep 2023 06:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1694526963; x=1695131763; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m2PrbfCc3PYZc8WTHtyBabscMyslrqovbSo+0VJbKKk=;
        b=VGMkQhFBCwMXbEYdqY7ssUGBepvLG8Pqst/QfS6aYD8DIU9CAyxacPbvGs8RaybHdx
         xEzyS2lonkqjJdQNIPQh5kgKJSFAZJSfbGEVDTWDpd11wjM5ALG4z5qlHVyoeMNeMu+K
         bYx/K0OIbunoORntSM0g+xMQZ5TD0CRM+3VqVcOmWsfzp4VEfRWGW0svoHRUjqegdjk9
         7BZPMn3gQIngyVODRdc07gvfzhXLX2y7g9Wlm/FZgCAPMfS97a6quwMGp9bmCTZ77s1k
         D05IGXUhUfCv6VnDAOXtImYl7EK3utCmGxnxQF6ZwEKgC+pzGmhNwgQQBAvS7Yx/Gkwi
         aRlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694526963; x=1695131763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m2PrbfCc3PYZc8WTHtyBabscMyslrqovbSo+0VJbKKk=;
        b=V0zRfIj+iaKLQpF9d3U2cH1gZ21cBrQMwrw2JYkQo7CLt2ZVWI/uu8McPJd8ZZXmdF
         TC/6MWvX52LykEZpRY4tsbtcmVmvfAmOGQy6t4/H3xwvQ847bIc9bJ37HL8CVRtpeEdV
         kmuhmibcq2MFFqsH90M61dcvSUH5Wk0/Efj5nTbFSOsLePAixO3vanrnMyPL3nB7PVnP
         I8iF/vMtT/3OvF6S7ud/yWUSosPRKboqQNbH9fvKDKbiYqUCz53fzHXJ/T46e1P1rMZ4
         hM48mmmYgUjDMB/WiSD2a548DxzAK38s6X58pl+9fqvbSb3nii07Zo9ayfdQ9W6VSyJc
         +sEA==
X-Gm-Message-State: AOJu0Yze5ZccOkprzKH7DK/q3K2Vc7fJ8l2Ou2UpWQ6fTN3348f+YzYl
	jlgZVhUsxRINRer8LxiXCW5tL3lC1geWmuygjUw=
X-Google-Smtp-Source: AGHT+IFqfcSRihEKObBp2/CC4Aw8k7rgN0NZjKW2VW/33PdWUdx90GDTjhTYDvadBwfxgMHjYEC43A==
X-Received: by 2002:a05:6a21:2717:b0:154:9196:16c0 with SMTP id rm23-20020a056a21271700b00154919616c0mr7649305pzb.61.1694526963108;
        Tue, 12 Sep 2023 06:56:03 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id q1-20020a170902dac100b001bdb85291casm8436644plx.208.2023.09.12.06.56.02
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 06:56:02 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][dunfell] documentation: update for 3.1.28
Date: Tue, 12 Sep 2023 03:55:50 -1000
Message-Id: <f3a7dfd029aa25a0f34ca080d879bb9d3250d05d.1694526878.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694526878.git.steve@sakoman.com>
References: <cover.1694526878.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 12 Sep 2023 13:56:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4211

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 documentation/poky.yaml | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/documentation/poky.yaml b/documentation/poky.yaml
index 15b08723d..0d27d329c 100644
--- a/documentation/poky.yaml
+++ b/documentation/poky.yaml
@@ -1,13 +1,13 @@
-DISTRO : "3.1.27"
+DISTRO : "3.1.28"
 DISTRO_NAME_NO_CAP : "dunfell"
 DISTRO_NAME : "Dunfell"
 DISTRO_NAME_NO_CAP_MINUS_ONE : "zeus"
-YOCTO_DOC_VERSION : "3.1.27"
+YOCTO_DOC_VERSION : "3.1.28"
 YOCTO_DOC_VERSION_MINUS_ONE : "3.0.4"
-DISTRO_REL_TAG : "yocto-3.1.27"
-DOCCONF_VERSION : "3.1.27"
+DISTRO_REL_TAG : "yocto-3.1.28"
+DOCCONF_VERSION : "3.1.28"
 BITBAKE_SERIES : "1.46"
-POKYVERSION : "23.0.27"
+POKYVERSION : "23.0.28"
 YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
 YOCTO_DL_URL : "https://downloads.yoctoproject.org"
 YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
-- 
2.34.1



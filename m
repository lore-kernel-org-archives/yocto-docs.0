Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web09.8778.1612449787644949559
 for <docs@lists.yoctoproject.org>;
 Thu, 04 Feb 2021 06:43:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=A1qs8ZAj;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: tomasz.dziendzielski@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id s18so3676414ljg.7
        for <docs@lists.yoctoproject.org>; Thu, 04 Feb 2021 06:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IYmcpQYrTGbdbXS1tA29S1OQQzbpxObV6dYqDyFvNPw=;
        b=A1qs8ZAjMqSdoUdefyXq3LX/UFO8SeuxC8b4OOJ0MjQZayD6JlwfQENGAdMebJMHXw
         WUao0gChShKF7FO+e417TFQnjAGMmQH4tZfag3mkki0MiW8T9EpGMD04BLu0O1N8HifI
         4LzmfwirYV7Q7vuTwq/Dxrzo2lavSSF2jGv4raAVx7z3u5jHfDkMIqRNY+zxQcWDITNB
         SOfhPO5zcLA23n2nPszh/rVZQrwW/DJOux9TVgONmcCOL4KzBRis6XCKA4sSm4oA0dWa
         ifEBrbImOh4+5VZG+mwZq0Le9BTw6fKH3ycuxw9VosDFyGiecfX+tsL7vSlWkcCf7I4q
         fmEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IYmcpQYrTGbdbXS1tA29S1OQQzbpxObV6dYqDyFvNPw=;
        b=Wbcub0+BYdUEzfCWb32G5nCacerJ9QWo9ALbW+H6LH68+BXFklELMxNmWgzbILcKWk
         AD1AMkt1MgeSElFvmJoLmTGQZC27WEB8IAX3xNInurtaHpUIQoxYwzY007EhbHrzpj8G
         9p2Fav3RS+sjb29//0kW3wj76ZKBpO91n+zgd5BHgZ0Y37OiZaEGUAjSRe7kf0KS8DnH
         dbErogMJJTj1atdRh24173xHdFdRRTdnXGwtuYyYDJXHav1nthuwmv4vadu8r4sL5W3k
         DTv0Iypb97FW4Yu8u+ow+8yNiBYOXSWqwXHdqguvtCRfgcdN+Bc15XAzAvMQzLSAzyRp
         9eyA==
X-Gm-Message-State: AOAM531zbwuEUFtF9rjIE1Owp0lkZxt8gxWoUak+/Xg1A5BrH/O8yb7T
	SXij5J7CGa42DXfS2yO+yqfJ6KGO1KVOxg==
X-Google-Smtp-Source: ABdhPJywE93UPV7U/24oQEZCtQ8Yn3N7rrEyoxvkdT/SR1NpG+V1UgFoIAMQjOekGXwWpy5xIUKkXQ==
X-Received: by 2002:a2e:96c6:: with SMTP id d6mr4972227ljj.273.1612449785787;
        Thu, 04 Feb 2021 06:43:05 -0800 (PST)
Return-Path: <tomasz.dziendzielski@gmail.com>
Received: from localhost.localdomain (h124200.man.tk-internet.pl. [93.175.124.200])
        by smtp.gmail.com with ESMTPSA id z15sm628737lfq.116.2021.02.04.06.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 06:43:05 -0800 (PST)
From: "Tomasz Dziendzielski" <tomasz.dziendzielski@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Subject: [PATCH] variables: Add documentation for SKIP_LICENSE_MANIFEST_RECIPES
Date: Thu,  4 Feb 2021 15:45:45 +0100
Message-Id: <20210204144545.5750-1-tomasz.dziendzielski@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a basic variable definition and its usecase.

Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>

--- related to https://lists.openembedded.org/g/openembedded-core/message/147658
--- do not merge this commit if above patch is not merged to master
---
 documentation/ref-manual/variables.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 2cb37b6a2..2681c9c40 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -6917,6 +6917,11 @@ system and gives an overview of their function and contents.
 
          SKIP_FILEDEPS = "1"
 
+   :term:`SKIP_LICENSE_MANIFEST_RECIPES`
+      Specifies recipes that don't deploy license manifest files and should
+      be skipped during license recipefile gathering in image recipes.
+      Required when image recipe depend on other image recipe.
+
    :term:`SOC_FAMILY`
       Groups together machines based upon the same family of SOC (System On
       Chip). You typically set this variable in a common ``.inc`` file that
-- 
2.30.0


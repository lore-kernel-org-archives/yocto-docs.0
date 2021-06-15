Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web12.422.1623776336191693171
 for <docs@lists.yoctoproject.org>;
 Tue, 15 Jun 2021 09:58:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=r5/0c83K;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id i34so11960538pgl.9
        for <docs@lists.yoctoproject.org>; Tue, 15 Jun 2021 09:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=6buqUznsiQeyPHS7n3TVZlBQSzxlkbG/NJoXqratAuI=;
        b=r5/0c83KjQ1SCipTTdk9wOaMOZVKT4mUkvcrM9xbekZfQN15QJTGhbGHbfTlByZhaP
         4UNldBXNCOsHM7bI4getYpF+X33jTV7j3COKUHYDHDONHnp35ARQFL9+QvM4FwnFx7Uu
         GGNchN7z/63Cq4Tfs29SJz4+/I2p1a27CHRD3eJpGvCGJcbNVZfnUvXU5u/OAI8nhP28
         KLuXB04eWuhdDpusOBIVKomJy9glw/1wkd5Qj8X05vk0s1TCwpDVb7adDimt4UgpDn/w
         1RWLKkZTqkC2Lu4M9cpua9eb1/rHMSeoPYnSrL/R/209DdSfoTZG4uL74qVg5U1C7gkz
         F1/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6buqUznsiQeyPHS7n3TVZlBQSzxlkbG/NJoXqratAuI=;
        b=sOTikQ3PKqeDCT5DHs78grW3Qj+tucr6oVTALM5qW/5fIH4BZnKZER6bWdaSYwznvW
         Afv0MSYLCcF6hkvjLc6nLw6NJD0sCNuzv8ePu1xOSpKqDkGJd4ex0plFi7CcTfPT6vXj
         F6Y/osASZC9+Tu7JGJooIhdjM6plcRFwkCW6uYpKjIzqg99iwO3PzEirYrDxn8FBIXw3
         BQ/UpeJ29/hulPFahT+x4+pilTtNmyiSGPehH7aaCqo20em/RbbtqgPcAL2GPK4TcE0a
         AGWOcGcO66UJw8WPPQJRXyYIhEWuNXyRwOeeRp4klygN524/9o/kRNR/wjJgsZ96ZqvS
         OJPw==
X-Gm-Message-State: AOAM5315rc7TpEmsfwsTUflQkDibjTCSyitx/9NrmVwS/CMplsaIKyur
	uqhK6zFWCdLkLRkKHtE4dIBXqgHJhQOilL01Pew=
X-Google-Smtp-Source: ABdhPJw+Xz5A3boMVLiYj7wYkd2EsJIT0ysrik0ggTe3UshRbIEn+QTsaKecu/wr1CpLg9CvDpffdQ==
X-Received: by 2002:a63:5d12:: with SMTP id r18mr431393pgb.327.1623776335146;
        Tue, 15 Jun 2021 09:58:55 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id z3sm7862741pgl.77.2021.06.15.09.58.51
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 09:58:54 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][dunfell 2/3] ref-system-requirements.rst: Add openSUSE Leap 15.2 to list of supported distros
Date: Tue, 15 Jun 2021 06:58:12 -1000
Message-Id: <a7313e3b1358016fdf1b88e5d845a37ed90773cc.1623775736.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1623775736.git.steve@sakoman.com>
References: <cover.1623775736.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 documentation/ref-manual/ref-system-requirements.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/documentation/ref-manual/ref-system-requirements.rst b/documentation/ref-manual/ref-system-requirements.rst
index bb688772f..d238dc454 100644
--- a/documentation/ref-manual/ref-system-requirements.rst
+++ b/documentation/ref-manual/ref-system-requirements.rst
@@ -67,6 +67,8 @@ distributions:
 
 -  OpenSUSE Leap 15.1
 
+-  OpenSUSE Leap 15.2
+
 
 .. note::
 
-- 
2.25.1


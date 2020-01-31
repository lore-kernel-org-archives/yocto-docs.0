Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
 by mx.groups.io with SMTP id smtpd.web10.1118.1580431945845610996
 for <docs@lists.yoctoproject.org>;
 Thu, 30 Jan 2020 16:52:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ogjx/hgx;
 spf=pass (domain: gmail.com, ip: 209.85.214.195, mailfrom: jefro.net@gmail.com)
Received: by mail-pl1-f195.google.com with SMTP id t6so2020569plj.5
        for <docs@lists.yoctoproject.org>; Thu, 30 Jan 2020 16:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=9x9fff2LHIdeiTL9Sx5zqctVfqfdQmaDidEQ31YdNqY=;
        b=Ogjx/hgxHQJg3wRSLcr8QNe6SbPf2RhmyEmC8agvxCnH9CSb26L/sWbZ2wvu36f9EJ
         x7V9xPeacVOM8j9EM9/xmZFIcz9gu1SP7NCggufyp/8L6axySvVgVeyl6+D5MJovNvq+
         7QB/nntqUl32VULeUXdUNbh1L26THft/53YSDzFfgp1PDdA9nKdBdJp3H3SbJomTzM4a
         +VjT8de6GKvEa9ZcN1g8fblQ04+RaS4rprR8zFlyYIDSAZMhZulcxsb8RJNHyPQ8u0HJ
         JOd+vIW0DGypWsSck+IEyoSujRerPDvj9T1s4Ddv2O3a5JU8uo95IJKYveFZK5fnIlZ+
         K/8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=9x9fff2LHIdeiTL9Sx5zqctVfqfdQmaDidEQ31YdNqY=;
        b=BMg8bjwkSBANxri//0RjAYJvs82KvOwtKtEkiVlo8d846+TISnHhpY4vdEg2zG6yDb
         C5/OYRCjZSoIVoWf3sz0glow0fnK4yH01uT0ZZdqK4EQxzC8KEHsPJaE58u5AZPhKVdY
         MpGyUcJrhZXXxoxY+dupT8GdFpWwoxYW9QB2yCdqgLpdpTw5Kub16rZJ2E2s3avJm57D
         NCRAi1sNC6Ejgx6Lj0UP17EIQ/VR9v54BCynaU3qULqx/XKNykUCTVsEoK7aCoLF42XT
         WPpsk/s5wOM5x99jfcxYxqFDnWcupSTaW5OOopSzWE+ALmse4hz06xH4xCwTRua+7h9H
         A0yg==
X-Gm-Message-State: APjAAAXJsdyleP+omI9cTNSAblgsj5vmsU/NSzISY72Ox2XUCfI8jFkJ
	QijkeAddsH+wGjata/8raAv7eZ0OrfI=
X-Google-Smtp-Source: APXvYqwQVowCZ0xRhXhEJQrHVQ0nEd+CEOxlGlxczhmYTme8cPCC6Og8RWlg8lgjQ4OFJdnrlPzI8w==
X-Received: by 2002:a17:90a:da03:: with SMTP id e3mr9298544pjv.100.1580431945171;
        Thu, 30 Jan 2020 16:52:25 -0800 (PST)
Return-Path: <jefro.net@gmail.com>
Received: from ganymede.hitronhub.home ([172.92.111.32])
        by smtp.gmail.com with ESMTPSA id k29sm8490227pfh.77.2020.01.30.16.52.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2020 16:52:24 -0800 (PST)
From: "Jeffrey Osier-Mixon" <jefro.net@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Jefro <jefro@jefro.net>
Subject: [yocto-docs][PATCH] Adding memoriam to scottrif
Date: Thu, 30 Jan 2020 16:52:20 -0800
Message-Id: <20200131005220.1572-1-jefro.net@gmail.com>
X-Mailer: git-send-email 2.17.1

From: Jefro <jefro@jefro.net>

Added a few comment lines in Makefile to commemorate Scott's
contributions

Signed-off-by: Jefro <jefro@jefro.net>
---
 documentation/Makefile | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/documentation/Makefile b/documentation/Makefile
index 525a7309a..1a33c771f 100644
--- a/documentation/Makefile
+++ b/documentation/Makefile
@@ -76,6 +76,11 @@
 # example publishes the 1.2 version of the PDF and HTML YP Development Tasks Manual
 # for the 'denzil' branch.
 #
+# IN MEMORIAM: This comment is to remember Scott Rifenbark (scottrif), whom we lost
+# in January, 2020. Scott was the primary technical writer for the Yocto Project for
+# over 9 years. In that time, he contributed many thousands of patches, built this
+# documentation tree, and enabled tens of thousands of developers to succeed with
+# embedded Linux. He ran this Makefile many thousands of times. Godspeed, Dude.
 
 ifeq ($(DOC),brief-yoctoprojectqs)
 XSLTOPTS = --stringparam html.stylesheet brief-yoctoprojectqs-style.css \
-- 
2.17.1


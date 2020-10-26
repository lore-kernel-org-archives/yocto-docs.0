Received: from mail-oo1-f66.google.com (mail-oo1-f66.google.com [209.85.161.66])
 by mx.groups.io with SMTP id smtpd.web11.13031.1603722037968828483
 for <docs@lists.yoctoproject.org>;
 Mon, 26 Oct 2020 07:20:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JBKk4AuU;
 spf=pass (domain: gmail.com, ip: 209.85.161.66, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f66.google.com with SMTP id f25so103234oou.4
        for <docs@lists.yoctoproject.org>; Mon, 26 Oct 2020 07:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L0nydHHVcqlVKTyNDd58XZeTFesjVqnpeDunA5tG3kA=;
        b=JBKk4AuUE4cnQbd/pdaP/lS+4LJe3bGKe50UB614Ps73s4qGQfEYgsCJNZNsLiHojw
         Sl5zAJWZK4Wsav5rbDIYn4DOEKpxXCouAXmHSK2D07cG7Fki+4QxorlAMK1hCjIQzjUk
         73EoMaJwQ9l5JLnB6ZP4st5IbtjTef2E3Rdnt4ItSt13S0IsbsLFvi7rcUqHToqVnqlZ
         kJvf1WR4Pd7xvEYztTCuw3woVtMCWvFDFtpfLrRv3B/rh8qwIdcAaiSXbuQUiwgzNPyw
         ueySDCPMe1U+crWkkzR2ottRMNMHUiSL2Oy5Pw4kcDx1EWfiEIDlbf/UVnsH6X7UonzE
         iRhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L0nydHHVcqlVKTyNDd58XZeTFesjVqnpeDunA5tG3kA=;
        b=YeZSfKyH167CTuplYqMeMIgQQ+b5XIcxZGDH9cb9rui4KgrHvvburefIhMNLMcJqOX
         GSQ2N49c7SBfHjRSyw6UUIYdwuX5KsMV5sTf/P740ld957dYlNRJrnW133Ewc63/i++/
         7GaasQ4C3aUUF41YuIjMFVTRj63HIVgniC/7tMZzZekG0o4vvRyjx92o4PR13YhqfaW3
         AlBxmQjqgJudJdPvvq9NDWggkoiSam04gaIytqTp4KZbrXpoH9LoLV9sFlCA1j+o14M1
         fm7JSYFsOg/bXDqu4wfDmTqwr9pLmQoq0Hp+LvqHg7pqPi07zgN1icQDhbmqkHa4V3Es
         3URg==
X-Gm-Message-State: AOAM531aCkqi2HL2YEy4jgQcvGfbNNFjY3vrsdgXaVqmuvHJ+uc+IfMu
	WFRSPLL4RLq4yoME8S/OFByFLwzr9O0=
X-Google-Smtp-Source: ABdhPJwsUcIBAo3Mv7dqOTnEaCHFDqSAuhUr4CLoP67v5deyj1rww8fJOFDFJasf1jUSm0+bEAlvMw==
X-Received: by 2002:a4a:b78f:: with SMTP id a15mr13841316oop.33.1603722036927;
        Mon, 26 Oct 2020 07:20:36 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id 76sm3628887oty.15.2020.10.26.07.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 07:20:35 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [docs][PATCH] ref-manual: Document wic --offset option
Date: Mon, 26 Oct 2020 09:19:40 -0500
Message-Id: <20201026141940.8884-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds documentation that describes how to use the --offset argument in a
kickstart file

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 documentation/ref-manual/ref-kickstart.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/documentation/ref-manual/ref-kickstart.rst b/documentation/ref-manual/ref-kickstart.rst
index 33d579c5d..7f6d4ebe1 100644
--- a/documentation/ref-manual/ref-kickstart.rst
+++ b/documentation/ref-manual/ref-kickstart.rst
@@ -134,6 +134,11 @@ the ``part`` and ``partition`` commands:
 -  ``--align (in KBytes)``: This option is a Wic-specific option that
    says to start partitions on boundaries given x KBytes.
 
+-  ``--offset (in KBytes)``: This option is a Wic-specific option that
+   says to place a partition at exactly the specified offset. If the
+   partition cannot be placed at the specified offset, the image build
+   will fail.
+
 -  ``--no-table``: This option is a Wic-specific option. Using the
    option reserves space for the partition and causes it to become
    populated. However, the partition is not added to the partition
-- 
2.28.0

